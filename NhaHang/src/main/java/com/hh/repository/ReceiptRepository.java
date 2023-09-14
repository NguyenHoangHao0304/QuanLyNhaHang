/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.repository;

import com.hh.pojo.Cart;
import com.hh.pojo.DataRequest;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface ReceiptRepository {
    boolean addReceipt(DataRequest dataRequest);
}
