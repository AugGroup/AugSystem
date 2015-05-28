package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Education;

public interface EducationService {

	public void create(Education education);

	public Education findById(Integer id);

	public void update(Education education);

	public void delete(Integer id);

	public List<Education> findAll();

}
