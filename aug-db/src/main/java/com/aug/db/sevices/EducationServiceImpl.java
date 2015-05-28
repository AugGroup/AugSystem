package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Address;
import com.aug.db.entities.Education;
import com.aug.db.repositories.EducationRepository;
@Service(value = "educationService")
@Transactional
public class EducationServiceImpl implements EducationService{
	
	@Autowired
	private EducationRepository educationRepository;
	
	@Override
	public Education findById(Integer id) {
		return educationRepository.findById(id);
	}

	@Override
	public void create(Education education) {
		educationRepository.insert(education);
		
	}

	@Override
	public void update(Education education) {
		educationRepository.update(education);
		
	}

	@Override
	public void delete(Integer id) {
		educationRepository.deleteById(id);
		
	}

	@Override
	public List<Education> findAll() {
		List<Education> educationList = educationRepository.findAll();
		return educationList;
	}
	

}
