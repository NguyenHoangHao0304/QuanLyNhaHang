/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.Booking;
import com.hh.pojo.User;
import com.hh.repository.BookingRepository;
import com.hh.repository.HallRepository;
import com.hh.repository.UserRepository;
import com.hh.service.BookingService;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingRepository BookingRepo;
    @Autowired
    private HallRepository hallRepo;
    @Autowired
    private UserRepository userRepo;

    @Override
    public List<Booking> getBookings(Map<String, String> params) {
        return this.BookingRepo.getBookings(params);
    }

    @Override
    public int countBooking() {
        return this.BookingRepo.countBooking();
    }

    @Override
    public boolean addOrUpdateBooking(Booking bk) {
        return this.BookingRepo.addOrUpdateBooking(bk);
    }

    @Override
    public Booking getBookingById(int id) {
        return this.BookingRepo.getBookingById(id);
    }

    @Override
    public boolean deleteBooking(int id) {
        return this.BookingRepo.deleteBooking(id);
    }

    @Override
    public List<Booking> getBookingsByUser(User user) {
        return this.BookingRepo.getBookingsByUser(user);
    }

    @Override
    public Booking addBooking(Booking bk) {
        bk.setBookingDate(LocalDate.now());
        bk.setStartTime(new Date());
//        bk.setHallId(this.hallRepo.getHallById(3));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = this.userRepo.getUserByUsername(authentication.getName());
        bk.setUserId(u);
        
        return this.BookingRepo.addBooking(bk);
    }
}
