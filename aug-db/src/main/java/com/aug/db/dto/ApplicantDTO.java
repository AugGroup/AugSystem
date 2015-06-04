package com.aug.db.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import com.aug.db.entities.Applicant;

@Entity
@NamedNativeQueries({ 
	@NamedNativeQuery(name = "SEARCH_APPLICANT", query = " SELECT a.APPLICANT_CODE, a.FIRST_NAME_TH, a.FIRST_NAME_EN, a.LAST_NAME_TH, a.LAST_NAME_EN,"
			+ " a.TEL, a.EMAIL, a.APPLY_DATE, a.POSITION1_ID, a.POSITION2_ID, a.POSITION3_ID, a.TRACKING_STATUS, p.POSITION_NAME, p.ID "
			+ " FROM APPLICANT a JOIN POSITION p ON a.POSITION1_ID = p.ID OR a.POSITION2_ID = p.ID OR a.POSITION3_ID = p.ID WHERE p.POSITION_NAME = :POSITION ", resultClass = Applicant.class) })
public class ApplicantDTO {

	@Id
	@Column(name = "APPLICANT_ID")
	private Integer id;

	@Column(name = "APPLICANT_CODE")
	private String code;

	@Column(name = "FIRST_NAME_TH")
	private String firstNameTH;

	@Column(name = "FIRST_NAME_EN")
	private String firstNameEN;

	@Column(name = "LAST_NAME_TH")
	private String lastNameTH;

	@Column(name = "LAST_NAME_EN")
	private String lastNameEN;

	@Column(name = "TEL")
	private String tel;

	@Column(name = "EMAIL")
	private String eMail;

	@Column(name = "APPLY_DATE")
	private Date applyDate;

	@Column(name = "POSITION1_ID")
	private String position1;

	@Column(name = "POSITION2_ID")
	private String position2;

	@Column(name = "POSITION3_ID")
	private String position3;

	@Column(name = "TRACKING_STATUS")
	private String trackingStatus;
	
	@Column(name = "POSITION_NAME")
	private String positionName;

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getFirstNameTH() {
		return firstNameTH;
	}

	public void setFirstNameTH(String firstNameTH) {
		this.firstNameTH = firstNameTH;
	}

	public String getFirstNameEN() {
		return firstNameEN;
	}

	public void setFirstNameEN(String firstNameEN) {
		this.firstNameEN = firstNameEN;
	}

	public String getLastNameTH() {
		return lastNameTH;
	}

	public void setLastNameTH(String lastNameTH) {
		this.lastNameTH = lastNameTH;
	}

	public String getLastNameEN() {
		return lastNameEN;
	}

	public void setLastNameEN(String lastNameEN) {
		this.lastNameEN = lastNameEN;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getPosition1() {
		return position1;
	}

	public void setPosition1(String position1) {
		this.position1 = position1;
	}

	public String getPosition2() {
		return position2;
	}

	public void setPosition2(String position2) {
		this.position2 = position2;
	}

	public String getPosition3() {
		return position3;
	}

	public void setPosition3(String position3) {
		this.position3 = position3;
	}

	public String getTrackingStatus() {
		return trackingStatus;
	}

	public void setTrackingStatus(String trackingStatus) {
		this.trackingStatus = trackingStatus;
	}

}
