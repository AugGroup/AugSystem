package com.aug.db.sevices;

import java.util.List;

import com.aug.db.repositories.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Skill;

@Service(value = "skillService")
@Transactional
public class SkillServiceImpl implements SkillService{
	
	@Autowired
	private SkillRepository skillRepository;
	
	@Override
	public Skill findById(Integer id) {
		return skillRepository.findById(id);
	}

	@Override
	public void create(Skill skill) {
        skillRepository.insert(skill);
		
	}

	@Override
	public void update(Skill skill) {
		skillRepository.update(skill);
		
	}

	@Override
	public void delete(Integer id) {
//		skillRepository.delete(id);
		
	}

	@Override
	public List<Skill> findAll() {
		List<Skill> skillList = skillRepository.findAll();
		return skillList;
	}
	

}
