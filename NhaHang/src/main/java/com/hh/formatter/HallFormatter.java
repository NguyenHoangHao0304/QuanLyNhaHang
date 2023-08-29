/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.formatter;

import com.hh.pojo.Hall;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class HallFormatter implements Formatter<Hall> {

    @Override
    public String print(Hall hall, Locale locale) {
        return String.valueOf(hall.getId());
    }

    @Override
    public Hall parse(String hallId, Locale locale) throws ParseException {
        return new Hall(Integer.parseInt(hallId));
    }

}
