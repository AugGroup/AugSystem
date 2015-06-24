package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.FamilyDTO;
import com.aug.db.entities.Family;

@Repository(value = "familyRepository")
public class FamilyRepositoryImpl extends HibernateRepositoryImpl<Family, Serializable> implements FamilyRepository {

	@Override
	public List<FamilyDTO> findFamilyById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_FAMILY");
		query.setParameter("ID", id);
		List<FamilyDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}

	@Override
	public FamilyDTO findFamily(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_FAMILY_ID");
		query.setParameter("ID", id);
		List<FamilyDTO> result = query.list();
		FamilyDTO app = result.get(0);
		return app;
	}
	
	private List<FamilyDTO> convert(List<Family> family){
		FamilyDTO familyDto = new FamilyDTO();
		for(Family fam : family){
			familyDto.setId(fam.getId());
			familyDto.setAddress(fam.getAddress());
			familyDto.setName(fam.getName());
			familyDto.setOccupation(fam.getOccupation());
			familyDto.setPositionFamily(fam.getPositionFamily());
			familyDto.setRelation(fam.getRelation());
		}
		List<FamilyDTO> listFamily = new ArrayList<FamilyDTO>();
		listFamily.add(familyDto);
		return listFamily;
	}
	
}