/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.service.BranchService;
import com.hh.service.EmployeeService;
import com.hh.service.FeedbackService;
import com.hh.service.HallPriceService;
import com.hh.service.HallService;
import com.hh.service.UserService;
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
    private HallService hallService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private UserService userService;
    @Autowired
    private HallPriceService hallPriceService;
    @Autowired
    private FeedbackService feedbackService;

    @ModelAttribute
    public void commonAttr(Model model, Map<String, String> params) {
        model.addAttribute("branchs", this.branchService.getBranchs(params));
        model.addAttribute("halls", this.hallService.getHalls(params));
        model.addAttribute("employees", this.employeeService.getEmployees(params));
        model.addAttribute("users", this.userService.getUsers(params));
        model.addAttribute("hallprices", this.hallPriceService.getHallPrice(params));
        model.addAttribute("feedbacks", this.feedbackService.getFeedback(params));
    }

    @RequestMapping("/")
    public String index(Model model) {

        return "index";
    }
}
