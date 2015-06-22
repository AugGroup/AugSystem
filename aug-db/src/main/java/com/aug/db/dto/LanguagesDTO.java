package com.aug.db.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

@Entity
@NamedNativeQueries({
	@NamedNativeQuery(name = "SEARCH_LANGUAGES", query = "SELECT l.ID, l.LANGUAGES_NAME, l.SPEAKING, l.READING, l.UNDERSTANDING,"	
			+ "l.WRITING"
			+ " FROM LANGUAGES l LEFT JOIN APPLICANT a on l.APPLICANT_ID = a.APPLICANT_ID WHERE l.APPLICANT_ID = :ID", resultClass = LanguagesDTO.class),
		
	@NamedNativeQuery(name = "SEARCH_LANGUAGES_ID", query = "SELECT l.ID, l.LANGUAGES_NAME, l.SPEAKING, l.READING, l.UNDERSTANDING,"
			+ "l.WRITING"
			+ " FROM LANGUAGES l WHERE l.APPLICANT_ID = :ID", resultClass = LanguagesDTO.class)
	})
public class LanguagesDTO {
	
	@Id
	@Column(name = "ID")
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
