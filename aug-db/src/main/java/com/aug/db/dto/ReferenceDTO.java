package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_REFERENCE", query = "SELECT r.ID, r.COMPLETE_ADDRESS, r.FULLNAME, r.OCCUPATION, r.TEL, r.APPLICANT_ID"
			+ " FROM REFERENCE r LEFT JOIN APPLICANT a on r.APPLICANT_ID = a.APPLICANT_ID WHERE r.APPLICANT_ID = :ID", resultClass = ReferenceDTO.class),
			
	@NamedNativeQuery(name = "SEARCH_REFERENCE_ID", query = "SELECT r.ID, r.COMPLETE_ADDRESS, r.FULLNAME, r.OCCUPATION, r.TEL, r.APPLICANT_ID"
			+ " FROM REFERENCE r WHERE r.APPLICANT_ID = :ID", resultClass = ReferenceDTO.class)
	})
public class ReferenceDTO {
	
	@Id
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "COMPLETE_ADDRESS")
	private String completeAddress;
	
	@Column(name = "FULLNAME")
	private String fullName;
	
	@Column(name = "OCCUPATION")
	private String occupation;
	
	@Column(name = "TEL")
	private String tel;
	
	@Column(name = "APPLICANT_ID")
	private Integer applicantId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompleteAddress() {
		return completeAddress;
	}

	public void setCompleteAddress(String completeAddress) {
		this.completeAddress = completeAddress;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}
	
	
	
}
