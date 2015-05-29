package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Experience;
import com.aug.db.repositories.ExperienceRepository;

@Service(value = "experienceService")
@Transactional
public class ExperienceServiceImpl implements ExperienceService{
	
	@Autowired
	private ExperienceRepository experienceRepository;
	
	@Override
	public Experience findById(Integer id) {
		return experienceRepository.findById(id);
	}

	@Override
	public void create(Experience experience) {
		experienceRepository.insert(experience);
		
	}

	@Override
	public void update(Experience experience) {
		experienceRepository.update(experience);
		
	}

	@Override
	public void delete(Experience experience) {
		experienceRepository.delete(experience);
		
	}
	
	@Override
	public void deleteById(Integer id) {
		experienceRepository.deleteById(id);
		
	}

	@Override
	public List<Experience> findAll() {
		List<Experience> experienceList = experienceRepository.findAll();
		return experienceList;
	}
	

}
