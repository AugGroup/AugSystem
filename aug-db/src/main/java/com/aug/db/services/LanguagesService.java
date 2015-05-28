package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Languages;

public interface LanguagesService {
	
	public void create(Languages languages);
	
	public Languages findById(Integer id);
	
	public void update(Languages languages);
	
	public void delete(Integer id);
	
	public List<Languages> findAll();

}