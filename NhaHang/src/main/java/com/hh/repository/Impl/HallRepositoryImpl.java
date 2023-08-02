/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Hall;
import com.hh.repository.HallRepository;
import java.util.ArrayList;
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
public class HallRepositoryImpl implements HallRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<Hall> getHalls(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Hall> q = builder.createQuery(Hall.class);
        Root r = q.from(Hall.class);
        q.select(r);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(builder.like(r.get("hallName"), String.format("%%%s%%", kw)));
            }

            String fromCapacity = params.get("fromCapacity");
            if (fromCapacity != null && !fromCapacity.isEmpty()) {
                predicates.add(builder.greaterThanOrEqualTo(r.get("capacity"), Integer.parseInt(fromCapacity)));
            }

            String toCapacity = params.get("toCapacity");
            if (toCapacity != null && !toCapacity.isEmpty()) {
                predicates.add(builder.lessThanOrEqualTo(r.get("capacity"), Integer.parseInt(toCapacity)));
            }

            String branchId = params.get("branchId");
            if (branchId != null && !branchId.isEmpty()) {
                predicates.add(builder.equal(r.get("branchId"), Integer.parseInt(branchId)));
            }

            String hallId = params.get("hallId");
            if (hallId != null && !hallId.isEmpty()) {
                predicates.add(builder.equal(r.get("id"), Integer.parseInt(hallId)));
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

//        q.orderBy(builder.desc(r.get("id")));

        Query query = session.createQuery(q);

        if (params != null) {
            String p = params.get("page");
            if (p != null && !p.isEmpty()) {
                int page = Integer.parseInt(p);
                int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));

                query.setMaxResults(pageSize);
                query.setFirstResult((page - 1) * pageSize);
            }
        }

        return query.getResultList();
    }

    @Override
    public int countHall() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Hall");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateHall(Hall h) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (h.getId() == null) {
                session.save(h);
            } else {
                session.update(h);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Hall getHallById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Hall.class, id);
    }

    @Override
    public boolean deleteHall(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Hall h = this.getHallById(id);
        try {
            s.delete(h);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

}
