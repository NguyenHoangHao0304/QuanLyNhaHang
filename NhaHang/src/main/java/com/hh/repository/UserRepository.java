/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.repository;

import com.hh.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface UserRepository {

    User getUserByUsername(String username);
    
    List<User> getUsers(Map<String, String> params);

    int countUser();

    boolean addOrUpdateUser(User u);

    User getUserById(int id);

    boolean deleteUser(int id);
}
