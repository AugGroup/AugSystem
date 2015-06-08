package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.entities.Applicant;

public interface ApplicantRepository extends GenericRepository<Applicant, Serializable> {

	public List<ApplicantDTO> findByPosition(String position);
	
	public List<ApplicantDTO> findAllApplicant();
}
