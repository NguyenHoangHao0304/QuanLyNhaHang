/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.api;

import com.hh.pojo.Hall;
import com.hh.service.HallService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
public class ApiHallController {

    @Autowired
    private HallService hallService;

    @DeleteMapping("/halls/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") int id) {
        this.hallService.deleteHall(id);
    }

    @GetMapping("/halls/")
    @CrossOrigin
    public ResponseEntity<List<Hall>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.hallService.getHalls(params), HttpStatus.OK);
    }

    @GetMapping(path="/halls/{hallId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Hall> getHallDetail(@PathVariable(value = "hallId") int hallId) {
        return new ResponseEntity<>(this.hallService.getHallById(hallId), HttpStatus.OK);
    }
}
