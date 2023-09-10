/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Bill;
import com.hh.pojo.Booking;
import com.hh.pojo.Branch;
import com.hh.pojo.Hall;
import com.hh.pojo.Payment;
import com.hh.repository.StatsRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private SimpleDateFormat f;

    @Override
    public List<Object[]> countBookingByBranch() {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rBooking = q.from(Booking.class);
        Root rHall = q.from(Hall.class);
        Root rBranch = q.from(Branch.class);

        q.where(b.equal(rBooking.get("hallId").get("branchId"), rBranch.get("id")));

        q.multiselect(rBranch.get("id"), rBranch.get("branchName"), b.count(rBooking.get("id")));
        q.groupBy(rBranch.get("id"));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> statsRevenue(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rBooking = q.from(Booking.class);
        Root rBill = q.from(Bill.class);
        Root rPayment = q.from(Payment.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rBill.get("bookingId"), rBooking.get("id")));
        predicates.add(b.equal(rBill.get("paymentId"), rPayment.get("id")));

        String fd = params.get("fromDate");
        if (fd != null && !fd.isEmpty()) {
            try {
                predicates.add(b.greaterThanOrEqualTo(rPayment.get("paymentDate"), f.parse(fd)));
            } catch (ParseException ex) {
                Logger.getLogger(StatsRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String td = params.get("toDate");
        if (td != null && !td.isEmpty()) {
            try {
                predicates.add(b.lessThanOrEqualTo(rPayment.get("paymentDate"), f.parse(td)));
            } catch (ParseException ex) {
                Logger.getLogger(StatsRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String quarter = params.get("quarter");
        if (quarter != null && !quarter.isEmpty()) {
            String year = params.get("year");
            if (year != null && !year.isEmpty()) {
                predicates.add(b.equal(b.function("YEAR", Integer.class, rPayment.get("paymentDate")), Integer.parseInt(year)));
                predicates.add(b.equal(b.function("QUARTER", Integer.class, rPayment.get("paymentDate")), Integer.parseInt(quarter)));
            }
        }

        q.where(predicates.toArray(Predicate[]::new));

        q.multiselect(rBooking.get("id"), rBooking.get("bookingName"), b.prod(rBill.get("unitPrice"), rBill.get("num")));
        q.groupBy(rBooking.get("id"));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

}
