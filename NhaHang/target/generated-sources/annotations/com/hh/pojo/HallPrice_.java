package com.hh.pojo;

import com.hh.pojo.Hall;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-10T03:10:33")
@StaticMetamodel(HallPrice.class)
public class HallPrice_ { 

    public static volatile SingularAttribute<HallPrice, Date> timeEnd;
    public static volatile SingularAttribute<HallPrice, Date> timeStart;
    public static volatile SingularAttribute<HallPrice, Hall> hallId;
    public static volatile SingularAttribute<HallPrice, BigDecimal> price;
    public static volatile SingularAttribute<HallPrice, String> timePeriod;
    public static volatile SingularAttribute<HallPrice, Integer> id;

}