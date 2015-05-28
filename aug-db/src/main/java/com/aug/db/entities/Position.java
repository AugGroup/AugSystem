package com.aug.db.entities;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;



@Entity
@Table(name = "POSITION")
public class Position {
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	@Column(name = "POSITION_NAME")
	private String positionName;
	@Column(name = "POSITON_CODE")
	private String positionCode;
	
	@ManyToOne
	@JoinColumn(name="DEPARTMENT_ID")
	private Department department;
	
	@ManyToMany(mappedBy="positions")
	private List<Applicant> applicantList;
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	} 
	
	public List<Applicant> getApplicantList() {
		return applicantList;
	}

	public void setApplicantList(List<Applicant> applicantList) {
		this.applicantList = applicantList;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	

}
