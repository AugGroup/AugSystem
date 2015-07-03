package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.SkillDTO;
import com.aug.db.entities.Skill;

@Repository(value="skillRepository")
public class SkillRepositoryImpl extends HibernateRepositoryImpl<Skill, Serializable> implements SkillRepository {
	
	@Override
	public List<SkillDTO> findSkillById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_SKILL");
		query.setParameter("ID", id);
		List<SkillDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}
	
	@Override
	public SkillDTO findSkill(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_SKILL_ID");
		query.setParameter("ID", id);
		List<SkillDTO> result = query.list();
		SkillDTO app = result.get(0);
		return app;
	}
	
	private List<SkillDTO> convert(List<Skill> skill){
		SkillDTO skillDto = new SkillDTO();
		for(Skill sk : skill){
			skillDto.setId(sk.getId());
			skillDto.setSkillDetail(sk.getSkillDetail());
		}
		List<SkillDTO> listSkill = new ArrayList<SkillDTO>();
		listSkill.add(skillDto);		
		return listSkill;
	}

}
