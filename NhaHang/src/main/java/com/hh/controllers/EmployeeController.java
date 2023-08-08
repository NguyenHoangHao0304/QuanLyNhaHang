/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Employee;
import com.hh.pojo.Hall;
import com.hh.service.EmployeeService;
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
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private Environment env;

    @RequestMapping("/employees")
    public String hall(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("employee", this.employeeService.getEmployees(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE2"));
        int count = this.employeeService.countEmployee();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "employees";
    }
    
    @GetMapping("/employees/create")
    public String create(Model model) {
        model.addAttribute("employee", new Employee());
        return "employeeEdits";
    }
    @GetMapping("/employees/{id}")
    public String update(Model model, @PathVariable(value = "id")  int id ){
        model.addAttribute("employee", this.employeeService.getEmployeeById(id));
        return "employeeEdits";
    }

    @PostMapping("/employees")
    public String add(@ModelAttribute(value = "employee") @Valid Employee e,
            BindingResult rs) {

        if (!rs.hasErrors()) {
            if (this.employeeService.addOrUpdateEmployee(e) == true) {
                return "redirect:/employees";
            }
        }
        return "employeeEdits";
    }
}
