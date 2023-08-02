package com.hh.pojo;

import com.hh.pojo.Employee;
import com.hh.pojo.Feedback;
import com.hh.pojo.Hall;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-03T04:25:02")
@StaticMetamodel(Brach.class)
public class Brach_ { 

    public static volatile SetAttribute<Brach, Feedback> feedbackSet;
    public static volatile SingularAttribute<Brach, String> branchName;
    public static volatile SingularAttribute<Brach, String> branchAddress;
    public static volatile SingularAttribute<Brach, Integer> id;
    public static volatile SetAttribute<Brach, Hall> hallSet;
    public static volatile SetAttribute<Brach, Employee> employeeSet;

}