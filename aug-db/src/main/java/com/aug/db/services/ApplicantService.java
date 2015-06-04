package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.entities.Applicant;

public interface ApplicantService {

	public void create(Applicant applicant);

	public Applicant findById(Integer id);

	public List<Applicant> findAll();
	
	public List<ApplicantDTO> findByPosition(String position);

	public void update(Applicant applicant);

	public void delete(Applicant applicant);

	public void deleteById(Integer id);

}
