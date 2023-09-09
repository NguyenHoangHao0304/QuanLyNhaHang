/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hh.service;

import com.hh.pojo.Feedback;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public interface FeedbackService {

    List<Feedback> getFeedback(Map<String, String> params);

    List<Feedback> getFeedbackByBranchId(int branchId);

    Feedback addFeedback(Feedback f);

    int countFeedback();

    boolean addOrUpdateFeedback(Feedback f);

    Feedback getFeedbackById(int id);

    boolean deleteFeedback(int id);
}
