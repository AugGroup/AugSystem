package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.LanguagesDTO;
import com.aug.db.entities.Languages;

public interface LanguagesRepository extends GenericRepository<Languages, Serializable> {
	
	public List<LanguagesDTO> findLanguagesById(Integer id);
	
	public LanguagesDTO findByLanguagesId(Integer id);

}
