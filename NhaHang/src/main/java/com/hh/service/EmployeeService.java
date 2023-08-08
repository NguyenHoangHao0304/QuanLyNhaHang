/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.Employee;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface EmployeeService {
     List<Employee> getEmployees(Map<String, String> params);

    int countEmployee();

    boolean addOrUpdateEmployee(Employee e);

    Employee getEmployeeById(int id);

    boolean deleteEmployee(int id);
}
