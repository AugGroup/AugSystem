package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "EDUCATION")
public class Education {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;

	@Column(name = "SCHOOL_NAME")
	private String schoolName;

	@Column(name = "DEGREE")
	private String degree;

	@Column(name = "FACULTY")
	private String faculty;

	@Column(name = "MAJOR")
	private String major;

	@Column(name = "GPA")
	private double gpa;

	@Column(name = "YEAR_OF_GRADUATE")
	private String yearsOfGraduate;
	
	/*@ManyToOne()
	@JoinColumn(name="applicantId")
	@Column(name = "APPLICANT_ID")
	private Applicant applicantId;

	public Applicant getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Applicant applicantId) {
		this.applicantId = applicantId;
	}*/

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public String getYearsOfGraduate() {
		return yearsOfGraduate;
	}

	public void setYearsOfGraduate(String yearsOfGraduate) {
		this.yearsOfGraduate = yearsOfGraduate;
	}

}
