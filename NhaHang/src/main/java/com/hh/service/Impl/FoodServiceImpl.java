/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hh.pojo.Food;
import com.hh.repository.FoodRepository;
import com.hh.service.FoodService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class FoodServiceImpl implements FoodService {

    @Autowired
    private FoodRepository foodRepo;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Food> getFoods(Map<String, String> params) {
        return this.foodRepo.getFoods(params);
    }

    @Override
    public int countFood() {
        return this.foodRepo.countFood();
    }

    @Override
    public boolean addOrUpdateFood(Food f) {
        if (!f.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(f.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                f.setFoodImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(FoodServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.foodRepo.addOrUpdateFood(f);
    }

    @Override
    public Food getFoodById(int id) {
        return this.foodRepo.getFoodById(id);
    }

    @Override
    public boolean deleteFood(int id) {
        return this.foodRepo.deleteFood(id);
    }

}
