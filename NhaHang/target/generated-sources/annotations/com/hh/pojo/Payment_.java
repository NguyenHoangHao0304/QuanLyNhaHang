package com.hh.pojo;

import com.hh.pojo.Bill;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-08-14T00:40:33")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SetAttribute<Payment, Bill> billSet;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Integer> id;
    public static volatile SingularAttribute<Payment, Date> paymentDate;

}