/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.pojo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "booking")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booking.findAll", query = "SELECT b FROM Booking b"),
    @NamedQuery(name = "Booking.findById", query = "SELECT b FROM Booking b WHERE b.id = :id"),
    @NamedQuery(name = "Booking.findByBookingDate", query = "SELECT b FROM Booking b WHERE b.bookingDate = :bookingDate"),
    @NamedQuery(name = "Booking.findByStartTime", query = "SELECT b FROM Booking b WHERE b.startTime = :startTime"),
    @NamedQuery(name = "Booking.findByBookingName", query = "SELECT b FROM Booking b WHERE b.bookingName = :bookingName")})
public class Booking implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "booking_date")
    private LocalDate bookingDate;
    @Column(name = "start_time")
    @Temporal(TemporalType.TIME)
    private Date startTime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "booking_name")
    private String bookingName;
    @JoinColumn(name = "hall_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Hall hallId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bookingId")
    private Set<BookingFood> bookingFoodSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bookingId")
    private Set<BookingService> bookingServiceSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bookingId")
    private Set<Bill> billSet;

    public Booking() {
    }

    public Booking(Integer id) {
        this.id = id;
    }

    public Booking(Integer id, String bookingName) {
        this.id = id;
        this.bookingName = bookingName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getBookingName() {
        return bookingName;
    }

    public void setBookingName(String bookingName) {
        this.bookingName = bookingName;
    }

    public Hall getHallId() {
        return hallId;
    }

    public void setHallId(Hall hallId) {
        this.hallId = hallId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
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
        if (!(object instanceof Booking)) {
            return false;
        }
        Booking other = (Booking) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hh.pojo.Booking[ id=" + id + " ]";
    }
    /**
     * @return the bookingFoodSet
     */
    public Set<BookingFood> getBookingFoodSet() {
        return bookingFoodSet;
    }

    /**
     * @param bookingFoodSet the bookingFoodSet to set
     */
    public void setBookingFoodSet(Set<BookingFood> bookingFoodSet) {
        this.bookingFoodSet = bookingFoodSet;
    }

    /**
     * @return the bookingServiceSet
     */
    public Set<BookingService> getBookingServiceSet() {
        return bookingServiceSet;
    }

    /**
     * @param bookingServiceSet the bookingServiceSet to set
     */
    public void setBookingServiceSet(Set<BookingService> bookingServiceSet) {
        this.bookingServiceSet = bookingServiceSet;
    }

    /**
     * @return the billSet
     */
    public Set<Bill> getBillSet() {
        return billSet;
    }

    /**
     * @param billSet the billSet to set
     */
    public void setBillSet(Set<Bill> billSet) {
        this.billSet = billSet;
    }

}
