/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.Branch;
import com.hh.repository.BranchRepository;
import com.hh.service.BranchService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class BranchServiceImpl implements BranchService{

    @Autowired
    private BranchRepository branchRepo;

    @Override
    public List<Branch> getBranch() {
       return this.branchRepo.getBranch();
    }
}
