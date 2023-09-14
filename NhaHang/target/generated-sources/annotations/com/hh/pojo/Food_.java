package com.hh.pojo;

import com.hh.pojo.BookingFood;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-09-13T16:43:15")
@StaticMetamodel(Food.class)
public class Food_ { 

    public static volatile SingularAttribute<Food, BigDecimal> foodPrice;
    public static volatile SingularAttribute<Food, String> foodName;
    public static volatile SetAttribute<Food, BookingFood> bookingFoodSet;
    public static volatile SingularAttribute<Food, Integer> id;
    public static volatile SingularAttribute<Food, String> foodImage;

}