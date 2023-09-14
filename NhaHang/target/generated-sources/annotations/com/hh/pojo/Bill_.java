package com.hh.pojo;

import com.hh.pojo.Booking;
import com.hh.pojo.Payment;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-09-13T16:43:15")
@StaticMetamodel(Bill.class)
public class Bill_ { 

    public static volatile SingularAttribute<Bill, BigDecimal> unitPrice;
    public static volatile SingularAttribute<Bill, Payment> paymentId;
    public static volatile SingularAttribute<Bill, Integer> num;
    public static volatile SingularAttribute<Bill, Integer> id;
    public static volatile SingularAttribute<Bill, Booking> bookingId;

}