/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.Hall;
import com.hh.repository.HallRepository;
import com.hh.service.HallService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class HallServiceImpl implements HallService {

    @Autowired
    private HallRepository HallRepo;

    @Override
    public List<Hall> getHalls(Map<String, String> params) {
        return this.HallRepo.getHalls(params);
    }

    @Override
    public int countHall() {
        return this.HallRepo.countHall();
    }

    @Override
    public boolean addOrUpdateHall(Hall h) {
        return this.HallRepo.addOrUpdateHall(h);
    }

    @Override
    public Hall getHallById(int id) {
        return this.HallRepo.getHallById(id);
    }

    @Override
    public boolean deleteHall(int id) {
        return this.HallRepo.deleteHall(id);
    }


}
