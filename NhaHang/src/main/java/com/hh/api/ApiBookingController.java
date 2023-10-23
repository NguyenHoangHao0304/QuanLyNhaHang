/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.api;

import com.hh.pojo.Booking;
import com.hh.pojo.User;
import com.hh.service.BookingService;
import com.hh.service.EmployeeService;
import com.hh.service.UserService;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("/api")
public class ApiBookingController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private UserService userService;

    @DeleteMapping("/bookings/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") int id) {
        this.bookingService.deleteBooking(id);
    }

    @PostMapping(path = "/booking/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Booking> addBooking(@RequestBody Booking booking) {
        Booking bk = this.bookingService.addBooking(booking);

        return new ResponseEntity<>(bk, HttpStatus.CREATED);
    }

    @GetMapping("/bookings/")
    @CrossOrigin
    public ResponseEntity<List<Booking>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.bookingService.getBookings(params), HttpStatus.OK);
    }

    @GetMapping(path = "/bookinglist/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<Booking>> getBookingList(Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            User currentUser = this.userService.getUserByUsername(username);
            List<Booking> userBookings = bookingService.getBookingsByUser(currentUser);

            if (userBookings != null && !userBookings.isEmpty()) {
                return new ResponseEntity<>(userBookings, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
        } else {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    @PutMapping(path = "/bookings/{id}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Booking> updateBooking(
            @PathVariable("id") int id,
            @RequestBody Booking editBooking,
            Principal principal
    ) {
        if (principal != null) {
            String username = principal.getName();
            User currentUser = this.userService.getUserByUsername(username);
            Booking existingBooking = bookingService.getBookingById(id);

            if (existingBooking != null && Objects.equals(existingBooking.getUserId().getId(), currentUser.getId())) {
                DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
                existingBooking.setTableNumber(editBooking.getTableNumber());
                existingBooking.setBookingDate(LocalDate.parse(editBooking.getBookingDate().toString(), dateFormatter));
//                try {
//                        existingBooking.setStartTime(dateFormat.parse(editBooking.getStartTime().toString()));
//                    } catch (ParseException ex) {
//                        Logger.getLogger(ApiBookingController.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                existingBooking.setBookingName(editBooking.getBookingName());

                bookingService.addOrUpdateBooking(existingBooking);

                return new ResponseEntity<>(HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
            }
        } else {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }
}
