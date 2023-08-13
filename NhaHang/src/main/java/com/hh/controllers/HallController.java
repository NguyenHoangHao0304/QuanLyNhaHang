/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Hall;
import com.hh.service.HallService;
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
public class HallController {

    @Autowired
    private HallService hallService;
    @Autowired
    private Environment env;

    @RequestMapping("/halls")
    public String hall(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("hall", this.hallService.getHalls(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        int count = this.hallService.countHall();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "halls";
    }
    
    @GetMapping("/admin/halls/create")
    public String create(Model model) {
        model.addAttribute("hall", new Hall());
        return "hallEdits";
    }
    @GetMapping("/admin/halls/{id}")
    public String update(Model model, @PathVariable(value = "id")  int id ){
        model.addAttribute("hall", this.hallService.getHallById(id));
        return "hallEdits";
    }

    @PostMapping("/halls")
    public String add(@ModelAttribute(value = "hall") @Valid Hall h,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.hallService.addOrUpdateHall(h) == true) {
                return "redirect:/halls";
            }
        }
        return "hallEdits";
    }
}
