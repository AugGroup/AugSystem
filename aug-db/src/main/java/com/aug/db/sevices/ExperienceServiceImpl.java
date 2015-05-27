package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Experience;

@Service(value = "experienceService")
@Transactional
public class ExperienceServiceImpl implements ExperienceService{
	
	@Autowired
	private ExperienceService experienceService;
	
	@Override
	public Experience findById(Integer id) {
		return experienceService.findById(id);
	}

	@Override
	public void create(Experience experience) {
		experienceService.create(experience);
		
	}

	@Override
	public void update(Experience experience) {
		experienceService.update(experience);
		
	}

	@Override
	public void delete(Integer id) {
		experienceService.delete(id);
		
	}

	@Override
	public List<Experience> findAll() {
		List<Experience> experienceList = experienceService.findAll();
		return experienceList;
	}
	

}
