package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.EducationDTO;
import com.aug.db.entities.Education;

public interface EducationService {

	public void create(Education education);

	public Education findById(Integer id);

	public void update(Education education);

	public void delete(Education education);
	
	public void deleteById(Integer id);

	public List<Education> findAll();
	
	public List<EducationDTO> findEducationById(Integer id);

	public EducationDTO findEducatione(Integer id);

}
