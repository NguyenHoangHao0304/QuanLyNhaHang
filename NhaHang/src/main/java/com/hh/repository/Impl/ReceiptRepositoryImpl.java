/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Bill;
import com.hh.pojo.Cart;
import com.hh.pojo.Payment;
import com.hh.repository.BookingRepository;
import com.hh.repository.ReceiptRepository;
import com.hh.repository.UserRepository;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Admin
 */
@Repository
public class ReceiptRepositoryImpl implements ReceiptRepository {

    @Autowired
    private LocalSessionFactoryBean factory;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private UserRepository userRepo;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(Map<String, Cart> carts) {
        Session s = this.factory.getObject().getCurrentSession();
        Authentication authentication
                = SecurityContextHolder.getContext().getAuthentication();

        try {
            Payment payment = new Payment();
            payment.setUserId(this.userRepo.getUserByUsername(authentication.getName()));
            payment.setPaymentDate(new Date());
            payment.setPaymentMethod("Trực Tiếp");
            s.save(payment);

            for (Cart c : carts.values()) {
                Bill b = new Bill();
                b.setUnitPrice(c.getUnitPrice());
                b.setPaymentId(payment);
                b.setBookingId(this.bookingRepository.getBookingById(c.getId()));
                s.save(b);
            }
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

}
