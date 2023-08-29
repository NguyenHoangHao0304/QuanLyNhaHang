/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Booking;
import com.hh.repository.BookingRepository;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
@Transactional
@PropertySource("classpath:configs.properties")
public class BookingRepositoryImpl implements BookingRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<Booking> getBookings(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Booking> q = builder.createQuery(Booking.class);
        Root r = q.from(Booking.class);
        q.select(r);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(builder.like(r.get("bookingName"), String.format("%%%s%%", kw)));
            }

            String hallName = params.get("hallName");
            if (hallName != null && !hallName.isEmpty()) {
                predicates.add(builder.like(r.get("hallId").get("hallName"), String.format("%%%s%%", hallName)));
            }

            String bookingDateString = params.get("bookingDate");
            if (bookingDateString != null && !bookingDateString.isEmpty()) {
                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    Date bookingDate = dateFormat.parse(bookingDateString);
                    predicates.add(builder.equal(r.get("bookingDate"), bookingDate));
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
//            String fromCapacity = params.get("fromCapacity");
//            if (fromCapacity != null && !fromCapacity.isEmpty()) {
//                predicates.add(builder.greaterThanOrEqualTo(r.get("capacity"), Integer.parseInt(fromCapacity)));
//            }
//
//            String toCapacity = params.get("toCapacity");
//            if (toCapacity != null && !toCapacity.isEmpty()) {
//                predicates.add(builder.lessThanOrEqualTo(r.get("capacity"), Integer.parseInt(toCapacity)));
//            }

            String hallId = params.get("hallId");
            if (hallId != null && !hallId.isEmpty()) {
                predicates.add(builder.equal(r.get("hallId"), Integer.parseInt(hallId)));
            }

            String userId = params.get("userId");
            if (userId != null && !userId.isEmpty()) {
                predicates.add(builder.equal(r.get("userId"), Integer.parseInt(userId)));
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

//        q.orderBy(builder.desc(r.get("id")));
        Query query = session.createQuery(q);

        if (params != null) {
            String p = params.get("page");
            if (p != null && !p.isEmpty()) {
                int page = Integer.parseInt(p);
                int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));

                query.setMaxResults(pageSize);
                query.setFirstResult((page - 1) * pageSize);
            }
        }

        return query.getResultList();
    }

    @Override
    public int countBooking() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Booking");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateBooking(Booking bk) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (bk.getId() == null) {
                session.save(bk);
            } else {
                session.update(bk);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Booking getBookingById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Booking.class, id);
    }

    @Override
    public boolean deleteBooking(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Booking bk = this.getBookingById(id);
        try {
            s.delete(bk);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }
}
