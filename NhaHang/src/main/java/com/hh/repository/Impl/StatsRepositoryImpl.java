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
        CriteriaBuilder cb = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = cb.createQuery(Object[].class);

        Root<Bill> rBill = q.from(Bill.class);
        Root<Payment> rPayment = q.from(Payment.class);
        Root<Branch> rBranch = q.from(Branch.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(cb.equal(rBill.get("bookingId").get("hallId").get("branchId"), rBranch.get("id")));
        predicates.add(cb.equal(rBill.get("paymentId"), rPayment.get("id")));
        String fromDate = params.get("fromDate");
        if (fromDate != null && !fromDate.isEmpty()) {
            try {
                predicates.add(cb.greaterThanOrEqualTo(rPayment.get("paymentDate"), f.parse(fromDate)));
            } catch (ParseException ex) {
                Logger.getLogger(StatsRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String toDate = params.get("toDate");
        if (toDate != null && !toDate.isEmpty()) {
            try {
                predicates.add(cb.lessThanOrEqualTo(rPayment.get("paymentDate"), f.parse(toDate)));
            } catch (ParseException ex) {
                Logger.getLogger(StatsRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String quarter = params.get("quarter");
        if (quarter != null && !quarter.isEmpty()) {
            String year = params.get("year");
            if (year != null && !year.isEmpty()) {
                predicates.add(cb.equal(cb.function("YEAR", Integer.class, rPayment.get("paymentDate")), Integer.parseInt(year)));
                predicates.add(cb.equal(cb.function("QUARTER", Integer.class, rPayment.get("paymentDate")), Integer.parseInt(quarter)));
            }
        }

        q.where(predicates.toArray(Predicate[]::new));

        q.multiselect(rBranch.get("id"), rBranch.get("branchName"),
                cb.function("YEAR", Integer.class, rPayment.get("paymentDate")).alias("year"),
                cb.function("QUARTER", Integer.class, rPayment.get("paymentDate")).alias("quarter"),
                cb.function("MONTH", Integer.class, rPayment.get("paymentDate")).alias("month"),
                cb.sum(cb.prod(rBill.get("unitPrice"), rBill.get("num"))).alias("revenue"));

        q.groupBy(rBranch.get("id"), 
                cb.function("YEAR", Integer.class, rPayment.get("paymentDate")),
                cb.function("QUARTER", Integer.class, rPayment.get("paymentDate")),
                cb.function("MONTH", Integer.class, rPayment.get("paymentDate")));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> countHallStats(Map<String, String> params) {
        Session s = this.factory.getObject().getCurrentSession();
        CriteriaBuilder cb = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = cb.createQuery(Object[].class);

        Root<Booking> rBooking = q.from(Booking.class);
        Root<Hall> rHall = q.from(Hall.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(cb.equal(rBooking.get("hallId"), rHall.get("id")));

        String fromDate = params.get("fromDate");
        if (fromDate != null && !fromDate.isEmpty()) {
            try {
                predicates.add(cb.greaterThanOrEqualTo(
                        rBooking.get("bookingDate"),
                        f.parse(fromDate)
                ));
            } catch (ParseException ex) {
                Logger.getLogger(StatsRepository.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        String toDate = params.get("toDate");
        if (toDate != null && !toDate.isEmpty()) {
            try {
                predicates.add(cb.lessThanOrEqualTo(
                        rBooking.get("bookingDate"),
                        f.parse(toDate)
                ));
            } catch (ParseException ex) {
                Logger.getLogger(StatsRepository.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        q.where(predicates.toArray(Predicate[]::new));

        q.multiselect(
                rHall.get("id"), rHall.get("hallName"),rHall.get("branchId").get("branchName"),
                cb.function("YEAR", Integer.class, rBooking.get("bookingDate")).alias("year"),
                cb.function("QUARTER", Integer.class, rBooking.get("bookingDate")).alias("quarter"),
                cb.function("MONTH", Integer.class, rBooking.get("bookingDate")).alias("month"),
                cb.count(rBooking.get("id")).alias("bookingCount")
        );

        q.groupBy(
                rHall.get("id"),
                cb.function("YEAR", Integer.class, rBooking.get("bookingDate")),
                cb.function("QUARTER", Integer.class, rBooking.get("bookingDate")),
                cb.function("MONTH", Integer.class, rBooking.get("bookingDate"))
        );

        return s.createQuery(q).getResultList();
    }

}
