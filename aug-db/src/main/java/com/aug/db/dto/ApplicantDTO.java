package com.aug.db.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;

@NamedNativeQueries({ 
	    // SEARCH_BY_POSITION
		@NamedNativeQuery(name = "SEARCH_APPLICANT", query = " SELECT null as FIRSTNAME_TH, null as LASTNAME_TH, null as NICKNAME_TH, null as NICKNAME_EN, "
				+ "null as BIRTHDATE, null as AGE, null as HEIGHT, null as WEIGHT, null as SEX, null as RELIGION, null as NATIONALITY, null as APPLICANT_STATUS, null as EMERGENCY_NAME, null as EMERGENCY_TEL,"
				+ "null as EMERGENCY_ADDRESS, null as NOTICE_NEWSPAPER, null as NOTICE_MAGAZINE, null as NOTICE_FRIEND, null as NOTICE_WEBSITE, null as NOTICE_OTHER, "
				+ "null as EXPECTED_SALARY, null as CARD_ID, null as CARD_ISSUED_OFFICE, null as CARD_EXPIRY_DATE, null as MILITARY_FROM_YEAR, null as MILITARY_TO_YEAR, null as MILITARY_PLACE,"
				+ "null as MILITARY_SERVICE_NO, null as MILITARY_REASON, null as MILITARY_STATUS, null as NUMBER_OF_CHILDREN, null as SPOUSE_NAME,"
				+ "null as MARRIAGE_CERTIFICATE_NO, null as ISSUE_OFFICE_MARRIAGE, null as OCCUPATION_MARRIAGE, null as SCORE, null as TECH_SCORE, null as ATTITUDE_HOME, null as ATTITUDE_OFFICE, "
				+ "a.APPLICANT_ID, a.APPLICANT_CODE, a.FIRSTNAME_EN, a.LASTNAME_EN, a.TEL, a.EMAIL, a.APPLY_DATE, a.POSITION1_ID, a.POSITION2_ID, a.POSITION3_ID, a.TRACKING_STATUS, p1.POSITION_NAME, p1.ID, p2.POSITION_NAME, p2.ID, p3.POSITION_NAME, p3.ID "
				+ "FROM APPLICANT a LEFT JOIN POSITION p1 ON a.POSITION1_ID = p1.ID "
				+ "LEFT JOIN POSITION p2 ON a.POSITION2_ID = p2.ID "
				+ "LEFT JOIN POSITION p3 ON a.POSITION3_ID = p3.ID "
				+ "WHERE p1.POSITION_NAME like :POSITION OR p2.POSITION_NAME like :POSITION OR p3.POSITION_NAME like :POSITION", resultClass = ApplicantDTO.class),

		@NamedNativeQuery(name = "SEARCH_ALL", query = "SELECT null as FIRSTNAME_TH, null as LASTNAME_TH, null as NICKNAME_TH, null as NICKNAME_EN, "
				+ "null as BIRTHDATE, null as AGE, null as HEIGHT, null as WEIGHT, null as SEX, null as RELIGION, null as NATIONALITY, null as APPLICANT_STATUS, null as EMERGENCY_NAME, null as EMERGENCY_TEL,"
				+ "null as EMERGENCY_ADDRESS, null as NOTICE_NEWSPAPER, null as NOTICE_MAGAZINE, null as NOTICE_FRIEND, null as NOTICE_WEBSITE, null as NOTICE_OTHER,"
				+ "null as EXPECTED_SALARY, null as CARD_ID, null as CARD_ISSUED_OFFICE, null as CARD_EXPIRY_DATE, null as MILITARY_FROM_YEAR, null as MILITARY_TO_YEAR, null as MILITARY_PLACE,"
				+ "null as MILITARY_SERVICE_NO, null as MILITARY_REASON, null as MILITARY_STATUS, null as NUMBER_OF_CHILDREN, null as SPOUSE_NAME,"
				+ "null as MARRIAGE_CERTIFICATE_NO, null as ISSUE_OFFICE_MARRIAGE, null as OCCUPATION_MARRIAGE, null as SCORE, null as TECH_SCORE, null as ATTITUDE_HOME, null as ATTITUDE_OFFICE,"
				+ " a.APPLICANT_ID, a.APPLICANT_CODE, a.FIRSTNAME_EN, a.LASTNAME_EN, a.TEL, a.EMAIL, a.APPLY_DATE, a.POSITION1_ID, a.POSITION2_ID, a.POSITION3_ID, a.TRACKING_STATUS, p.POSITION_NAME, p.ID "
				+ " FROM APPLICANT a JOIN POSITION p ON a.POSITION1_ID = p.ID "
				+ "ORDER BY a.APPLY_DATE DESC", resultClass = ApplicantDTO.class), // ORDER BY APPLICANT_ID ASC LIMIT 0,50

		@NamedNativeQuery(name = "SEARCH_BY_ID", query = "SELECT a.FIRSTNAME_TH, a.LASTNAME_TH, a.NICKNAME_TH, a.NICKNAME_EN, "
				+ "a.BIRTHDATE, a.AGE, a.HEIGHT, a.WEIGHT, a.SEX, a.RELIGION, a.NATIONALITY, a.APPLICANT_STATUS, a.EMERGENCY_NAME, a.EMERGENCY_TEL,"
				+ "a.EMERGENCY_ADDRESS, a.NOTICE_NEWSPAPER, a.NOTICE_MAGAZINE, a.NOTICE_FRIEND, a.NOTICE_WEBSITE, a.NOTICE_OTHER,"
				+ "a.EXPECTED_SALARY, a.CARD_ID, a.CARD_ISSUED_OFFICE, a.CARD_EXPIRY_DATE, a.MILITARY_FROM_YEAR, a.MILITARY_TO_YEAR, a.MILITARY_PLACE,"
				+ "a.MILITARY_SERVICE_NO, a.MILITARY_REASON, a.MILITARY_STATUS, a.NUMBER_OF_CHILDREN, a.SPOUSE_NAME,"
				+ "a.MARRIAGE_CERTIFICATE_NO, a.ISSUE_OFFICE_MARRIAGE, a.OCCUPATION_MARRIAGE, a.SCORE, a.TECH_SCORE, a.ATTITUDE_HOME, a.ATTITUDE_OFFICE,"
				+ " a.APPLICANT_ID, a.APPLICANT_CODE, a.FIRSTNAME_EN, a.LASTNAME_EN, a.TEL, a.EMAIL, a.APPLY_DATE, a.POSITION1_ID, a.POSITION2_ID, a.POSITION3_ID, a.TRACKING_STATUS, p.POSITION_NAME, p.ID "
				+ " FROM APPLICANT a LEFT JOIN POSITION p ON a.POSITION1_ID = p.ID WHERE a.APPLICANT_ID = :ID", resultClass = ApplicantDTO.class), })
@Entity
public class ApplicantDTO {

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

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "BIRTHDATE")
	private Date birthDate;

	@Column(name = "AGE")
	private Integer age;

	@Column(name = "HEIGHT")
	private Integer height;

	@Column(name = "WEIGHT")
	private Integer weight;

	@Column(name = "SEX")
	private String sex;

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

	@Column(name = "SCORE")
	private String score;

	@Column(name = "ATTITUDE_HOME")
	private String attitudeHome;

	@Column(name = "ATTITUDE_OFFICE")
	private String attitudeOffice;

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
	
	public String getAttitudeOffice() {
		return attitudeOffice;
	}

	public void setAttitudeOffice(String attitudeOffice) {
		this.attitudeOffice = attitudeOffice;
	}

	public Integer getPosition1() {
		return position1;
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

	public String getApplyDateStr() {
		return applyDateStr;
	}

	public void setApplyDateStr(String applyDateStr) {
		this.applyDateStr = applyDateStr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getExpectedSalary() {
		return expectedSalary;
	}

	public void setExpectedSalary(String expectedSalary) {
		this.expectedSalary = expectedSalary;
	}

	public String getTechScore() {
		return techScore;
	}

	public void setTechScore(String techScore) {
		this.techScore = techScore;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getAttitudeHome() {
		return attitudeHome;
	}

	public void setAttitudeHome(String attitudeHome) {
		this.attitudeHome = attitudeHome;
	}

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
		return firstNameEN + " " + lastNameEN;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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

}
