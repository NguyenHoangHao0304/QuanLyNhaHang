/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.HallPrice;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface HallPriceService {

    List<HallPrice> getHallPrice(Map<String, String> params);

    int countHallPrice();

    boolean addOrUpdateHallPrice(HallPrice hp);

    HallPrice getHallPriceById(int id);

    boolean deleteHallPrice(int id);

    List<HallPrice> getHallPriceByHallId(int id);
}
