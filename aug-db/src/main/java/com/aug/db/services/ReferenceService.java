package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Reference;

public interface ReferenceService {
	
	public void create(Reference reference);
	
	public Reference findById(Integer id);
	
	public void update(Reference reference);
	
	public void deleteById(Integer id);
	
	public void delete(Reference reference);
	
	public List<Reference> findAll();

}