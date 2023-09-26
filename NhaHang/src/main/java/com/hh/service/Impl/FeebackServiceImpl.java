/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.service.Impl;

import com.hh.pojo.Feedback;
import com.hh.pojo.User;
import com.hh.repository.FeedbackRepository;
import com.hh.repository.UserRepository;
import com.hh.service.FeedbackService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class FeebackServiceImpl implements FeedbackService{

    @Autowired
    private FeedbackRepository feedbackRepository;
    @Autowired
    private UserRepository userRepository;
    
    @Override
    public List<Feedback> getFeedback(Map<String, String> params) {
        return this.feedbackRepository.getFeedback(params);
    }

    @Override
    public int countFeedback() {
        return this.feedbackRepository.countFeedback();
    }

    @Override
    public boolean addOrUpdateFeedback(Feedback f) {
        f.setFeedbackDate(new Date());
        return this.feedbackRepository.addOrUpdateFeedback(f);
    }

    @Override
    public Feedback getFeedbackById(int id) {
        return this.feedbackRepository.getFeedbackById(id);
    }

    @Override
    public boolean deleteFeedback(int id) {
        return this.feedbackRepository.deleteFeedback(id);
    }

    @Override
    public List<Feedback> getFeedbackByBranchId(int branchId) {
        return this.feedbackRepository.getFeedbackByBranchId(branchId);
    }

    @Override
    public Feedback addFeedback(Feedback f) {
        f.setFeedbackDate(new Date());
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User u = this.userRepository.getUserByUsername(authentication.getName());
        f.setUserId(u);
        
        return this.feedbackRepository.addFeedback(f);
    }

    @Override
    public List<Feedback>getFeedBacksByUser(User user) {
        return this.feedbackRepository.getFeedBacksByUser(user);
    }
    
}
