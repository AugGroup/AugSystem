package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_CERTIFICATE", query = "SELECT c.ID, c.CERTIFICATE_NAME, c.APPLICANT_ID"
		+ " FROM CERTIFICATE c LEFT JOIN APPLICANT a on c.APPLICANT_ID = a.APPLICANT_ID WHERE c.APPLICANT_ID = :ID", resultClass = CertificatedDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_CERTIFICATE_ID", query = "SELECT c.ID, c.CERTIFICATE_NAME, c.APPLICANT_ID"
		+ " FROM CERTIFICATE c WHERE c.ID = :ID", resultClass = CertificatedDTO.class)
	})
public class CertificatedDTO {
	
	@Id
	@Column(name = "CERTIFICATE_ID")
	private Integer id;
	
	@Column(name = "CERTIFICATE_NAME")
	private String certificateName;
	
	@Column(name = "APPLICANT_ID")
	private Integer applicantId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCertificateName() {
		return certificateName;
	}

	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}

	public Integer getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Integer applicantId) {
		this.applicantId = applicantId;
	}
	
	
}
