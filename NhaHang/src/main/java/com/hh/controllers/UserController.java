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

    @RequestMapping("/admin/users")
    public String user(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("user", this.userService.getUsers(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.userService.countUser();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "users";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/register")
    public String registerView(Model model){
        model.addAttribute("user", new User());
        return "register";
    }
    
    @PostMapping("/register")
    public String register(@ModelAttribute(value = "user") User u, Model model){
        String errMsg = "";
        if(u.getPassword().equals(u.getConfirmPassword())){
            if(this.userService.addUser(u) == true){
                return "redirect:/login";
            }else
                errMsg = "Bạn nhập không đủ thông tin bên dưới!"
                        + " Vui lòng điền đầy đủ thông tin!";
        }else
            errMsg = "Mật khẩu không khớp nhau!";
        model.addAttribute("errMsg",errMsg);
        return "register";
    }
    @GetMapping("/admin/users/create")
    public String create(Model model) {
        model.addAttribute("user", new User());
        return "userEdits";
    }

    @GetMapping("/admin/users/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userEdits";
    }

    @PostMapping("/admin/users")
    public String add(@ModelAttribute(value = "user") @Valid User u,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.userService.addOrUpdateUser(u) == true) {
                return "redirect:/admin/users";
            }
        }
        return "userEdits";
    }
}
