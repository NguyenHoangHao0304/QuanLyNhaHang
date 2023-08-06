/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.repository;

import com.hh.pojo.Service;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface ServiceRepository {

    List<Service> getServices(Map<String, String> params);

    int countService();

    boolean addOrUpdateService(Service s);

    Service getServiceById(int id);

    boolean deleteService(int id);
}
