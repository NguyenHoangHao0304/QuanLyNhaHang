package com.hh.pojo;

import com.hh.pojo.BookingService;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-09-13T16:43:15")
@StaticMetamodel(Service.class)
public class Service_ { 

    public static volatile SetAttribute<Service, BookingService> bookingServiceSet;
    public static volatile SingularAttribute<Service, BigDecimal> servicePrice;
    public static volatile SingularAttribute<Service, String> serviceDescription;
    public static volatile SingularAttribute<Service, String> serviceImage;
    public static volatile SingularAttribute<Service, Integer> id;
    public static volatile SingularAttribute<Service, String> serviceName;

}