package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ATTACHFILE")
public class AttachFile {
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "APPLICANT_ID")
	private Applicant applicant;
	@Column(name = "ATTACH_NAME")
	private String attachName;
	@Column(name = "TYPE")
	private String type;
	@Column(name = "PATH")
	private String path;
	@Column(name = "ATTACH_TYPE_FILE")
	private String attachTypeFile;
	
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
	
	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getAttachTypeFile() {
		return attachTypeFile;
	}

	public void setAttachTypeFile(String attachTypeFile) {
		this.attachTypeFile = attachTypeFile;
	}

}
