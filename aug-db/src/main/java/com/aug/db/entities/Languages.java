package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "LANGUAGES")
public class Languages {
	@Id
	@GeneratedValue
	@Column(name = "LANGUAGES_ID")
	private Integer id;
	@Column(name = "LANGUAGES_NAME")
	private String languagesName;
	@Column(name = "SPEAKING")
	private String speaking;
	@Column(name = "READING")
	private String reading;
	@Column(name = "UNDERSTANDING")
	private String understanding;
	@Column(name = "WRITING")
	private String writing;

	@ManyToOne
	@JoinColumn(name = "APPLICANT_ID")
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

	public String getLanguagesName() {
		return languagesName;
	}

	public void setLanguagesName(String languagesName) {
		this.languagesName = languagesName;
	}

	public String getSpeaking() {
		return speaking;
	}

	public void setSpeaking(String speaking) {
		this.speaking = speaking;
	}

	public String getReading() {
		return reading;
	}

	public void setReading(String reading) {
		this.reading = reading;
	}

	public String getUnderstanding() {
		return understanding;
	}

	public void setUnderstanding(String understanding) {
		this.understanding = understanding;
	}

	public String getWriting() {
		return writing;
	}

	public void setWriting(String writing) {
		this.writing = writing;
	}
}
