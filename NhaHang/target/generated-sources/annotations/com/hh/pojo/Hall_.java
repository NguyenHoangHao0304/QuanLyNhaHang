package com.hh.pojo;

import com.hh.pojo.Booking;
import com.hh.pojo.Branch;
import com.hh.pojo.HallPrice;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-13T17:29:15")
@StaticMetamodel(Hall.class)
public class Hall_ { 

    public static volatile SingularAttribute<Hall, String> hallImage;
    public static volatile SingularAttribute<Hall, Branch> branchId;
    public static volatile SetAttribute<Hall, HallPrice> hallPriceSet;
    public static volatile SetAttribute<Hall, Booking> bookingSet;
    public static volatile SingularAttribute<Hall, Integer> id;
    public static volatile SingularAttribute<Hall, String> hallName;
    public static volatile SingularAttribute<Hall, Integer> capacity;

}