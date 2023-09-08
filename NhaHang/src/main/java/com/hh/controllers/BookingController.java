/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Booking;
import com.hh.pojo.User;
import com.hh.service.BookingService;
import com.hh.service.UserService;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    private UserService userService;
    @Autowired
    private Environment env;

    @RequestMapping("/admin/bookings")
    public String booking(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("booking", this.bookingService.getBookings(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.bookingService.countBooking();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "bookings";
    }

    @GetMapping("/user/bookings")
    public String manageBookings(Model model, Principal principal, @RequestParam Map<String, String> params) {
        String username = principal.getName();
//        User currentUser = this.userService.getUserByUsername(username);
        params.put("username", username);
//        model.addAttribute("userBookings", this.bookingService.getBookingsByUser(currentUser));
        model.addAttribute("userbooking", this.bookingService.getBookings(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.bookingService.countBooking();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "manage-bookings";
    }

    @GetMapping("/user/bookings/create")
    public String create(Model model, Principal principal) {
        String username = principal.getName();
        User currentUser = userService.getUserByUsername(username);
        Booking booking = new Booking();
        booking.setUserId(currentUser);
        model.addAttribute("booking", booking);
        return "bookingform";
    }

    @GetMapping("/user/bookings/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("booking", this.bookingService.getBookingById(id));
        return "bookingform";
    }

    @PostMapping("/bookings")
    public String add(@ModelAttribute(value = "booking") @Valid Booking bk,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.bookingService.addOrUpdateBooking(bk) == true) {
                return "redirect:/user/bookings";
            }
        } else {
            // Log validation errors
            System.out.println("Validation errors: " + rs.getAllErrors());
        }

        return "bookingform";
    }
}
