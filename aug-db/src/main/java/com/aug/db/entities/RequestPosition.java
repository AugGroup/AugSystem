/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Supannika Pattanodom
 */
@Entity
@Table(name="REQUEST_POSITION")
public class RequestPosition {

    @Id
    @GeneratedValue
    @Column(name = "REQPOSITION_ID")
    private Integer ReqPositionId;
    
    @Column(name = "POSITION_NAME")
    private String positionName;
    
    @Column(name = "SPECIFIC_SKILL")
    private String specificSkill;
    
    @Column(name = "YEAR_EXPERIENCE")
    private Integer yearExperience;
    
    

    @ManyToOne
    @JoinColumn(name="requestId")
    private Request request;

    public Integer getReqPositionId() {
        return ReqPositionId;
    }

    public void setReqPositionId(Integer ReqPositionId) {
        this.ReqPositionId = ReqPositionId;
    }
    
    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getSpecificSkill() {
        return specificSkill;
    }

    public void setSpecificSkill(String specificSkill) {
        this.specificSkill = specificSkill;
    }

    public Integer getYearExperience() {
        return yearExperience;
    }

    public void setYearExperience(Integer yearExperience) {
        this.yearExperience = yearExperience;
    }

    public Request getRequest() {
        return request;
    }

    public void setRequest(Request request) {
        this.request = request;
    }
    
    
    
}
