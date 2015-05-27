package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Skill;

@Service(value = "skillService")
@Transactional
public class SkillServiceImpl implements SkillService{
	
	@Autowired
	private SkillService skillService;
	
	@Override
	public Skill findById(Integer id) {
		return skillService.findById(id);
	}

	@Override
	public void create(Skill skill) {
		skillService.create(skill);
		
	}

	@Override
	public void update(Skill skill) {
		skillService.update(skill);
		
	}

	@Override
	public void delete(Integer id) {
		skillService.delete(id);
		
	}

	@Override
	public List<Skill> findAll() {
		List<Skill> skillList = skillService.findAll();
		return skillList;
	}
	

}
