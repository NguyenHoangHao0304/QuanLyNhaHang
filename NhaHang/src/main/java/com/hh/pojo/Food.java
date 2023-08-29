/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "food")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Food.findAll", query = "SELECT f FROM Food f"),
    @NamedQuery(name = "Food.findById", query = "SELECT f FROM Food f WHERE f.id = :id"),
    @NamedQuery(name = "Food.findByFoodName", query = "SELECT f FROM Food f WHERE f.foodName = :foodName"),
    @NamedQuery(name = "Food.findByFoodPrice", query = "SELECT f FROM Food f WHERE f.foodPrice = :foodPrice"),
    @NamedQuery(name = "Food.findByFoodImage", query = "SELECT f FROM Food f WHERE f.foodImage = :foodImage")})
public class Food implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "{food.name.notNull}")
    @Size(min = 5, max = 255, message = "{food.name.lenErr}")
    @Column(name = "food_name")
    private String foodName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull(message = "{food.price.notNull}")
    @Column(name = "food_price")
    private BigDecimal foodPrice;
    @Size(max = 255)
    @Column(name = "food_image")
    private String foodImage;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "foodId")
    private Set<BookingFood> bookingFoodSet;

    @Transient
    @JsonIgnore
    private MultipartFile file;
    
    public Food() {
    }

    public Food(Integer id) {
        this.id = id;
    }

    public Food(Integer id, String foodName, BigDecimal foodPrice) {
        this.id = id;
        this.foodName = foodName;
        this.foodPrice = foodPrice;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public BigDecimal getFoodPrice() {
        return foodPrice;
    }

    public void setFoodPrice(BigDecimal foodPrice) {
        this.foodPrice = foodPrice;
    }

    public String getFoodImage() {
        return foodImage;
    }

    public void setFoodImage(String foodImage) {
        this.foodImage = foodImage;
    }

    @XmlTransient
    public Set<BookingFood> getBookingFoodSet() {
        return bookingFoodSet;
    }

    public void setBookingFoodSet(Set<BookingFood> bookingFoodSet) {
        this.bookingFoodSet = bookingFoodSet;
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
        if (!(object instanceof Food)) {
            return false;
        }
        Food other = (Food) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hh.pojo.Food[ id=" + id + " ]";
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }
    
}
