/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.formatter;

import com.hh.pojo.Branch;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Admin
 */
public class BranchFormatter implements Formatter<Branch>{

    @Override
    public String print(Branch branch, Locale locale) {
        return String.valueOf(branch.getId());
    }

    @Override
    public Branch parse(String branchId, Locale locale) throws ParseException {
       return new Branch(Integer.parseInt(branchId));
    }
    
}
