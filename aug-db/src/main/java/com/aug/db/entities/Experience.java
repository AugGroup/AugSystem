package com.aug.db.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "EXPERIENCE")
public class Experience {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="APPLICANT_ID")
	private Applicant applicant;
	
	public Applicant getApplicant() {
		return applicant;
	}

	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}

	@Column(name = "POSITION") // position of applicant
	private String position;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "FROM_DATE")
	private Date fromDate;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "TO_DATE")
	private Date toDate;

	@Column(name = "EMPLOYER_NAME")
	private String employerName;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "TYPE_OF_BUSSINESS")
	private String typeOfBusiness;

	@Column(name = "POSITION_OF_EMPLOYER") //??
	private String positionOfEmployer;

	@Column(name = "REASON")
	private String reason;

	@Column(name = "SUPERVISOR")
	private String supervisor;

	@Column(name = "SALARY")
	private long salary;

	@Column(name = "DESCRIPTION")
	private String description;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTypeOfBusiness() {
		return typeOfBusiness;
	}

	public void setTypeOfBusiness(String typeOfBusiness) {
		this.typeOfBusiness = typeOfBusiness;
	}

	public String getPositionOfEmployer() {
		return positionOfEmployer;
	}

	public void setPositionOfEmployer(String positionOfEmployer) {
		this.positionOfEmployer = positionOfEmployer;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public long getSalary() {
		return salary;
	}

	public void setSalary(long salary) {
		this.salary = salary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
