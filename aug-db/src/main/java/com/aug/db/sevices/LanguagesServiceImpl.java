package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Languages;
import com.aug.db.repositories.LanguagesRepository;

@Service(value = "languagesService")
@Transactional
public class LanguagesServiceImpl implements LanguagesService {

	@Autowired
	private LanguagesRepository languagesRepository;
	
	@Rollback(value = false)
	public void create(Languages languages) {
		languagesRepository.insert(languages);	
	}

	public Languages findById(Integer id) {
		return languagesRepository.findById(id);

	}

	@Rollback(value = false)
	public void update(Languages languages) {
		languagesRepository.update(languages);
	}

	@Rollback(value = false)
	public void delete(Integer id) {
		languagesRepository.delete(id);		
	}

	public List<Languages> findAll() {
		List<Languages> languageList = languagesRepository.findAll(); 
		return languageList;
	}

}
