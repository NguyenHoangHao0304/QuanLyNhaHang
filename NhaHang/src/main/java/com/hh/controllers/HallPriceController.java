/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.HallPrice;
import com.hh.service.HallPriceService;
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
public class HallPriceController {

    @Autowired
    private HallPriceService hallPriceService;
    @Autowired
    private Environment env;

    @RequestMapping("/halls/hallprices")
    public String hallprice(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("hallprice", this.hallPriceService.getHallPrice(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
        int count = this.hallPriceService.countHallPrice();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "hallprice";
    }
    
    @GetMapping("/admin/halls/hallprices/create")
    public String create(Model model) {
        model.addAttribute("hallprice", new HallPrice());
        return "hallpriceEdits";
    }

    @GetMapping("/admin/halls/hallprices/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("hallprice", this.hallPriceService.getHallPriceById(id));
        return "hallpriceEdits";
    }

    @PostMapping("/halls/hallprices")
    public String add(@ModelAttribute(value = "hallprice") @Valid HallPrice hp,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.hallPriceService.addOrUpdateHallPrice(hp)) {
                // Log successful saving
                System.out.println("HallPrice saved successfully!");
                return "redirect:/halls";
            }
        } else {
            // Log validation errors
            System.out.println("Validation errors: " + rs.getAllErrors());
        }

        // Log saving failure
        System.out.println("Failed to save HallPrice");

        return "hallpriceEdits";
    }
}
