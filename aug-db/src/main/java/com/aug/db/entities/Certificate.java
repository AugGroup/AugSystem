package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CERTIFICATE")
public class Certificate {

	@Id
	@GeneratedValue
	@Column(name = "CERTIFICATE_ID")
	private Integer id;
	
	@Column(name = "CERTIFICATE_NAME")
	private String certificateName;
	
	@ManyToOne
	@JoinColumn(name = "APPLICANT_ID")
	private Applicant applicant;

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

	public Applicant getApplicant() {
		return applicant;
	}

	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}
	
	
	
}
