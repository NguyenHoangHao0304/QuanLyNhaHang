/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.Branch;
import com.hh.repository.BranchRepository;
import com.hh.service.BranchService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class BranchServiceImpl implements BranchService {

    @Autowired
    private BranchRepository branchRepo;

    @Override
    public List<Branch> getBranchs(Map<String, String> params) {
        return this.branchRepo.getBranchs(params);
    }

    @Override
    public int countBranch() {
        return this.branchRepo.countBranch();
    }

    @Override
    public boolean addOrUpdateBranch(Branch b) {
        return this.branchRepo.addOrUpdateBranch(b);
    }

    @Override
    public Branch getBranchById(int id) {
        return this.branchRepo.getBranchById(id);
    }

    @Override
    public boolean deleteBranch(int id) {
        return this.branchRepo.deleteBranch(id);
    }


}
