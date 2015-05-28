package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SKILL")
public class Skill {

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;

	@Column(name = "SKILL_DETAIL")
	private String skillDetail;
	
	@ManyToOne()
	@JoinColumn(name="id")
	private Applicant applicant;



	public Applicant getApplicant() {
		return applicant;
	}

	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSkillDetail() {
		return skillDetail;
	}

	public void setSkillDetail(String skillDetail) {
		this.skillDetail = skillDetail;
	}

}
