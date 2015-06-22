package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.LanguagesDTO;
import com.aug.db.entities.Languages;

public interface LanguagesService {
	
	public void create(Languages languages);
	
	public Languages findById(Integer id);
	
	public void update(Languages languages);
	
	public void deleteById(Integer id);
	
	public void delete(Languages languages);
	
	public List<Languages> findAll();
	
	public List<LanguagesDTO> findLanguagesById(Integer id);

	public LanguagesDTO findLanguages(Integer id);

}