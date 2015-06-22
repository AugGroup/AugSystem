package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.LanguagesDTO;
import com.aug.db.entities.Address;
import com.aug.db.entities.Languages;

@Repository(value = "languagesRepository")
public class LanguagesRepositoryImpl extends HibernateRepositoryImpl<Languages, Serializable> implements LanguagesRepository {

	@Override
	public List<LanguagesDTO> findLanguagesById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_LANGUAGES");
		query.setParameter("ID", id);
		List<LanguagesDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}

	@Override
	public LanguagesDTO findByLanguagesId(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_LANGUAGES_ID");
		query.setParameter("ID", id);
		List<LanguagesDTO> result = query.list();
		LanguagesDTO app = result.get(0);
		return app;
	}
	
	private List<LanguagesDTO> convert(List<Languages> languages){
		LanguagesDTO langDto = new LanguagesDTO();
		for(Languages lang : languages){
			langDto.setId(lang.getId());
			langDto.setLanguagesName(lang.getLanguagesName());
			langDto.setReading(lang.getReading());
			langDto.setSpeaking(lang.getSpeaking());
			langDto.setUnderstanding(lang.getUnderstanding());
			langDto.setWriting(lang.getWriting());
		}
		List<LanguagesDTO> listLang = new ArrayList<LanguagesDTO>();
		listLang.add(langDto);		
		return listLang;
	}
	
	
	
}