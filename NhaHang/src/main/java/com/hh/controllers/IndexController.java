/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.service.BranchService;
import com.hh.service.EmployeeService;
import com.hh.service.HallService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Controller
@ControllerAdvice
public class IndexController {

    @Autowired
    private HallService HallService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private EmployeeService employeeService;

    @ModelAttribute
    public void commonAttr(Model model, Map<String, String> params) {
        model.addAttribute("branchs", this.branchService.getBranchs(params));
        model.addAttribute("halls", this.HallService.getHalls(params));
        model.addAttribute("employees", this.employeeService.getEmployees(params));
    }

    @RequestMapping("/")
    public String index(Model model) {

        return "index";
    }
}
