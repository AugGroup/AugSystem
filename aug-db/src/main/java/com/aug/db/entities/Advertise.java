package com.aug.db.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name = "ADVERTISE")
public class Advertise {
@Id
@GeneratedValue
@Column(name="ID")
private Integer id;
@Column(name="ADVERTISE_NAME")
private String advertiseName;

@ManyToMany(mappedBy = "advertise")
private List<Applicant> applicant;

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public String getAdvertiseName() {
	return advertiseName;
}

public void setAdvertiseName(String advertiseName) {
	this.advertiseName = advertiseName;
}

public List<Applicant> getApplicant() {
	return applicant;
}

public void setApplicant(List<Applicant> applicant) {
	this.applicant = applicant;
} 
	
	
	
	
}
