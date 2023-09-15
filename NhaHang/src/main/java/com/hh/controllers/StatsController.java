/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.repository.StatsRepository;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
public class StatsController {

    @Autowired
    private StatsRepository statsRepository;

    @RequestMapping("/admin/countBookingByBranch")
    public String countBookingByBranch(Model model) {
        List<Object[]> countBookingByBranchList = statsRepository.countBookingByBranch();
        model.addAttribute("countBookingByBranchList", countBookingByBranchList);
        return "statsBookingByBranch";
    }

    @RequestMapping("/admin/statsRevenue")
    public String statsRevenue(Model model, @RequestParam Map<String, String> params) {
        List<Object[]> statsRevenueList = statsRepository.statsRevenue(params);
        model.addAttribute("statsRevenueList", statsRevenueList);
        return "statsRevenue";
    }

    @RequestMapping("/admin/countHallStats")
    public String countHallStats(Model model, @RequestParam Map<String, String> params) {
        List<Object[]> countHallStatsList = statsRepository.countHallStats(params);
        model.addAttribute("countHallStatsList", countHallStatsList);
        return "statsHall";
    }
}
