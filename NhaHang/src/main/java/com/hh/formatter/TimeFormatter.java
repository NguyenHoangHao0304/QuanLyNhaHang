/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class TimeFormatter implements Formatter<Date>{

    private final SimpleDateFormat timeFormat;

    public TimeFormatter(String format) {
        timeFormat = new SimpleDateFormat(format);
    }

    @Override
    public Date parse(String text, Locale locale) throws ParseException {
        return timeFormat.parse(text);
    }

    @Override
    public String print(Date object, Locale locale) {
        return timeFormat.format(object);
    }
}
