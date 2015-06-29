package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Applicant;

public interface ApplicantRepository extends GenericRepository<Applicant, Serializable> {

	public List<ApplicantDTO> findByPosition(String position);
	
	public List<ApplicantDTO> findAllApplicant();
	
	public ApplicantDTO findApplicantById(Integer id);
	
	public ApplicationDTO findApplicationById(Integer id);

	/*-------------------- report --------------------*/
	public List<ReportApplicantDTO> reportApplicant();
	
	public List<ReportApplicantDTO> findReportByCriteria(String position, String degree, String major, String schoolName, String gpa);

	public void update(ApplicationDTO applicationDTO);
}
