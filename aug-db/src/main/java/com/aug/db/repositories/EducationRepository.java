package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.EducationDTO;
import com.aug.db.entities.Education;

public interface EducationRepository extends GenericRepository<Education, Serializable> {
	
	public List<EducationDTO> findEducationById(Integer id);
	
	public EducationDTO findByEducationId(Integer id);

}
