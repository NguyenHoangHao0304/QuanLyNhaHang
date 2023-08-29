/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Booking;
import com.hh.service.BookingService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@PropertySource("classpath:configs.properties")
public class BookingController {

    @Autowired
    private BookingService bookingService;
    @Autowired
    private Environment env;

    @RequestMapping("/bookings")
    public String booking(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("booking", this.bookingService.getBookings(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.bookingService.countBooking();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "bookings";
    }
    
    @GetMapping("/user/bookings/create")
    public String create(Model model) {
        model.addAttribute("booking", new Booking());
        return "bookingform";
    }
    @GetMapping("/user/bookings/{id}")
    public String update(Model model, @PathVariable(value = "id")  int id ){
        model.addAttribute("booking", this.bookingService.getBookingById(id));
        return "bookingform";
    }

    @PostMapping("/bookings")
    public String add(@ModelAttribute(value = "booking") @Valid Booking bk,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.bookingService.addOrUpdateBooking(bk) == true) {
                return "redirect:/bookings";
            }
        }
        return "bookingform";
    }
}
