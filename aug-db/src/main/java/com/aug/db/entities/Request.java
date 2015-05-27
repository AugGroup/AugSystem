/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.entities;

import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Supannika Pattanodom
 */
@Entity
@Table(name = "REQUEST")
public class Request {
    
    @Id
    @Column(name = "ID")
    private Integer id;
    
    @Column(name = "REQUEST_DATE")
    private Date requestDate;
    
    @Column(name = "REQUESTER_NAME")
    private String requesterName;
    
    @Column(name = "APPROVAL_NAME")
    private String approvalName;
    
    @Column(name = "APPROVAL_DATE")
    private Date approvalDate;
    
    @OneToMany (mappedBy = "REQUEST")
    private List<RequestPosition> requestPosition;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getRequesterName() {
        return requesterName;
    }

    public void setRequesterName(String requesterName) {
        this.requesterName = requesterName;
    }

    public String getApprovalName() {
        return approvalName;
    }

    public void setApprovalName(String approvalName) {
        this.approvalName = approvalName;
    }

    public Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Date approvalDate) {
        this.approvalDate = approvalDate;
    }

    public List<RequestPosition> getRequestPosition() {
        return requestPosition;
    }

    public void setRequestPosition(List<RequestPosition> requestPosition) {
        this.requestPosition = requestPosition;
    }
    
    
    
    
}
