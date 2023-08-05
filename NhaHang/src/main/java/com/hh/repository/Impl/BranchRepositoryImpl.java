/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Branch;
import com.hh.repository.BranchRepository;
import java.util.List;
import javax.persistence.Query;
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
public class BranchRepositoryImpl implements BranchRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    @Override
    public List<Branch> getBranch() {
        Session session = this.factory.getObject().getCurrentSession();
        Query query = session.createQuery("From Branch");
        return query.getResultList();
    }
    
}
