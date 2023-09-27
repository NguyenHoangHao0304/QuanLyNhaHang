package com.hh.pojo;

import com.hh.pojo.Employee;
import com.hh.pojo.Feedback;
import com.hh.pojo.Hall;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-09-27T21:53:42")
@StaticMetamodel(Branch.class)
public class Branch_ { 

    public static volatile SetAttribute<Branch, Feedback> feedbackSet;
    public static volatile SingularAttribute<Branch, String> branchName;
    public static volatile SingularAttribute<Branch, String> branchAddress;
    public static volatile SingularAttribute<Branch, Integer> id;
    public static volatile SetAttribute<Branch, Hall> hallSet;
    public static volatile SetAttribute<Branch, Employee> employeeSet;

}