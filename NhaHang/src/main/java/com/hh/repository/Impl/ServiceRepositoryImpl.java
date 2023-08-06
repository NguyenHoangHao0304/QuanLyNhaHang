/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Food;
import com.hh.pojo.Service;
import com.hh.repository.ServiceRepository;
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
public class ServiceRepositoryImpl implements ServiceRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<Service> getServices(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Service> q = builder.createQuery(Service.class);
        Root<Service> r = q.from(Service.class);
        q.select(r);
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(builder.like(r.get("serviceName"), String.format("%%%s%%", kw)));
            }

            String id = params.get("id");
            if (id != null && !id.isEmpty()) {
                predicates.add(builder.equal(r.get("id"), Integer.parseInt(id)));
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
    public int countService() {
        Session session = this.factory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(*) FROM Service");
        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateService(Service s) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (s.getId() == null) {
                session.save(s);
            } else {
                session.update(s);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Service getServiceById(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        return session.get(Service.class, id);
    }

    @Override
    public boolean deleteService(int id) {
        Session session = this.factory.getObject().getCurrentSession();
        Service s = this.getServiceById(id);
        try {
            session.delete(s);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

}
