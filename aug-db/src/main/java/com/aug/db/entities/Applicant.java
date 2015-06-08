package com.aug.db.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Index;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "APPLICANT" )
public class Applicant {
	
	@Id
	@GeneratedValue
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
	private String applicantStatus;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd/MM/yyyy", locale="en", timezone="GMT")
	@Column(name = "APPLY_DATE")
	private Date applyDate;
	
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
	
	@ManyToOne
	@Index(name = "position1Index")
	@JoinColumn(name = "POSITION1_ID", referencedColumnName="id")
	private Position position1;
	
	@ManyToOne
	@Index(name = "position2Index")
	@JoinColumn(name = "POSITION2_ID", referencedColumnName="id")
	private Position position2;
	
	@ManyToOne
	@Index(name = "position3Index")
	@JoinColumn(name = "POSITION3_ID", referencedColumnName="id")
	private Position position3;
	
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
	
	@Column(name = "SCORE")
	private String score;
	
	@Column(name = "TECH_SCORE")
	private String techScore;
	
	@Column(name = "ATTITUDE_HOME")
	private String attitudeHome;
	
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

	public String getAttitudeOffice() {
		return attitudeOffice;
	}

	public void setAttitudeOffice(String attitudeOffice) {
		this.attitudeOffice = attitudeOffice;
	}

	@Column(name = "ATTITUDE_OFFICE")
	private String attitudeOffice;

	@OneToMany(mappedBy = "applicant")
	private List<Reference> references;
	
	@OneToMany(mappedBy = "applicant")
	private List<Family> families;
	
	@OneToMany(mappedBy = "applicant")
	private List<AttachFile> attachFiles;
	
	@OneToMany(mappedBy = "applicant")
	private List<AugEmployee> augEmployees;
	
	@OneToMany(mappedBy = "applicant")
	private List<Languages> languages;
	
	@OneToMany(mappedBy = "applicant")
	private List<Address> address;
	
	@OneToMany(mappedBy = "applicant")
	private List<Education> educations;
	
	@OneToMany(mappedBy = "applicant")
	private List<Skill> skills;
	
	@OneToMany(mappedBy = "applicant")
	private List<Experience> experiences;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "APPLICANT_ADVERTISE", joinColumns = { @JoinColumn(name = "APPLICANT_ID") }, inverseJoinColumns = { @JoinColumn(name = "ADVERTISE_ID") })
	private List<Advertise> advertise;

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

	public List<AttachFile> getAttachFiles() {
		return attachFiles;
	}

	public void setAttachFiles(List<AttachFile> attachFiles) {
		this.attachFiles = attachFiles;
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
	
	public String getTechScore() {
		return techScore;
	}

	public void setTechScore(String techScore) {
		this.techScore = techScore;
	}
	
	
	
	public String getPlaceBirth() {
		return placeBirth;
	}

	public void setPlaceBirth(String placeBirth) {
		this.placeBirth = placeBirth;
	}

	public List<Advertise> getAdvertise() {
		return advertise;
	}

	public void setAdvertise(List<Advertise> advertise) {
		this.advertise = advertise;
	}

}
