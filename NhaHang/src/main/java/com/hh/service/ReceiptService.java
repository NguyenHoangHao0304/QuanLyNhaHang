/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.Cart;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface ReceiptService {
    boolean addReceipt(Map<String, Cart> carts);
}
