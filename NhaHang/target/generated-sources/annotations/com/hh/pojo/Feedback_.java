package com.hh.pojo;

import com.hh.pojo.Branch;
import com.hh.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-05T03:15:20")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, Branch> branchId;
    public static volatile SingularAttribute<Feedback, String> feedbackDescription;
    public static volatile SingularAttribute<Feedback, Integer> id;
    public static volatile SingularAttribute<Feedback, String> feedbackType;
    public static volatile SingularAttribute<Feedback, User> userId;

}