package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.SkillDTO;
import com.aug.db.entities.Skill;
import com.aug.db.repositories.SkillRepository;

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

	public void delete(Skill skill) {
		skillRepository.delete(skill);
		
	}
	
	@Override
	public void deleteById(Integer id) {
		skillRepository.deleteById(id);
		
	}
	
	@Override
	public List<Skill> findAll() {
		List<Skill> skillList = skillRepository.findAll();
		return skillList;
	}

	@Override
	public List<SkillDTO> findSkillById(Integer id) {
		List<SkillDTO> skills = skillRepository.findSkillById(id);
		return skills;
	}

	@Override
	public SkillDTO findSkill(Integer id) {
		SkillDTO skill = skillRepository.findBySkillId(id);
		return skill;
	}
	

}
