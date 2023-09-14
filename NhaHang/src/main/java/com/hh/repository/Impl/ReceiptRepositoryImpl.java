/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.repository.Impl;

import com.hh.pojo.Bill;
import com.hh.pojo.Booking;
import com.hh.pojo.BookingFood;
import com.hh.pojo.BookingService;
import com.hh.pojo.Cart;
import com.hh.pojo.DataRequest;
import com.hh.pojo.Hall;
import com.hh.pojo.Payment;
import com.hh.pojo.Service;
import com.hh.pojo.User;
import com.hh.repository.BookingRepository;
import com.hh.repository.HallRepository;
import com.hh.repository.ReceiptRepository;
import com.hh.repository.UserRepository;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    private HallRepository hallRepository;
    @Autowired
    private UserRepository userRepo;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addReceipt(DataRequest dataRequest) {
        Session s = this.factory.getObject().getCurrentSession();
        Payment payment = new Payment();

        Booking booking = new Booking();
        try {
            Authentication authentication
                    = SecurityContextHolder.getContext().getAuthentication();
            User u = this.userRepo.getUserByUsername(authentication.getName());
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            booking.setBookingDate(LocalDate.parse(dataRequest.getBookingDate(), dateFormatter));
            try {
                booking.setStartTime(dateFormat.parse(dataRequest.getStartTime()));
            } catch (ParseException ex) {
                Logger.getLogger(ReceiptRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            booking.setUserId(u);
            booking.setHallId(this.hallRepository.getHallById(Integer.parseInt(dataRequest.getHallId())));
//            booking.setHallId(this.hallRepository.getHallById(3));
            booking.setBookingName(dataRequest.getBookingName());
            s.save(booking);

            BookingService bks = new BookingService();
            bks.setBookingId(booking);
            s.save(bks);

            BookingFood bkf = new BookingFood();
            bkf.setBookingId(booking);
            s.save(bkf);

            payment.setUserId(u);
            payment.setPaymentDate(new Date());
            payment.setPaymentMethod(dataRequest.getPaymentMethod());
            s.save(u);

            for (Cart c : dataRequest.getCarts().values()) {
                Bill b = new Bill();
                b.setUnitPrice(c.getUnitPrice());
                b.setPaymentId(payment);
                b.setBookingId(booking);
                b.setNum(c.getQuantity());

                s.save(b);
            }
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

}
