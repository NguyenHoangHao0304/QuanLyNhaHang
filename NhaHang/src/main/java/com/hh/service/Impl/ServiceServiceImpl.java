/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hh.repository.ServiceRepository;
import com.hh.service.ServiceService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class ServiceServiceImpl implements ServiceService {

    @Autowired
    private ServiceRepository serviceRepository;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<com.hh.pojo.Service> getServices(Map<String, String> params) {
        return this.serviceRepository.getServices(params);
    }

    @Override
    public int countService() {
        return this.serviceRepository.countService();
    }

    @Override
    public boolean addOrUpdateService(com.hh.pojo.Service s) {
        if (!s.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(s.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                s.setServiceImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(FoodServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.serviceRepository.addOrUpdateService(s);
    }

    @Override
    public com.hh.pojo.Service getServiceById(int id) {
        return this.serviceRepository.getServiceById(id);
    }

    @Override
    public boolean deleteService(int id) {
        return this.serviceRepository.deleteService(id);
    }

}
