package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.SkillDTO;
import com.aug.db.entities.Skill;

public interface SkillRepository extends GenericRepository<Skill, Serializable> {
	
	public List<SkillDTO> findSkillById(Integer id);

	public SkillDTO findBySkillId(Integer id);

}
