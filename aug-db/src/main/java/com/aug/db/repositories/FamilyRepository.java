package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.FamilyDTO;
import com.aug.db.entities.Family;

public interface FamilyRepository extends GenericRepository<Family, Serializable> {
	
	public List<FamilyDTO> findFamilyById(Integer id);
	
	public FamilyDTO findFamily(Integer id);

}