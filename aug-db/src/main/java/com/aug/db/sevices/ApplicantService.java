package com.aug.db.sevices;

import java.util.List;

import com.aug.db.entities.Applicant;

public interface ApplicantService {
	
	public void create(Applicant applicant);
	
	public Applicant findById(Integer id);
	
	public void update(Applicant applicant);
	
	public void delete(Integer id);
	
	public List<Applicant> findAll();

}
