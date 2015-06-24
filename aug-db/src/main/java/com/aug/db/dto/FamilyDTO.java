package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_FAMILY", query = "SELECT f.ID, f.NAME, f.DISTRICT, f.RELATION, f.OCCUPATION,"
		+ "f.ADDRESS, f.POSITION_FAMILY, f.APPLICANT_ID"
		+ " FROM FAMILY f LEFT JOIN APPLICANT a on f.APPLICANT_ID = a.APPLICANT_ID WHERE f.APPLICANT_ID = :ID", resultClass = FamilyDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_FAMILY_ID", query = "SELECT f.ID, f.NAME, f.DISTRICT, f.RELATION, f.OCCUPATION,"
		+ "f.ADDRESS, f.POSITION_FAMILY, f.APPLICANT_ID"
		+ " FROM FAMILY f WHERE f.ID = :ID", resultClass = FamilyDTO.class)
	})
public class FamilyDTO {
	
	@Id
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "RELATION")
	private String relation;
	
	@Column(name = "OCCUPATION")
	private String occupation;
	
	@Column(name = "ADDRESS")
	private String address;
	
	@Column(name = "POSITION_FAMILY")
	private String positionFamily;

	@Column(name = "APPLICANT_ID")
	private Integer applicantId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPositionFamily() {
		return positionFamily;
	}

	public void setPositionFamily(String positionFamily) {
		this.positionFamily = positionFamily;
	}

	public Integer getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}
	
	

}
