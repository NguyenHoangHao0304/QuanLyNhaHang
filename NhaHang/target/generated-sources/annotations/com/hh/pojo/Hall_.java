package com.hh.pojo;

import com.hh.pojo.Booking;
import com.hh.pojo.Branch;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-28T22:48:01")
@StaticMetamodel(Hall.class)
public class Hall_ { 

    public static volatile SingularAttribute<Hall, Branch> branchId;
    public static volatile SingularAttribute<Hall, BigDecimal> priceAfternoon;
    public static volatile SingularAttribute<Hall, BigDecimal> priceEvening;
    public static volatile SingularAttribute<Hall, BigDecimal> priceWeekend;
    public static volatile SetAttribute<Hall, Booking> bookingSet;
    public static volatile SingularAttribute<Hall, Integer> id;
    public static volatile SingularAttribute<Hall, BigDecimal> priceMorning;
    public static volatile SingularAttribute<Hall, String> hallName;
    public static volatile SingularAttribute<Hall, Integer> capacity;

}