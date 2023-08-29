/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.repository;

import com.hh.pojo.Booking;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface BookingRepository {
    
    List<Booking> getBookings(Map<String, String> params);

    int countBooking();

    boolean addOrUpdateBooking(Booking bk);

    Booking getBookingById(int id);

    boolean deleteBooking(int id);
}
