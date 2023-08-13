/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Food;
import com.hh.service.FoodService;
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
public class FoodController {

    @Autowired
    private FoodService foodService;
    @Autowired
    private Environment env;

    @RequestMapping("/foods")
    public String food(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("food", this.foodService.getFoods(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE2"));
        int count = this.foodService.countFood();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "foods";
    }

    @GetMapping("/admin/foods/create")
    public String create(Model model) {
        model.addAttribute("food", new Food());
        return "foodEdits";
    }

    @GetMapping("/admin/foods/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("food", this.foodService.getFoodById(id));
        return "foodEdits";
    }

    @PostMapping("foods")
    public String add(@ModelAttribute(value = "food") @Valid Food f,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.foodService.addOrUpdateFood(f) == true) {
                return "redirect:/foods";
            }
        }
        return "foodEdits";
    }
}
