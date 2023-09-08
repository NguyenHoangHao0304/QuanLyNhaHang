/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.Hall;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface HallService {
    List<Hall> getHalls(Map<String, String> params);

    int countHall();

    boolean addOrUpdateHall(Hall h);

    Hall getHallById(int id);

    boolean deleteHall(int id);
    
}
