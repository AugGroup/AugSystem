package com.aug.db.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_EXPERIENCE", query = "SELECT e.ID, e.ADDRESS, e.DESCRIPTION, e.EMPLOYER_NAME, e.FROM_DATE,"
		+ "e.POSITION, e.POSITION_OF_EMPLOYER, e.REASON, e.SALARY, e.SUPERVISOR, e.TO_DATE, e.TYPE_OF_BUSSINESS, e.APPLICANT_ID"
		+ " FROM EXPERIENCE e LEFT JOIN APPLICANT a on e.APPLICANT_ID = a.APPLICANT_ID WHERE e.APPLICANT_ID = :ID", resultClass = ExperienceDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_EXPERIENCE_ID", query = "SELECT e.ID, e.ADDRESS, e.DESCRIPTION, e.EMPLOYER_NAME, e.FROM_DATE,"
			+ "e.POSITION, e.POSITION_OF_EMPLOYER, e.REASON, e.SALARY, e.SUPERVISOR, e.TO_DATE, e.TYPE_OF_BUSSINESS, e.APPLICANT_ID"
			+ " FROM EXPERIENCE e WHERE e.APPLICANT_ID = :ID", resultClass = ExperienceDTO.class)
	})
public class ExperienceDTO {
	
	@Id
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "ADDRESS")
	private String address;
	
	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "EMPLOYER_NAME")
	private String employerName;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "FROM_DATE")
	private Date fromDate;
	
	@Column(name = "POSITION")
	private String position;
	
	@Column(name = "POSITION_OF_EMPLOYER")
	private String positionOfEmployer;
	
	@Column(name = "REASON")
	private String reason;
	
	@Column(name = "SALARY")
	private long salary;
	
	@Column(name = "SUPERVISOR")
	private String supervisor;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "TO_DATE")
	private Date toDate;
	
	@Column(name = "TYPE_OF_BUSSINESS")
	private String typeOfBusiness;
	
	@Column(name = "APPLICANT_ID")
	private Integer applicantId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public long getSalary() {
		return salary;
	}

	public void setSalary(long salary) {
		this.salary = salary;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getTypeOfBusiness() {
		return typeOfBusiness;
	}

	public void setTypeOfBusiness(String typeOfBusiness) {
		this.typeOfBusiness = typeOfBusiness;
	}

	public Integer getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}
	
	

}
