/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "hall")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Hall.findAll", query = "SELECT h FROM Hall h"),
    @NamedQuery(name = "Hall.findById", query = "SELECT h FROM Hall h WHERE h.id = :id"),
    @NamedQuery(name = "Hall.findByHallName", query = "SELECT h FROM Hall h WHERE h.hallName = :hallName"),
    @NamedQuery(name = "Hall.findByCapacity", query = "SELECT h FROM Hall h WHERE h.capacity = :capacity"),
    @NamedQuery(name = "Hall.findByPriceMorning", query = "SELECT h FROM Hall h WHERE h.priceMorning = :priceMorning"),
    @NamedQuery(name = "Hall.findByPriceAfternoon", query = "SELECT h FROM Hall h WHERE h.priceAfternoon = :priceAfternoon"),
    @NamedQuery(name = "Hall.findByPriceEvening", query = "SELECT h FROM Hall h WHERE h.priceEvening = :priceEvening"),
    @NamedQuery(name = "Hall.findByPriceWeekend", query = "SELECT h FROM Hall h WHERE h.priceWeekend = :priceWeekend")})
public class Hall implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "hall_name")
    private String hallName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "capacity")
    private int capacity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "price_morning")
    private BigDecimal priceMorning;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price_afternoon")
    private BigDecimal priceAfternoon;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price_evening")
    private BigDecimal priceEvening;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price_weekend")
    private BigDecimal priceWeekend;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "hallId")
    private Set<Booking> bookingSet;
    @JoinColumn(name = "branch_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Brach branchId;

    public Hall() {
    }

    public Hall(Integer id) {
        this.id = id;
    }

    public Hall(Integer id, String hallName, int capacity, BigDecimal priceMorning, BigDecimal priceAfternoon, BigDecimal priceEvening, BigDecimal priceWeekend) {
        this.id = id;
        this.hallName = hallName;
        this.capacity = capacity;
        this.priceMorning = priceMorning;
        this.priceAfternoon = priceAfternoon;
        this.priceEvening = priceEvening;
        this.priceWeekend = priceWeekend;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public BigDecimal getPriceMorning() {
        return priceMorning;
    }

    public void setPriceMorning(BigDecimal priceMorning) {
        this.priceMorning = priceMorning;
    }

    public BigDecimal getPriceAfternoon() {
        return priceAfternoon;
    }

    public void setPriceAfternoon(BigDecimal priceAfternoon) {
        this.priceAfternoon = priceAfternoon;
    }

    public BigDecimal getPriceEvening() {
        return priceEvening;
    }

    public void setPriceEvening(BigDecimal priceEvening) {
        this.priceEvening = priceEvening;
    }

    public BigDecimal getPriceWeekend() {
        return priceWeekend;
    }

    public void setPriceWeekend(BigDecimal priceWeekend) {
        this.priceWeekend = priceWeekend;
    }

    @XmlTransient
    public Set<Booking> getBookingSet() {
        return bookingSet;
    }

    public void setBookingSet(Set<Booking> bookingSet) {
        this.bookingSet = bookingSet;
    }

    public Brach getBranchId() {
        return branchId;
    }

    public void setBranchId(Brach branchId) {
        this.branchId = branchId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Hall)) {
            return false;
        }
        Hall other = (Hall) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hh.pojo.Hall[ id=" + id + " ]";
    }
    
}
