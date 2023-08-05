/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.controllers;

import com.hh.pojo.Branch;
import com.hh.service.BranchService;
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
public class BranchController {

    @Autowired
    private BranchService branchService;
    @Autowired
    private Environment env;

    @RequestMapping("/branchs")
    public String branch(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("branch", this.branchService.getBranchs(params));
        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE1"));
        int count = this.branchService.countBranch();
        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "branchs";
    }

    @GetMapping("/branchs/create")
    public String create(Model model) {
        model.addAttribute("branch", new Branch());
        return "branchEdits";
    }

    @GetMapping("/branchs/{id}")
    public String update(Model model, @PathVariable(value = "id") int id){
        model.addAttribute("branch", this.branchService.getBranchById(id));
        return "branchEdits";
    }
    @PostMapping("/branchs")
    public String add(@ModelAttribute(value = "branch") @Valid Branch b,
            BindingResult rs) {
        
        if(!rs.hasErrors()){
            if(this.branchService.addOrUpdateBranch(b)==true){
                return "redirect:/branchs";
            }
        }
        return "branchEdits";
    }
}
