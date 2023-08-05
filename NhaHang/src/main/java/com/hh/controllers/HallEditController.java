/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Hall;
import com.hh.service.HallService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Admin
 */
@Controller
public class HallEditController {

    @Autowired
    private HallService hallService;

    @GetMapping("/hallEdits")
    public String list(Model model) {
        model.addAttribute("hallEdit", new Hall());
        return "hallEdits";
    }
    @GetMapping("/hallEdits/{id}")
    public String update(Model model, @PathVariable(value = "id")  int id ){
        model.addAttribute("hallEdit", this.hallService.getHallById(id));
        return "hallEdits";
    }

    @PostMapping("/hallEdits")
    public String add(@ModelAttribute(value = "hallEdit") @Valid Hall h,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.hallService.addOrUpdateHall(h) == true) {
                return "redirect:/halls";
            }
        }

        return "hallEdits";
    }

}
