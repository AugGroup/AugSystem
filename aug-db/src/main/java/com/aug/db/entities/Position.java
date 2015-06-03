package com.aug.db.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

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
	@JoinColumn(name = "DEPARTMENT_ID")
	private Department department;

	@OneToMany(mappedBy = "position1")
	private List<Applicant> applicantList1;

	@OneToMany(mappedBy = "position2")
	private List<Applicant> applicantList2;

	@OneToMany(mappedBy = "position3")
	private List<Applicant> applicantList3;

	public List<Applicant> getApplicantList1() {
		return applicantList1;
	}

	public void setApplicantList1(List<Applicant> applicantList1) {
		this.applicantList1 = applicantList1;
	}

	public List<Applicant> getApplicantList2() {
		return applicantList2;
	}

	public void setApplicantList2(List<Applicant> applicantList2) {
		this.applicantList2 = applicantList2;
	}

//	public List<Applicant> getApplicantList3() {
//		return applicantList3;
//	}
//
//	public void setApplicantList3(List<Applicant> applicantList3) {
//		this.applicantList3 = applicantList3;
//	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
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
