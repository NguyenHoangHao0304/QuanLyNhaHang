/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.pojo;

import java.math.BigDecimal;
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
public class Cart {
    private int id;
    private int foodId;
    private int serviceId;
    private int hallId;
    private String name;
    private int quantity;
    private BigDecimal unitPrice;
}
