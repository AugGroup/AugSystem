package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.ExperienceDTO;
import com.aug.db.entities.Experience;

public interface ExperienceRepository extends GenericRepository<Experience, Serializable> {
	
	public List<ExperienceDTO> findExperienceById(Integer id);
	
	public ExperienceDTO findExperience(Integer id);

}
