package com.hh.pojo;

import com.hh.pojo.Booking;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-03T04:25:02")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, BigDecimal> total;
    public static volatile SetAttribute<Payment, Booking> bookingSet;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Integer> id;
    public static volatile SingularAttribute<Payment, Date> paymentDate;

}