package com.hh.pojo;

import com.hh.pojo.Booking;
import com.hh.pojo.Feedback;
import com.hh.pojo.Payment;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-09-10T03:56:43")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> lastName;
    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SetAttribute<User, Feedback> feedbackSet;
    public static volatile SetAttribute<User, Booking> bookingSet;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> userRole;
    public static volatile SetAttribute<User, Payment> paymentSet;
    public static volatile SingularAttribute<User, String> username;

}