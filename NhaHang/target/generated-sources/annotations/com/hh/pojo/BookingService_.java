package com.hh.pojo;

import com.hh.pojo.Booking;
import com.hh.pojo.Service;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-06T01:39:39")
@StaticMetamodel(BookingService.class)
public class BookingService_ { 

    public static volatile SingularAttribute<BookingService, Integer> id;
    public static volatile SingularAttribute<BookingService, Service> serviceId;
    public static volatile SingularAttribute<BookingService, Booking> bookingId;

}