/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.User;
import com.hh.service.UserService;
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
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private Environment env;

    @RequestMapping("/users")
    public String service(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("user", this.userService.getUsers(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.userService.countUser();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "users";
    }

    @GetMapping("/users/create")
    public String create(Model model) {
        model.addAttribute("user", new User());
        return "userEdits";
    }

    @GetMapping("/users/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userEdits";
    }

    @PostMapping("users")
    public String add(@ModelAttribute(value = "user") @Valid User u,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.userService.addOrUpdateUser(u) == true) {
                return "redirect:/users";
            }
        }
        return "userEdits";
    }
}
