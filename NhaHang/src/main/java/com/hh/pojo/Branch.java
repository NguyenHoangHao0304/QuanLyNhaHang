/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hh.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "branch")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Branch.findAll", query = "SELECT b FROM Branch b"),
    @NamedQuery(name = "Branch.findById", query = "SELECT b FROM Branch b WHERE b.id = :id"),
    @NamedQuery(name = "Branch.findByBranchName", query = "SELECT b FROM Branch b WHERE b.branchName = :branchName"),
    @NamedQuery(name = "Branch.findByBranchAddress", query = "SELECT b FROM Branch b WHERE b.branchAddress = :branchAddress")})
public class Branch implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "{branch.name.notNull}")
    @Size(min = 5, max = 255, message = "{branch.name.lenErr}")
    @Column(name = "branch_name")
    private String branchName;
    @Basic(optional = false)
    @NotNull(message = "{branch.adress.notNull}")
    @Size(min = 5, max = 255, message = "{branch.adress.lenErr}")
    @Column(name = "branch_address")
    private String branchAddress;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "branchId")
    @JsonIgnore
    private Set<Feedback> feedbackSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "branchId")
    @JsonIgnore
    private Set<Hall> hallSet;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "branchId")
    @JsonIgnore
    private Set<Employee> employeeSet;

    public Branch() {
    }

    public Branch(Integer id) {
        this.id = id;
    }

    public Branch(Integer id, String branchName, String branchAddress) {
        this.id = id;
        this.branchName = branchName;
        this.branchAddress = branchAddress;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getBranchAddress() {
        return branchAddress;
    }

    public void setBranchAddress(String branchAddress) {
        this.branchAddress = branchAddress;
    }

    @XmlTransient
    public Set<Feedback> getFeedbackSet() {
        return feedbackSet;
    }

    public void setFeedbackSet(Set<Feedback> feedbackSet) {
        this.feedbackSet = feedbackSet;
    }

    @XmlTransient
    public Set<Hall> getHallSet() {
        return hallSet;
    }

    public void setHallSet(Set<Hall> hallSet) {
        this.hallSet = hallSet;
    }

    @XmlTransient
    public Set<Employee> getEmployeeSet() {
        return employeeSet;
    }

    public void setEmployeeSet(Set<Employee> employeeSet) {
        this.employeeSet = employeeSet;
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
        if (!(object instanceof Branch)) {
            return false;
        }
        Branch other = (Branch) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hh.pojo.Branch[ id=" + id + " ]";
    }
    
}
