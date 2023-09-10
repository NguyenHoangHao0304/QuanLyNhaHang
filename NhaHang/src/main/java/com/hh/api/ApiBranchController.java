/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.api;

import com.hh.pojo.Branch;
import com.hh.pojo.Feedback;
import com.hh.service.BranchService;
import com.hh.service.FeedbackService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("/api")
public class ApiBranchController {

    @Autowired
    private BranchService branchService;
    @Autowired
    private FeedbackService feedbackService;

     @DeleteMapping("/branchs/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") int id) {
        this.branchService.deleteBranch(id);
    }

    @RequestMapping("/branchs/")
    @CrossOrigin
    public ResponseEntity<List<Branch>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.branchService.getBranchs(params), HttpStatus.OK);
    }

    @RequestMapping(path = "/branchs/{branchId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Branch> details(@PathVariable(value = "branchId") int branchId) {
        return new ResponseEntity<>(this.branchService.getBranchById(branchId), HttpStatus.OK);
    }

    @GetMapping("/branchs/{branchId}/feedbacks/")
    @CrossOrigin
    public ResponseEntity<List<Feedback>> listComments(@PathVariable(value = "branchId") int branchId) {
        return new ResponseEntity<>(this.feedbackService.getFeedbackByBranchId(branchId), HttpStatus.OK);
    }

    @PostMapping(path = "/feedbacks/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Feedback> addComment(@RequestBody Feedback feedback) {
        Feedback f = this.feedbackService.addFeedback(feedback);

        return new ResponseEntity<>(f, HttpStatus.CREATED);
    }
}
