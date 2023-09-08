/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.api;

import com.hh.pojo.HallPrice;
import com.hh.service.HallPriceService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("/api")
public class ApiHallPriceController {

    @Autowired
    private HallPriceService hallPriceService;

    @DeleteMapping("/admin/halls/hallprices/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") int id) {
        this.hallPriceService.deleteHallPrice(id);
    }

    @GetMapping("/hallprices/{id}/")
    @CrossOrigin
    public ResponseEntity<List<HallPrice>> list(@PathVariable(value = "id") int id) {
        return new ResponseEntity<>(this.hallPriceService.getHallPriceByHallId(id), HttpStatus.OK);
    }
}
