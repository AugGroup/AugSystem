package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Reference;

public interface ReferenceService {
	
	public void create(Reference reference);
	
	public Reference findById(Integer id);
	
	public void update(Reference reference);
	
	public void delete(Integer id);
	
	public List<Reference> findAll();

}