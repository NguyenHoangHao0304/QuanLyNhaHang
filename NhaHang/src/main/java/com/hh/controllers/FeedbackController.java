/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Feedback;
import com.hh.pojo.User;
import com.hh.service.FeedbackService;
import com.hh.service.UserService;
import java.security.Principal;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@PropertySource("classpath:configs.properties")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;
    @Autowired
    private UserService userService;
    @Autowired
    private Environment env;
    
    @RequestMapping("/feedbacks")
    public String feedback(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("feedback", this.feedbackService.getFeedback(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.feedbackService.countFeedback();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "feedbacks";
    }
    
    @GetMapping("/user/feedbacks")
    public String manageFeedbacks(Model model, Principal principal, @RequestParam Map<String, String> params) {
        String username = principal.getName();
        User currentUser = this.userService.getUserByUsername(username);
//        params.put("username", username);
        model.addAttribute("userfeedback", this.feedbackService.getFeedBacksByUser(currentUser));
//        model.addAttribute("userfeedback", this.feedbackService.getFeedback(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.feedbackService.countFeedback();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "manage-feedbacks";
    }
    
    @GetMapping("/user/feedbacks/create")
    public String create(Model model, Principal principal) {
        String username = principal.getName();
        User currentUser = userService.getUserByUsername(username);
        Feedback feedback = new Feedback();
        feedback.setUserId(currentUser);
        model.addAttribute("feedback", feedback);
        return "feedbackEdits";
    }

    @GetMapping("/user/feedbacks/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("feedback", this.feedbackService.getFeedbackById(id));
        return "feedbackEdits";
    }

    @PostMapping("/feedbacks")
    public String add(@ModelAttribute(value = "feedback") @Valid Feedback f,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.feedbackService.addOrUpdateFeedback(f)) {
                // Log successful saving
                System.out.println("HallPrice saved successfully!");
                return "redirect:/branchs";
            }
        } else {
            // Log validation errors
            System.out.println("Validation errors: " + rs.getAllErrors());
        }

        // Log saving failure
        System.out.println("Failed to save HallPrice");

        return "feedbackEdits";
    }
}
