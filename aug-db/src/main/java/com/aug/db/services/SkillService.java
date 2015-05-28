package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Skill;


public interface SkillService {
	
public void create(Skill skill);
	
	public Skill findById(Integer id);
	
	public void update(Skill skill);
	
	public void delete(Integer id);
	
	public List<Skill> findAll();

}
