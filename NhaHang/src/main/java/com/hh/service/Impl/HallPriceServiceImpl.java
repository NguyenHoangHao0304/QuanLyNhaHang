/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.HallPrice;
import com.hh.repository.HallPriceRepository;
import com.hh.service.HallPriceService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class HallPriceServiceImpl implements HallPriceService {

    @Autowired
    private HallPriceRepository hallPriceRepo;

    @Override
    public List<HallPrice> getHallPrice(Map<String, String> params) {
        return this.hallPriceRepo.getHallPrice(params);
    }

    @Override
    public int countHallPrice() {
        return this.hallPriceRepo.countHallPrice();
    }

    @Override
    public boolean addOrUpdateHallPrice(HallPrice hp) {
        return this.hallPriceRepo.addOrUpdateHallPrice(hp);
    }

    @Override
    public HallPrice getHallPriceById(int id) {
        return this.hallPriceRepo.getHallPriceById(id);
    }

    @Override
    public boolean deleteHallPrice(int id) {
        return this.hallPriceRepo.deleteHallPrice(id);
    }

    @Override
    public List<HallPrice> getHallPriceByHallId(int id) {
        return this.hallPriceRepo.getHallPriceByHallId(id);
    }


}
