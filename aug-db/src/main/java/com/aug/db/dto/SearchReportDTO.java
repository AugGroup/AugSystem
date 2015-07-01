package com.aug.db.dto;


public class SearchReportDTO {
	

	private Integer position;
	private String degree;
	private String major;
	private String schoolName;
	private Double gpa;
	private Integer applyDate;
	private String reportType;
	
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public Double getGpa() {
		return gpa;
	}
	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public Integer getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Integer applyDate) {
		this.applyDate = applyDate;
	}
	

}
