package com.hh.pojo;

import com.hh.pojo.Bill;
import com.hh.pojo.BookingFood;
import com.hh.pojo.BookingService;
import com.hh.pojo.Hall;
import com.hh.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-14T00:40:33")
@StaticMetamodel(Booking.class)
public class Booking_ { 

    public static volatile SetAttribute<Booking, BookingService> bookingServiceSet;
    public static volatile SingularAttribute<Booking, Hall> hallId;
    public static volatile SingularAttribute<Booking, String> bookingName;
    public static volatile SetAttribute<Booking, BookingFood> bookingFoodSet;
    public static volatile SetAttribute<Booking, Bill> billSet;
    public static volatile SingularAttribute<Booking, Date> bookingDate;
    public static volatile SingularAttribute<Booking, Date> startTime;
    public static volatile SingularAttribute<Booking, Integer> id;
    public static volatile SingularAttribute<Booking, Date> endTime;
    public static volatile SingularAttribute<Booking, User> userId;

}