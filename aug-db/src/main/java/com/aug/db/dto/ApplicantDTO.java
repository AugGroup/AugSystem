package com.aug.db.dto;

import java.util.Date;
import java.util.List;

import com.aug.db.entities.Address;
import com.aug.db.entities.AttachFile;
import com.aug.db.entities.AugEmployee;
import com.aug.db.entities.Education;
import com.aug.db.entities.Experience;
import com.aug.db.entities.Family;
import com.aug.db.entities.Languages;
import com.aug.db.entities.Position;
import com.aug.db.entities.Reference;
import com.aug.db.entities.Skill;

public class ApplicantDTO {

	private Integer id;
	private String code;
	private String firstNameTH;
	private String firstNameEN;
	private String lastNameTH;
	private String lastNameEN;
	private String nickNameTH;
	private String nickNameEN;
	private Date birthDate;
	private Integer age;
	private Integer height;
	private Integer weight;
	private String religion;
	private String nationality;
	private String tel;
	private String eMail;
	private String applicantStatus;
	private Date applyDate;
	private String emergencyName;
	private String emergencyTel;
	private String emergencyAddress;
	private String noticeNewspaper;
	private String noticeMagazine;
	private String noticeFriend;
	private String noticeWebSite;
	private String noticeOther;
	private String position1;
	private String position2;
	private String position3;
	private String trackingStatus;
	private String certificate;
	private String expactedSalary;
	private String cardId;
	private String cardIssuedOffice;
	private Date cardExpiryDate;
	private String militaryFromYear;
	private String militarytoYear;
	private String militaryPlace;
	private String militaryServiceNo;
	private String militaryReason;
	private String militaryStatus;
	private String marritalStatusName;
	private Integer numberOfChildren;
	private String spouseName;
	private String marriageCertificateNo;
	private String issueOficeMarriage;
	private String occupationMarriage;
	private List<Reference> references;
	private List<Position> positions;
	private List<Family> families;
	private List<AttachFile> attachFiles;
	private List<AugEmployee> augEmployees;
	private List<Languages> languages;
	private List<Address> address;
	private List<Education> educations;
	private List<Skill> skills;
	private List<Experience> experiences;
	
	
}
