/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.pojo;

import java.math.BigDecimal;
import java.util.Map;
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
public class DataRequest {
    private Map<String, Cart> carts;
    private String hallId;
    private String bookingName;
    private String bookingDate;
    private String startTime;
    private String paymentMethod;
    private Integer tableNumber;
    private BigDecimal totalPrice;
}
