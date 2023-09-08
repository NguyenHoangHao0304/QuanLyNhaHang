/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.User;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
public interface UserService extends UserDetailsService {

    User getUserByUsername(String username);

    List<User> getUsers(Map<String, String> params);

    int countUser();

    boolean addOrUpdateUser(User u);

    User getUserById(int id);

    boolean deleteUser(int id);

    boolean addUser(User u);

//    User getUserByUn(String username);

    boolean authUser(String username, String password);
    
    User addUsers(Map<String, String> params, MultipartFile avatar);
}
