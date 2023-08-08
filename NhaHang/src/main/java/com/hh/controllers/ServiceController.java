/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Service;
import com.hh.service.ServiceService;
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
public class ServiceController {

    @Autowired
    private ServiceService serviceService;
    @Autowired
    private Environment env;

    @RequestMapping("/services")
    public String service(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("service", this.serviceService.getServices(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.serviceService.countService();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "services";
    }

    @GetMapping("/services/create")
    public String create(Model model) {
        model.addAttribute("service", new Service());
        return "serviceEdits";
    }

    @GetMapping("/services/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("service", this.serviceService.getServiceById(id));
        return "serviceEdits";
    }

    @PostMapping("services")
    public String add(@ModelAttribute(value = "service") @Valid Service s,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            if (this.serviceService.addOrUpdateService(s) == true) {
                return "redirect:/services";
            }
        }
        return "serviceEdits";
    }
}
