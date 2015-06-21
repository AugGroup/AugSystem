package com.aug.db.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import com.fasterxml.jackson.annotation.JsonFormat;

@NamedNativeQueries({ @NamedNativeQuery(name = "REPORT_APPLICANT", query = "SELECT "
		+ "applicant.APPLICANT_ID AS id ,"
		+ "applicant.AGE AS age,"
		+ "applicant.APPLICANT_STATUS AS applicantStatus,"
		+ "applicant.APPLY_DATE AS applyDate,"
		+ "applicant.ATTITUDE_HOME AS attitudeHome,"
		+ "applicant.ATTITUDE_OFFICE AS attitudeOffice,"
		+ "applicant.CERTIFICATE AS certificate,"
		+ "applicant.APPLICANT_CODE AS code,"
		+ "applicant.EMAIL AS email,"
		+ "applicant.FIRSTNAME_EN AS firstNameEn,"
		+ "applicant.LASTNAME_EN AS lastNameEn,"
		+ "applicant.SCORE AS score,"
		+ "applicant.SEX AS sex,"
		+ "applicant.TECH_SCORE AS techScore,"
		+ "applicant.TEL AS tel,"
		+ "applicant.TRACKING_STATUS AS trackingStatus,"
		+ "applicant.POSITION1_ID AS position1,"
		+ "applicant.POSITION2_ID AS position2,"
		+ "applicant.POSITION3_ID AS position3,"
		+ "education.DEGREE AS degree,"
		+ "education.FACULTY AS faculty,"
		+ "education.GPA AS gpa,"
		+ "education.MAJOR AS major,"
		+ "education.SCHOOL_NAME AS schoolName,"
		+ "education.YEAR_OF_GRADUATE AS yearOfgraduate,"
		+ "education.APPLICANT_ID AS applicantId,"
		+ "position1.ID AS pos1Id,"
		+ "position1.POSITON_CODE AS position1Code,"
		+ "position1.POSITION_NAME AS position1Name,"
		+ "position1.DEPARTMENT_ID AS department1,"
		+ "position2.ID AS pos2Id,"
		+ "position2.POSITON_CODE AS position2Code,"
		+ "position2.POSITION_NAME AS position2Name,"
		+ "position2.DEPARTMENT_ID AS department2,"
		+ "position3.ID AS pos3Id,"
		+ "position3.POSITON_CODE AS position3Code,"
		+ "position3.POSITION_NAME AS position3Name,"
		+ "position3.DEPARTMENT_ID AS department3 "
		+ "FROM APPLICANT applicant LEFT JOIN EDUCATION education ON applicant.APPLICANT_ID = education.APPLICANT_ID "
		+ "LEFT JOIN POSITION position1 ON applicant.POSITION1_ID = position1.ID "
		+ "LEFT JOIN POSITION position2 ON applicant.POSITION2_ID = position2.ID "
		+ "LEFT JOIN POSITION position3 ON applicant.POSITION3_ID = position3.ID ", resultClass = ReportApplicantDTO.class) })
@Entity
public class ReportApplicantDTO {

	@Id
	@Column(name = "id")
	private Integer id;

	@Column(name = "age")
	private Integer age;

	@Column(name = "applicantStatus")
	private String applicantStatus;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "applyDate")
	private Date applyDate;

	@Column(name = "attitudeHome")
	private String attitudeHome;

	@Column(name = "attitudeOffice")
	private String attitudeOffice;

	@Column(name = "code")
	private String code;

	@Column(name = "certificate")
	private String certificate;

	@Column(name = "email")
	private String email;

	@Column(name = "firstNameEN")
	private String firstNameEN;

	@Column(name = "lastNameEN")
	private String lastNameEN;

	@Column(name = "sex")
	private String sex;

	@Column(name = "tel")
	private String tel;

	@Column(name = "score")
	private String score;

	@Column(name = "techScore")
	private String techScore;

	@Column(name = "trackingStatus")
	private String trackingStatus;

	@Column(name = "position1")
	private Integer position1;
	
	@Column(name = "position2")
	private Integer position2;
	
	@Column(name = "position3")
	private Integer position3;
	

	@Column(name = "degree")
	private String degree;

	@Column(name = "faculty")
	private String faculty;

	@Column(name = "gpa")
	private double gpa;

	@Column(name = "major")
	private String major;

	@Column(name = "schoolName")
	private String schoolName;

	@Column(name = "yearOfGraduate")
	private String yearOfGraduate;
	
	@Column(name = "ApplicantId")
	private String ApplicantId;
	
	@Column(name = "pos1Id")
	private Integer pos1Id;	
	@Column(name = "pos2Id")
	private Integer pos2Id;	
	@Column(name = "pos3Id")
	private Integer pos3Id;
		
	@Column(name = "position1Code")
	private Integer position1Code;	
	@Column(name = "position2Code")
	private Integer position2Code;
	@Column(name = "position3Code")
	private Integer position3Code;

	@Column(name = "position1Name")
	private Integer position1Name;	
	@Column(name = "position2Name")
	private Integer position2Name;
	@Column(name = "position3Name")
	private Integer position3Name;
	
	@Column(name = "department1")
	private Integer department1;
	@Column(name = "department2")
	private Integer department2;
	@Column(name = "department3")
	private Integer department3;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getApplicantStatus() {
		return applicantStatus;
	}
	public void setApplicantStatus(String applicantStatus) {
		this.applicantStatus = applicantStatus;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public String getAttitudeHome() {
		return attitudeHome;
	}
	public void setAttitudeHome(String attitudeHome) {
		this.attitudeHome = attitudeHome;
	}
	public String getAttitudeOffice() {
		return attitudeOffice;
	}
	public void setAttitudeOffice(String attitudeOffice) {
		this.attitudeOffice = attitudeOffice;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstNameEN() {
		return firstNameEN;
	}
	public void setFirstNameEN(String firstNameEN) {
		this.firstNameEN = firstNameEN;
	}
	public String getLastNameEN() {
		return lastNameEN;
	}
	public void setLastNameEN(String lastNameEN) {
		this.lastNameEN = lastNameEN;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getTechScore() {
		return techScore;
	}
	public void setTechScore(String techScore) {
		this.techScore = techScore;
	}
	public String getTrackingStatus() {
		return trackingStatus;
	}
	public void setTrackingStatus(String trackingStatus) {
		this.trackingStatus = trackingStatus;
	}
	public Integer getPosition1() {
		return position1;
	}
	public void setPosition1(Integer position1) {
		this.position1 = position1;
	}
	public Integer getPosition2() {
		return position2;
	}
	public void setPosition2(Integer position2) {
		this.position2 = position2;
	}
	public Integer getPosition3() {
		return position3;
	}
	public void setPosition3(Integer position3) {
		this.position3 = position3;
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
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
		this.gpa = gpa;
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
	public String getYearOfGraduate() {
		return yearOfGraduate;
	}
	public void setYearOfGraduate(String yearOfGraduate) {
		this.yearOfGraduate = yearOfGraduate;
	}
	public String getApplicantId() {
		return ApplicantId;
	}
	public void setApplicantId(String applicantId) {
		ApplicantId = applicantId;
	}
	public Integer getPos1Id() {
		return pos1Id;
	}
	public void setPos1Id(Integer pos1Id) {
		this.pos1Id = pos1Id;
	}
	public Integer getPos2Id() {
		return pos2Id;
	}
	public void setPos2Id(Integer pos2Id) {
		this.pos2Id = pos2Id;
	}
	public Integer getPos3Id() {
		return pos3Id;
	}
	public void setPos3Id(Integer pos3Id) {
		this.pos3Id = pos3Id;
	}
	public Integer getPosition1Code() {
		return position1Code;
	}
	public void setPosition1Code(Integer position1Code) {
		this.position1Code = position1Code;
	}
	public Integer getPosition2Code() {
		return position2Code;
	}
	public void setPosition2Code(Integer position2Code) {
		this.position2Code = position2Code;
	}
	public Integer getPosition3Code() {
		return position3Code;
	}
	public void setPosition3Code(Integer position3Code) {
		this.position3Code = position3Code;
	}
	public Integer getPosition1Name() {
		return position1Name;
	}
	public void setPosition1Name(Integer position1Name) {
		this.position1Name = position1Name;
	}
	public Integer getPosition2Name() {
		return position2Name;
	}
	public void setPosition2Name(Integer position2Name) {
		this.position2Name = position2Name;
	}
	public Integer getPosition3Name() {
		return position3Name;
	}
	public void setPosition3Name(Integer position3Name) {
		this.position3Name = position3Name;
	}
	public Integer getDepartment1() {
		return department1;
	}
	public void setDepartment1(Integer department1) {
		this.department1 = department1;
	}
	public Integer getDepartment2() {
		return department2;
	}
	public void setDepartment2(Integer department2) {
		this.department2 = department2;
	}
	public Integer getDepartment3() {
		return department3;
	}
	public void setDepartment3(Integer department3) {
		this.department3 = department3;
	}
	
	
	
	
}