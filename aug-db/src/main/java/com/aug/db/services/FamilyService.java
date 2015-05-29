package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Family;

public interface FamilyService {
	
	public void create(Family family);
	
	public Family findById(Integer id);
	
	public void update(Family family);
	
	public void delete(Integer id);
	
	public List<Family> findAll();

}