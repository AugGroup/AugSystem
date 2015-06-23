package com.aug.db.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.aug.db.entities.Address;
import com.aug.db.entities.AugEmployee;
import com.aug.db.entities.Certificate;
import com.aug.db.entities.Education;
import com.aug.db.entities.Experience;
import com.aug.db.entities.Family;
import com.aug.db.entities.Languages;
import com.aug.db.entities.Position;
import com.aug.db.entities.Reference;
import com.aug.db.entities.Skill;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@NamedNativeQueries({ 
//	@NamedNativeQuery(name = "SEARCH_ADDRESS", query = "SELECT null as APPLICANT_CODE, null as FIRSTNAME_TH, null as FIRSTNAME_EN, null as LASTNAME_TH, null as LASTNAME_EN, null as NICKNAME_TH, null as NICKNAME_EN,"
//		+ "null as BIRTHDATE, null as PLACE_BIRTH, null as AGE, null as HEIGHT, null as WEIGHT, null as RELIGION, null as NATIONALITY, null as TEL, null as EMAIL,"
//		+ "null as APPLICANT_STATUS, null as APPLY_DATE, null as EMERGENCY_NAME, null as EMERGENCY_TEL, null as EMERGENCY_ADDRESS, null as NOTICE_NEWSPAPER, null as NOTICE_MAGAZINE, null as NOTICE_FRIEND, null as NOTICE_WEBSITE, null as NOTICE_OTHER, null as TRACKING_STATUS,"
//		+ "null as CERTIFICATE, null as EXPECTED_SALARY, null as CARD_ID, null as CARD_ISSUED_OFFICE, null as CARD_EXPIRY_DATE, null as MILITARY_FROM_YEAR, null as MILITARY_TO_YEAR, null as MILITARY_PLACE, null as MILITARY_SERVICE_NO, null as MILITARY_REASON, null as MILITARY_STATUS, null as MARRITAL_STATUS_NAME,"
//		+ "null as NUMBER_OF_CHILDREN, null as SPOUSE_NAME, null as MARRIAGE_CERTIFICATE_NO, null as ISSUE_OFFICE_MARRIAGE, null as OCCUPATION_MARRIAGE, null as TECH_SCORE, null as POSITION1_ID, null as POSITION2_ID, null as POSITION3_ID, null as NOW_EMPLOYED, null as EMPLOYED_NAME, null as EMPLOYED_POSITION,"
//		+ "null as EMPLOYED_RELATION, null as BRANCH_SERVICE, null as PREVIOUS_EMPLOYERS, null as PREVIOUS_EMPLOYERS_REASON, null as DATE_TO_BE_DRAFTED, null as MARRIAGE_ADDRESS, null as POSITION_NAME, null as ATTITUDE"
//		+ "ad.ADDRESS_TYPE, ad.DISTRICT, ad.HOUSE_NO, ad.PROVINCE, "
//		+ "ad.ROAD, ad.SUB_DISTRICT, ad.ZIPCODE, ad.APPLICANT_ID"
//		+ " FROM ADDRESS ad", resultClass = AddressDTO.class),
		
//	@NamedNativeQuery(name = "SEARCH_EMERGENCY", query = "SELECT null as APPLICANT_CODE, null as FIRSTNAME_TH, null as FIRSTNAME_EN, null as LASTNAME_TH, null as LASTNAME_EN, null as NICKNAME_TH, null as NICKNAME_EN,"
//		+ "null as BIRTHDATE, null as PLACE_BIRTH, null as AGE, null as HEIGHT, null as WEIGHT, null as RELIGION, null as NATIONALITY, null as TEL, null as EMAIL,"
//		+ "null as APPLICANT_STATUS, null as APPLY_DATE, null as EMERGENCY_NAME, null as EMERGENCY_TEL, null as EMERGENCY_ADDRESS, null as NOTICE_NEWSPAPER, null as NOTICE_MAGAZINE, null as NOTICE_FRIEND, null as NOTICE_WEBSITE, null as NOTICE_OTHER, null as TRACKING_STATUS,"
//		+ "null as CERTIFICATE, null as EXPECTED_SALARY, null as CARD_ID, null as CARD_ISSUED_OFFICE, null as CARD_EXPIRY_DATE, null as MILITARY_FROM_YEAR, null as MILITARY_TO_YEAR, null as MILITARY_PLACE, null as MILITARY_SERVICE_NO, null as MILITARY_REASON, null as MILITARY_STATUS, null as MARRITAL_STATUS_NAME,"
//		+ "null as NUMBER_OF_CHILDREN, null as SPOUSE_NAME, null as MARRIAGE_CERTIFICATE_NO, null as ISSUE_OFFICE_MARRIAGE, null as OCCUPATION_MARRIAGE, null as TECH_SCORE, null as POSITION1_ID, null as POSITION2_ID, null as POSITION3_ID, null as NOW_EMPLOYED, null as EMPLOYED_NAME, null as EMPLOYED_POSITION,"
//		+ "null as EMPLOYED_RELATION, null as BRANCH_SERVICE, null as PREVIOUS_EMPLOYERS, null as PREVIOUS_EMPLOYERS_REASON, null as DATE_TO_BE_DRAFTED, null as MARRIAGE_ADDRESS, null as POSITION_NAME"
//		+ "a.EMERGENCY_NAME,a.EMERGENCY_TEL,a.EMERGENCY_ADDRESS"
//		+ "FROM APPLICANT a WHERE a.APPLICANT_ID = :ID", resultClass = ApplicationDTO.class),
		
//	@NamedNativeQuery(name = "SEARCH_ADDRESS", query = "SELECT null as APPLICANT_CODE, null as FIRSTNAME_TH, null as FIRSTNAME_EN, null as LASTNAME_TH, null as LASTNAME_EN, null as NICKNAME_TH, null as NICKNAME_EN,"
//		+ "null as BIRTHDATE, null as PLACE_BIRTH, null as AGE, null as HEIGHT, null as WEIGHT, null as RELIGION, null as NATIONALITY, null as TEL, null as EMAIL,"
//		+ "null as APPLICANT_STATUS, null as APPLY_DATE, null as EMERGENCY_NAME, null as EMERGENCY_TEL, null as EMERGENCY_ADDRESS, null as NOTICE_NEWSPAPER, null as NOTICE_MAGAZINE, null as NOTICE_FRIEND, null as NOTICE_WEBSITE, null as NOTICE_OTHER, null as TRACKING_STATUS,"
//		+ "null as CERTIFICATE, null as EXPECTED_SALARY, null as CARD_ID, null as CARD_ISSUED_OFFICE, null as CARD_EXPIRY_DATE, null as MILITARY_FROM_YEAR, null as MILITARY_TO_YEAR, null as MILITARY_PLACE, null as MILITARY_SERVICE_NO, null as MILITARY_REASON, null as MILITARY_STATUS, null as MARRITAL_STATUS_NAME,"
//		+ "null as NUMBER_OF_CHILDREN, null as SPOUSE_NAME, null as MARRIAGE_CERTIFICATE_NO, null as ISSUE_OFFICE_MARRIAGE, null as OCCUPATION_MARRIAGE, null as TECH_SCORE, null as POSITION1_ID, null as POSITION2_ID, null as POSITION3_ID, null as NOW_EMPLOYED, null as EMPLOYED_NAME, null as EMPLOYED_POSITION,"
//		+ "null as EMPLOYED_RELATION, null as BRANCH_SERVICE, null as PREVIOUS_EMPLOYERS, null as PREVIOUS_EMPLOYERS_REASON, null as DATE_TO_BE_DRAFTED, null as MARRIAGE_ADDRESS, null as POSITION_NAME,"
//		+ "ad.ID, ad.ADDRESS_TYPE, ad.DISTRICT, ad.HOUSE_NO, ad.PROVINCE, "
//		+ "ad.ROAD, ad.SUB_DISTRICT, ad.ZIPCODE, ad.APPLICANT_ID"
//		+ " FROM ADDRESS ad LEFT JOIN APPLICANT a on ad.APPLICANT_ID = a.APPLICANT_ID WHERE ad.APPLICANT_ID = :ID", resultClass = ApplicationDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_BY_ID_APPLICATION", query = "SELECT null as ATTITUDE, a.APPLICANT_ID, a.APPLICANT_CODE, a.FIRSTNAME_TH, a.FIRSTNAME_EN, a.LASTNAME_TH, a.LASTNAME_EN, a.NICKNAME_TH, a.NICKNAME_EN,"
		+ "a.BIRTHDATE, a.PLACE_BIRTH, a.AGE, a.HEIGHT, a.WEIGHT, a.RELIGION, a.NATIONALITY, a.TEL, a.EMAIL,"
		+ "a.APPLICANT_STATUS, a.APPLY_DATE, a.EMERGENCY_NAME, a.EMERGENCY_TEL, a.EMERGENCY_ADDRESS, a.NOTICE_NEWSPAPER, a.NOTICE_MAGAZINE, a.NOTICE_FRIEND, a.NOTICE_WEBSITE, a.NOTICE_OTHER, a.TRACKING_STATUS,"
		+ "a.CERTIFICATE, a.EXPECTED_SALARY, a.CARD_ID, a.CARD_ISSUED_OFFICE, a.CARD_EXPIRY_DATE, a.MILITARY_FROM_YEAR, a.MILITARY_TO_YEAR, a.MILITARY_PLACE, a.MILITARY_SERVICE_NO, a.MILITARY_REASON, a.MILITARY_STATUS, a.MARRITAL_STATUS_NAME,"
		+ "a.NUMBER_OF_CHILDREN, a.SPOUSE_NAME, a.MARRIAGE_CERTIFICATE_NO, a.ISSUE_OFFICE_MARRIAGE, a.OCCUPATION_MARRIAGE, null as TECH_SCORE, a.POSITION1_ID, a.POSITION2_ID, a.POSITION3_ID, a.NOW_EMPLOYED, a.EMPLOYED_NAME, a.EMPLOYED_POSITION,"
		+ "a.EMPLOYED_RELATION, a.BRANCH_SERVICE, a.PREVIOUS_EMPLOYERS, a.PREVIOUS_EMPLOYERS_REASON, a.DATE_TO_BE_DRAFTED, a.MARRIAGE_ADDRESS, null as POSITION_NAME, a.EMERGENCY_NAME,a.EMERGENCY_TEL,a.EMERGENCY_ADDRESS"
		+ " FROM APPLICANT a WHERE a.APPLICANT_ID = :ID", resultClass = ApplicationDTO.class)
	})
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

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
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
	private String applicantStatus;

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

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
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

	@Transient
	private String position1Str;

	@Transient
	private String position2Str;

	@Transient
	private String position3Str;

	@Column(name = "NOW_EMPLOYED")
	private String nowEmployed;

	@Column(name = "EMPLOYED_NAME")
	private String employedName;

	@Column(name = "EMPLOYED_POSITION")
	private String employedPosition;

	@Column(name = "EMPLOYED_RELATION")
	private String employedRelation;

	@Column(name = "BRANCH_SERVICE")
	private String branchService;

	@Column(name = "PREVIOUS_EMPLOYERS")
	private String previousEmployers;

	@Column(name = "PREVIOUS_EMPLOYERS_REASON")
	private String previousEmployersReason;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "en", timezone = "GMT")
	@Column(name = "DATE_TO_BE_DRAFTED")
	private Date dateToBeDrafted;

	@Column(name = "MARRIAGE_ADDRESS")
	private String marriageAddress;
	
	@Column(name = "RESUME")
	private String resume;
	
	@Column(name = "TRANSCRIPT")
	private String transcript;
	
	@Column(name = "IMAGE")
	private String image;
	@Transient
	private List<MultipartFile> multipartFile ;

	@Transient
	private List<Reference> references;

	@Transient
	private List<Family> families;

	@Transient
	private List<AugEmployee> augEmployees;

	@Transient
	private List<Languages> languages;

	@Transient
	private List<Address> address;

	@Transient
	private List<Education> educations;

	@Transient
	private List<Skill> skills;

	@Transient
	private List<Experience> experiences;

//	@ManyToOne
//	@JoinColumn(name = "POSITION1_ID", referencedColumnName = "id")
//	private Position position1;
//
//	@ManyToOne
//	@JoinColumn(name = "POSITION2_ID", referencedColumnName = "id")
//	private Position position2;
//
//	@ManyToOne
//	@JoinColumn(name = "POSITION3_ID", referencedColumnName = "id")

	@Transient
	private Position position1;

	@Transient
	private Position position2;

	@Transient
	private Position position3;
	
	@Transient
	private List<Certificate> certificates;
	
	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Certificate> getCertificates() {
		return certificates;
	}

	public void setCertificates(List<Certificate> certificates) {
		this.certificates = certificates;
	}

	public List<Reference> getReferences() {
		return references;
	}

	public void setReferences(List<Reference> references) {
		this.references = references;
	}

	public List<Family> getFamilies() {
		return families;
	}

	public void setFamilies(List<Family> families) {
		this.families = families;
	}

	public List<AugEmployee> getAugEmployees() {
		return augEmployees;
	}

	public void setAugEmployees(List<AugEmployee> augEmployees) {
		this.augEmployees = augEmployees;
	}

	public List<Languages> getLanguages() {
		return languages;
	}

	public void setLanguages(List<Languages> languages) {
		this.languages = languages;
	}

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public List<Education> getEducations() {
		return educations;
	}

	public void setEducations(List<Education> educations) {
		this.educations = educations;
	}

	public List<Skill> getSkills() {
		return skills;
	}

	public void setSkills(List<Skill> skills) {
		this.skills = skills;
	}

	public List<Experience> getExperiences() {
		return experiences;
	}

	public void setExperiences(List<Experience> experiences) {
		this.experiences = experiences;
	}

	public String getNowEmployed() {
		return nowEmployed;
	}

	public void setNowEmployed(String nowEmployed) {
		this.nowEmployed = nowEmployed;
	}

	public String getEmployedName() {
		return employedName;
	}

	public void setEmployedName(String employedName) {
		this.employedName = employedName;
	}

	public String getEmployedPosition() {
		return employedPosition;
	}

	public void setEmployedPosition(String employedPosition) {
		this.employedPosition = employedPosition;
	}

	public String getEmployedRelation() {
		return employedRelation;
	}

	public void setEmployedRelation(String employedRelation) {
		this.employedRelation = employedRelation;
	}

	public String getBranchService() {
		return branchService;
	}

	public void setBranchService(String branchService) {
		this.branchService = branchService;
	}

	public String getPreviousEmployers() {
		return previousEmployers;
	}

	public void setPreviousEmployers(String previousEmployers) {
		this.previousEmployers = previousEmployers;
	}

	public String getPreviousEmployersReason() {
		return previousEmployersReason;
	}

	public void setPreviousEmployersReason(String previousEmployersReason) {
		this.previousEmployersReason = previousEmployersReason;
	}

	public Date getDateToBeDrafted() {
		return dateToBeDrafted;
	}

	public void setDateToBeDrafted(Date dateToBeDrafted) {
		this.dateToBeDrafted = dateToBeDrafted;
	}

	public String getMarriageAddress() {
		return marriageAddress;
	}

	public void setMarriageAddress(String marriageAddress) {
		this.marriageAddress = marriageAddress;
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

/*
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
*/
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

	public Position getPosition1() {
		return position1;
	}

	public void setPosition1(Position position1) {
		this.position1 = position1;
	}

	public Position getPosition2() {
		return position2;
	}

	public void setPosition2(Position position2) {
		this.position2 = position2;
	}

	public Position getPosition3() {
		return position3;
	}

	public void setPosition3(Position position3) {
		this.position3 = position3;
	}

	public List<MultipartFile> getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(List<MultipartFile> multipartFile) {
		this.multipartFile = multipartFile;
	}
}
