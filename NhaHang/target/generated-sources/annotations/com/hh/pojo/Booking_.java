package com.hh.pojo;

import com.hh.pojo.Food;
import com.hh.pojo.Hall;
import com.hh.pojo.Payment;
import com.hh.pojo.Service;
import com.hh.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-03T03:58:59")
@StaticMetamodel(Booking.class)
public class Booking_ { 

    public static volatile SetAttribute<Booking, Food> foodSet;
    public static volatile SingularAttribute<Booking, Hall> hallId;
    public static volatile SingularAttribute<Booking, String> bookingName;
    public static volatile SingularAttribute<Booking, Date> bookingDate;
    public static volatile SingularAttribute<Booking, Date> startTime;
    public static volatile SingularAttribute<Booking, Integer> id;
    public static volatile SingularAttribute<Booking, Date> endTime;
    public static volatile SingularAttribute<Booking, User> userId;
    public static volatile SetAttribute<Booking, Payment> paymentSet;
    public static volatile SetAttribute<Booking, Service> serviceSet;

}