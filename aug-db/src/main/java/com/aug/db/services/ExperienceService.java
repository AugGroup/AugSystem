package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Experience;

public interface ExperienceService {
	
public void create(Experience experience);
	
	public Experience findById(Integer id);
	
	public void update(Experience experience);
	
	public void delete(Integer id);
	
	public List<Experience> findAll();

}
