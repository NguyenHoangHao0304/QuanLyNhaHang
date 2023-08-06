/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.Food;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface FoodService {
     List<Food> getFoods(Map<String, String> params);

    int countFood();

    boolean addOrUpdateFood(Food f);

    Food getFoodById(int id);

    boolean deleteFood(int id);
}
