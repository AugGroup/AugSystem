package com.aug.db.sevices;

import java.util.List;

import com.aug.db.entities.Education;

public interface EducationService {

	public void create(Education education);

	public Education findById(Integer id);

	public void update(Education education);

	public void delete(Education Education);
	
	public void deleteById(Integer id);

	public List<Education> findAll();

}
