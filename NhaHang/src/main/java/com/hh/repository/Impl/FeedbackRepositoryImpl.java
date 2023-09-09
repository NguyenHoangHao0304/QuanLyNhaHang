/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Feedback;
import com.hh.repository.FeedbackRepository;
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
public class FeedbackRepositoryImpl implements FeedbackRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<Feedback> getFeedback(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Feedback> q = builder.createQuery(Feedback.class);
        Root r = q.from(Feedback.class);
        q.select(r);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String branchName = params.get("branchName");
            if (branchName != null && !branchName.isEmpty()) {
                predicates.add(builder.like(r.get("branchId").get("branchName"), String.format("%%%s%%", branchName)));
            }

            String username = params.get("username");
            if (username != null && !username.isEmpty()) {
                predicates.add(builder.like(r.get("userId").get("username"), String.format("%%%s%%", username)));
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
    public int countFeedback() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM Feedback");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateFeedback(Feedback f) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (f.getId() == null) {
                session.save(f);
            } else {
                session.update(f);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Feedback getFeedbackById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Feedback.class, id);
    }

    @Override
    public boolean deleteFeedback(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Feedback f = this.getFeedbackById(id);
        try {
            s.delete(f);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Feedback> getFeedbackByBranchId(int branchId) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT f FROM Feedback f WHERE f.branchId.id = :id",Feedback.class);
        q.setParameter("id", branchId);

        return q.getResultList();
    }

    @Override
    public Feedback addFeedback(Feedback f) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(f);
            return f;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
