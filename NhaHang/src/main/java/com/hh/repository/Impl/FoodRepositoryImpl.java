/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Branch;
import com.hh.pojo.Food;
import com.hh.repository.FoodRepository;
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
public class FoodRepositoryImpl implements FoodRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private Environment env;

    @Override
    public List<Food> getFoods(Map<String, String> params) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Food> q = builder.createQuery(Food.class);
        Root<Food> r = q.from(Food.class);
        q.select(r);
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();

            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                predicates.add(builder.like(r.get("foodName"), String.format("%%%s%%", kw)));
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
                int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE2"));

                query.setMaxResults(pageSize);
                query.setFirstResult((page - 1) * pageSize);
            }
        }

        return query.getResultList();
    }

    @Override
    public int countFood() {
        Session session = this.factory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(*) FROM Food");
        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean addOrUpdateFood(Food f) {
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
    public Food getFoodById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Food.class, id);
    }

    @Override
    public boolean deleteFood(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        Food f = this.getFoodById(id);
        try {
            s.delete(f);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

}
