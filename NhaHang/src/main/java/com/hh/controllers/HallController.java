/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.service.BranchService;
import com.hh.service.HallService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:configs.properties")
public class HallController {

    @Autowired
    private HallService HallService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private Environment env;

    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("branchs", this.branchService.getBranch());
    }

    @RequestMapping("/halls")
    public String Hall(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("hall", this.HallService.getHalls(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        int count = this.HallService.countHall();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "halls";
    }
}