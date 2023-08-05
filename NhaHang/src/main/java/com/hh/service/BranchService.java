/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.Branch;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface BranchService {
    List<Branch> getBranchs(Map<String, String> params);

    int countBranch();

    boolean addOrUpdateBranch(Branch b);

    Branch getBranchById(int id);

    boolean deleteBranch(int id);
}
