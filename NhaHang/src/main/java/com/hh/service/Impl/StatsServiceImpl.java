/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.repository.StatsRepository;
import com.hh.service.StatsService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class StatsServiceImpl implements StatsService{

    @Autowired
    private StatsRepository statsRepo;
    
    @Override
    public List<Object[]> countBookingByBranch() {
        return this.statsRepo.countBookingByBranch();
    }

    @Override
    public List<Object[]> statsRevenue(Map<String, String> params) {
        return this.statsRepo.statsRevenue(params);
    }
    
}
