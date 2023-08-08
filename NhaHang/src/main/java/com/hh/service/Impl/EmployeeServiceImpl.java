/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.Employee;
import com.hh.repository.EmployeeRepository;
import com.hh.service.EmployeeService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Autowired
    private EmployeeRepository employeeRepository;
    @Override
    public List<Employee> getEmployees(Map<String, String> params) {
        return this.employeeRepository.getEmployees(params);
    }

    @Override
    public int countEmployee() {
        return this.employeeRepository.countEmployee();
    }

    @Override
    public boolean addOrUpdateEmployee(Employee e) {
        return this.employeeRepository.addOrUpdateEmployee(e);
    }

    @Override
    public Employee getEmployeeById(int id) {
        return this.employeeRepository.getEmployeeById(id);
    }

    @Override
    public boolean deleteEmployee(int id) {
        return this.employeeRepository.deleteEmployee(id);
    }
    
}
