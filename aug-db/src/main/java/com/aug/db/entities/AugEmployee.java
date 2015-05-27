package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "AUGEMPLOYEE")
public class AugEmployee {
	@Id
	@GeneratedValue
	@Column(name = "AUGEMPLOYEE_ID")
	private Integer id;
	@Column(name = "EMPLOYED_NAME")
	private String employedName;

	@ManyToOne
	@JoinColumn(name = "APPLICANT_ID")
	private Applicant applicant;
	public Applicant getApplicant() {
		return applicant;
	}

	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}

	public String getEmployedName() {
		return employedName;
	}

	public void setEmployedName(String employedName) {
		this.employedName = employedName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
