/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.HallPrice;
import com.hh.repository.HallPriceRepository;
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
public class HallPriceRepositoryImpl implements HallPriceRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<HallPrice> getHallPrice(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<HallPrice> q = builder.createQuery(HallPrice.class);
        Root r = q.from(HallPrice.class);
        q.select(r);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String hallName = params.get("hallName");
            if (hallName != null && !hallName.isEmpty()) {
                predicates.add(builder.like(r.get("hallId").get("hallName"), String.format("%%%s%%", hallName)));
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
    public int countHallPrice() {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT Count(*) FROM HallPrice");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateHallPrice(HallPrice hp) {
        Session session = this.factory.getObject().getCurrentSession();
        try {
            if (hp.getId() == null) {
                session.save(hp);
            } else {
                session.update(hp);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public HallPrice getHallPriceById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(HallPrice.class, id);
    }

    @Override
    public boolean deleteHallPrice(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        HallPrice h = this.getHallPriceById(id);
        try {
            s.delete(h);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<HallPrice> getHallPriceByHallId(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Query q = s.createQuery("SELECT hp FROM HallPrice hp WHERE hp.hallId.id = :id",HallPrice.class);
        q.setParameter("id", id);
        return q.getResultList();
    }




}
