package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.entities.Applicant;

public interface ApplicantService {

	public void create(Applicant applicant);

	public Applicant findById(Integer id);

	public List<Applicant> findAll();
	
	public List<ApplicantDTO> findByPosition(String position);
	
	public ApplicantDTO findApplicantById(Integer id);
	
	public List<ApplicantDTO> findAllApplicant();

	public void update(Applicant applicant);

	public void delete(Applicant applicant);

	public void deleteById(Integer id);
	
	public ApplicationDTO saveEducation(ApplicationDTO applicationDTO);
	
	public ApplicationDTO saveInformations(ApplicationDTO applicationDTO);

	public ApplicationDTO saveAddress(ApplicationDTO applicationDTO);
	
	public ApplicationDTO saveApplications(ApplicationDTO applicationDTO);

	public ApplicationDTO saveExperiences(ApplicationDTO applicationDTO);
	
	public List<ReportApplicantDTO> reportApplicant();
}
