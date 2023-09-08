/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hh.pojo.Hall;
import com.hh.repository.HallRepository;
import com.hh.service.HallService;
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
public class HallServiceImpl implements HallService {

    @Autowired
    private HallRepository hallRepo;
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public List<Hall> getHalls(Map<String, String> params) {
        return this.hallRepo.getHalls(params);
    }

    @Override
    public int countHall() {
        return this.hallRepo.countHall();
    }

    @Override
    public boolean addOrUpdateHall(Hall h) {
        if (!h.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(h.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                h.setHallImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(FoodServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.hallRepo.addOrUpdateHall(h);
    }

    @Override
    public Hall getHallById(int id) {
        return this.hallRepo.getHallById(id);
    }

    @Override
    public boolean deleteHall(int id) {
        return this.hallRepo.deleteHall(id);
    }



}
