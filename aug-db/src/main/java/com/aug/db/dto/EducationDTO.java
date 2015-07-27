package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_EDUCATION", query = "SELECT ed.ID, ed.SCHOOL_NAME, ed.DEGREE, ed.FACULTY, ed.MAJOR,"
		+ "ed.GPA, ed.YEAR_OF_GRADUATE, ed.APPLICANT_ID"
		+ " FROM EDUCATION ed LEFT JOIN APPLICANT a on ed.APPLICANT_ID = a.APPLICANT_ID WHERE ed.APPLICANT_ID = :ID", resultClass = EducationDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_EDUCATION_ID", query = "SELECT ed.ID, ed.SCHOOL_NAME, ed.DEGREE, ed.FACULTY, ed.MAJOR,"
			+ "ed.GPA, ed.YEAR_OF_GRADUATE, ed.APPLICANT_ID"
			+ " FROM EDUCATION ed WHERE ed.ID = :ID", resultClass = EducationDTO.class)
	})
public class EducationDTO {
	
	@Id
	@Column(name ="ID")
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
	
	@Column(name = "APPLICANT_ID")
	private Integer applicantId;

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

	public Integer getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}
	
	

}
