package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.ExperienceDTO;
import com.aug.db.entities.Experience;

public interface ExperienceService {
	
	public void create(Experience experience);
	
	public Experience findById(Integer id);
	
	public void update(Experience experience);
	
	public void deleteById(Integer id);
	
	public void delete(Experience experience);
	
	public List<Experience> findAll();
	
	public List<ExperienceDTO> findExperienceById(Integer id);

	public ExperienceDTO findExperience(Integer id);

}
