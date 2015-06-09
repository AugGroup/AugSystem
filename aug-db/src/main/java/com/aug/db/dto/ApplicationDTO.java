package com.aug.db.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Transient;

import org.hibernate.annotations.Index;

import com.fasterxml.jackson.annotation.JsonFormat;
@Entity
@NamedNativeQueries({ @NamedNativeQuery(name = "DATA_APPLICANT", query = "SELECT FIRSTNAME_TH,FIRSTNAME_EN,LASTNAME_TH,LASTNAME_EN,NICKNAME_TH,NICKNAME_EN"
		+ ",BIRTHDATE,PLACE_BIRTH,AGE,HEIGHT,WEIGHT,RELIGION,NATIONALITY,TEL,EMAIL,APPLY_DATE,EMERGENCY_NAME"
		+ ",EMERGENCY_TEL,EMERGENCY_ADDRESS,NOTICE_NEWSPAPER,NOTICE_MAGAZINE,NOTICE_FRIEND,NOTICE_WEBSITE,NOTICE_OTHER"
		+ ",CERTIFICATE,EXPECTED_SALARY,CARD_ID,CARD_ISSUED_OFFICE,CARD_EXPIRY_DATE,MILITARY_FROM_YEAR"
		+ ",MILITARY_TO_YEAR,MILITARY_PLACE,MILITARY_SERVICE_NO,MILITARY_REASON,MILITARY_STATUS,MARRITAL_STATUS_NAME"
		+ ",NUMBER_OF_CHILDREN,SPOUSE_NAME,MARRIAGE_CERTIFICATE_NO,ISSUE_OFFICE_MARRIAGE,OCCUPATION_MARRIAGE"+
" FROM APPLICANT WHERE FIRSTNAME_TH = :FIRSTNAME_TH AND FIRSTNAME_EN = :FIRSTNAME_EN AND LASTNAME_TH = :LASTNAME_TH AND LASTNAME_EN = :LASTNAME_EN AND NICKNAME_TH = :NICKNAME_TH AND NICKNAME_EN = :NICKNAME_EN "
+ "AND BIRTHDATE = :BIRTHDATE AND PLACE_BIRTH = :PLACE_BIRTH AND AGE = :AGE AND HEIGHT = :HEIGHT AND WEIGHT = :WEIGHT AND RELIGION = :RELIGION AND NATIONALITY = :NATIONALITY AND TEL = :TEL "
+ "AND NATIONALITY = :NATIONALITY AND TEL", resultClass = ApplicationDTO.class) })
public class ApplicationDTO {

	@Column(name = "POSITION_NAME")
	private String positionName;

	@Id
	@Column(name = "APPLICANT_ID")
	private Integer id;

	@Column(name = "APPLICANT_CODE")
	private String code;

	@Column(name = "FIRSTNAME_TH")
	private String firstNameTH;

	@Column(name = "FIRSTNAME_EN")
	private String firstNameEN;

	@Column(name = "LASTNAME_TH")
	private String lastNameTH;

	@Column(name = "LASTNAME_EN")
	private String lastNameEN;

	@Column(name = "NICKNAME_TH")
	private String nickNameTH;

	@Column(name = "NICKNAME_EN")
	private String nickNameEN;

	@Column(name = "BIRTHDATE")
	private Date birthDate;
	
	@Column(name = "PLACE_BIRTH")
	private String placeBirth;

	@Column(name = "AGE")
	private Integer age;

	@Column(name = "HEIGHT")
	private Integer height;

	@Column(name = "WEIGHT")
	private Integer weight;

	@Column(name = "RELIGION")
	private String religion;

	@Column(name = "NATIONALITY")
	private String nationality;

	@Column(name = "TEL")
	private String tel;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "APPLICANT_STATUS")
	private String ApplicantStatus;

	@Column(name = "APPLY_DATE")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	private Date applyDate;

	@Transient
	private String applyDateStr;

	@Column(name = "EMERGENCY_NAME")
	private String emergencyName;

	@Column(name = "EMERGENCY_TEL")
	private String emergencyTel;

	@Column(name = "EMERGENCY_ADDRESS")
	private String emergencyAddress;

	@Column(name = "NOTICE_NEWSPAPER")
	private String noticeNewspaper;

	@Column(name = "NOTICE_MAGAZINE")
	private String noticeMagazine;

	@Column(name = "NOTICE_FRIEND")
	private String noticeFriend;

	@Column(name = "NOTICE_WEBSITE")
	private String noticeWebSite;

	@Column(name = "NOTICE_OTHER")
	private String noticeOther;

	@Column(name = "TRACKING_STATUS")
	private String trackingStatus;

	@Column(name = "CERTIFICATE")
	private String certificate;

	@Column(name = "EXPECTED_SALARY")
	private String expectedSalary;

	@Column(name = "CARD_ID")
	private String cardId;

	@Column(name = "CARD_ISSUED_OFFICE")
	private String cardIssuedOffice;

	@Column(name = "CARD_EXPIRY_DATE")
	private Date cardExpiryDate;

	@Column(name = "MILITARY_FROM_YEAR")
	private String militaryFromYear;

	@Column(name = "MILITARY_TO_YEAR")
	private String militarytoYear;

	@Column(name = "MILITARY_PLACE")
	private String militaryPlace;

	@Column(name = "MILITARY_SERVICE_NO")
	private String militaryServiceNo;

	@Column(name = "MILITARY_REASON")
	private String militaryReason;

	@Column(name = "MILITARY_STATUS")
	private String militaryStatus;

	@Column(name = "MARRITAL_STATUS_NAME")
	private String marritalStatusName;

	@Column(name = "NUMBER_OF_CHILDREN")
	private Integer numberOfChildren;

	@Column(name = "SPOUSE_NAME")
	private String spouseName;

	@Column(name = "MARRIAGE_CERTIFICATE_NO")
	private String marriageCertificateNo;

	@Column(name = "ISSUE_OFFICE_MARRIAGE")
	private String issueOficeMarriage;

	@Column(name = "OCCUPATION_MARRIAGE")
	private String occupationMarriage;

	@Column(name = "TECH_SCORE")
	private String techScore;

	@Column(name = "ATTITUDE")
	private String attitude;

	@Column(name = "POSITION1_ID")
	private Integer position1;

	@Column(name = "POSITION2_ID")
	private Integer position2;

	@Column(name = "POSITION3_ID")
	private Integer position3;

	@Transient
	private String position1Str;

	@Transient
	private String position2Str;

	@Transient
	private String position3Str;

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

	public String getNickNameTH() {
		return nickNameTH;
	}

	public void setNickNameTH(String nickNameTH) {
		this.nickNameTH = nickNameTH;
	}

	public String getNickNameEN() {
		return nickNameEN;
	}

	public void setNickNameEN(String nickNameEN) {
		this.nickNameEN = nickNameEN;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPlaceBirth() {
		return placeBirth;
	}

	public void setPlaceBirth(String placeBirth) {
		this.placeBirth = placeBirth;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getApplicantStatus() {
		return ApplicantStatus;
	}

	public void setApplicantStatus(String applicantStatus) {
		ApplicantStatus = applicantStatus;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getApplyDateStr() {
		return applyDateStr;
	}

	public void setApplyDateStr(String applyDateStr) {
		this.applyDateStr = applyDateStr;
	}

	public String getEmergencyName() {
		return emergencyName;
	}

	public void setEmergencyName(String emergencyName) {
		this.emergencyName = emergencyName;
	}

	public String getEmergencyTel() {
		return emergencyTel;
	}

	public void setEmergencyTel(String emergencyTel) {
		this.emergencyTel = emergencyTel;
	}

	public String getEmergencyAddress() {
		return emergencyAddress;
	}

	public void setEmergencyAddress(String emergencyAddress) {
		this.emergencyAddress = emergencyAddress;
	}

	public String getNoticeNewspaper() {
		return noticeNewspaper;
	}

	public void setNoticeNewspaper(String noticeNewspaper) {
		this.noticeNewspaper = noticeNewspaper;
	}

	public String getNoticeMagazine() {
		return noticeMagazine;
	}

	public void setNoticeMagazine(String noticeMagazine) {
		this.noticeMagazine = noticeMagazine;
	}

	public String getNoticeFriend() {
		return noticeFriend;
	}

	public void setNoticeFriend(String noticeFriend) {
		this.noticeFriend = noticeFriend;
	}

	public String getNoticeWebSite() {
		return noticeWebSite;
	}

	public void setNoticeWebSite(String noticeWebSite) {
		this.noticeWebSite = noticeWebSite;
	}

	public String getNoticeOther() {
		return noticeOther;
	}

	public void setNoticeOther(String noticeOther) {
		this.noticeOther = noticeOther;
	}

	public String getTrackingStatus() {
		return trackingStatus;
	}

	public void setTrackingStatus(String trackingStatus) {
		this.trackingStatus = trackingStatus;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getExpectedSalary() {
		return expectedSalary;
	}

	public void setExpectedSalary(String expectedSalary) {
		this.expectedSalary = expectedSalary;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getCardIssuedOffice() {
		return cardIssuedOffice;
	}

	public void setCardIssuedOffice(String cardIssuedOffice) {
		this.cardIssuedOffice = cardIssuedOffice;
	}

	public Date getCardExpiryDate() {
		return cardExpiryDate;
	}

	public void setCardExpiryDate(Date cardExpiryDate) {
		this.cardExpiryDate = cardExpiryDate;
	}

	public String getMilitaryFromYear() {
		return militaryFromYear;
	}

	public void setMilitaryFromYear(String militaryFromYear) {
		this.militaryFromYear = militaryFromYear;
	}

	public String getMilitarytoYear() {
		return militarytoYear;
	}

	public void setMilitarytoYear(String militarytoYear) {
		this.militarytoYear = militarytoYear;
	}

	public String getMilitaryPlace() {
		return militaryPlace;
	}

	public void setMilitaryPlace(String militaryPlace) {
		this.militaryPlace = militaryPlace;
	}

	public String getMilitaryServiceNo() {
		return militaryServiceNo;
	}

	public void setMilitaryServiceNo(String militaryServiceNo) {
		this.militaryServiceNo = militaryServiceNo;
	}

	public String getMilitaryReason() {
		return militaryReason;
	}

	public void setMilitaryReason(String militaryReason) {
		this.militaryReason = militaryReason;
	}

	public String getMilitaryStatus() {
		return militaryStatus;
	}

	public void setMilitaryStatus(String militaryStatus) {
		this.militaryStatus = militaryStatus;
	}

	public String getMarritalStatusName() {
		return marritalStatusName;
	}

	public void setMarritalStatusName(String marritalStatusName) {
		this.marritalStatusName = marritalStatusName;
	}

	public Integer getNumberOfChildren() {
		return numberOfChildren;
	}

	public void setNumberOfChildren(Integer numberOfChildren) {
		this.numberOfChildren = numberOfChildren;
	}

	public String getSpouseName() {
		return spouseName;
	}

	public void setSpouseName(String spouseName) {
		this.spouseName = spouseName;
	}

	public String getMarriageCertificateNo() {
		return marriageCertificateNo;
	}

	public void setMarriageCertificateNo(String marriageCertificateNo) {
		this.marriageCertificateNo = marriageCertificateNo;
	}

	public String getIssueOficeMarriage() {
		return issueOficeMarriage;
	}

	public void setIssueOficeMarriage(String issueOficeMarriage) {
		this.issueOficeMarriage = issueOficeMarriage;
	}

	public String getOccupationMarriage() {
		return occupationMarriage;
	}

	public void setOccupationMarriage(String occupationMarriage) {
		this.occupationMarriage = occupationMarriage;
	}

	public String getTechScore() {
		return techScore;
	}

	public void setTechScore(String techScore) {
		this.techScore = techScore;
	}

	public String getAttitude() {
		return attitude;
	}

	public void setAttitude(String attitude) {
		this.attitude = attitude;
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

	public String getPosition1Str() {
		return position1Str;
	}

	public void setPosition1Str(String position1Str) {
		this.position1Str = position1Str;
	}

	public String getPosition2Str() {
		return position2Str;
	}

	public void setPosition2Str(String position2Str) {
		this.position2Str = position2Str;
	}

	public String getPosition3Str() {
		return position3Str;
	}

	public void setPosition3Str(String position3Str) {
		this.position3Str = position3Str;
	}

/*	@Column(name = "HOUSE_NO")
	private String houseNo;

	@Column(name = "ROAD")
	private String road;

	@Column(name = "DISTRICT")
	private String district;

	@Column(name = "SUB_DISTRICT")
	private String subDistrict;

	@Column(name = "ZIPCODE")
	private int zipcode;

	@Column(name = "PROVINCE")
	private String province;

	@Column(name = "ADDRESS_TYPE")
	private String addressType;

	@Column(name = "ADVERTISE_NAME")
	private String advertiseName;

	@Column(name = "ATTACH_NAME")
	private String attachName;
	
	@Column(name = "TYPE")
	private String type;
	
	@Column(name = "PATH")
	private String path;
	
	@Column(name = "ATTACH_TYPE_FILE")
	private String attachTypeFile;
	
	@Column(name="DEPARTMENT_NAME")
	private String departmentName;
	
	@Column(name="DEPARTMENT_CODE")
	private String departmentCode;
	
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
	
	@Column(name = "POSITION") 
	private String position;

	@Column(name = "FROM_DATE")
	private Date fromDate;

	@Column(name = "TO_DATE")
	private Date toDate;

	@Column(name = "EMPLOYER_NAME")
	private String employerName;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "TYPE_OF_BUSSINESS")
	private String typeOfBusiness;

	@Column(name = "POSITION_OF_EMPLOYER")
	private String positionOfEmployer;

	@Column(name = "REASON")
	private String reason;

	@Column(name = "SUPERVISOR")
	private String supervisor;

	@Column(name = "SALARY")
	private long salary;

	@Column(name = "DESCRIPTION")
	private String description;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "RELATION")
	private String relation;
	
	@Column(name = "OCCUPATION")
	private String occupation;
	
	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "LANGUAGES_NAME")
	private String languagesName;
	
	@Column(name = "SPEAKING")
	private String speaking;
	
	@Column(name = "READING")
	private String reading;
	
	@Column(name = "UNDERSTANDING")
	private String understanding;
	
	@Column(name = "WRITING")
	private String writing;
	
	@Index(name = "positionNameIndex")
	@Column(name = "POSITION_NAME")
	private String positionName;

	@Column(name = "POSITON_CODE")
	private String positionCode;
	
	@Column(name = "FULLNAME")
	private String fullName;
	@Column(name = "TEL")
	private String tel;
	@Column(name = "OCCUPATION")
	private String occupation;
	
	@Column(name = "SKILL_DETAIL")
	private String skillDetail;*/
	

	
	

}
