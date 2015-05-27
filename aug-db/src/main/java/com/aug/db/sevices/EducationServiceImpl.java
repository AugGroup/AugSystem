package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Address;
import com.aug.db.entities.Education;
@Service(value = "educationService")
@Transactional
public class EducationServiceImpl implements EducationService{
	
	@Autowired
	private EducationService educationService;
	
	@Override
	public Education findById(Integer id) {
		return educationService.findById(id);
	}

	@Override
	public void create(Education education) {
		educationService.create(education);
		
	}

	@Override
	public void update(Education education) {
		educationService.update(education);
		
	}

	@Override
	public void delete(Integer id) {
		educationService.delete(id);
		
	}

	@Override
	public List<Education> findAll() {
		List<Education> educationList = educationService.findAll();
		return educationList;
	}
	

}
