package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.FamilyDTO;
import com.aug.db.entities.Family;

public interface FamilyService {
	
	public void create(Family family);
	
	public Family findById(Integer id);
	
	public void update(Family family);
	
	public void deleteById(Integer id);
	
	public void delete(Family family);
	
	public List<Family> findAll();
	
	public List<FamilyDTO> findFamilyById(Integer id);

	public FamilyDTO findFamily(Integer id);


}