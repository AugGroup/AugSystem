package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.LanguagesDTO;
import com.aug.db.entities.Languages;
import com.aug.db.repositories.LanguagesRepository;

@Service(value = "languagesService")
@Transactional
public class LanguagesServiceImpl implements LanguagesService {

	@Autowired
	private LanguagesRepository languagesRepository;

	public void create(Languages languages) {
		languagesRepository.insert(languages);
	}

	public Languages findById(Integer id) {
		return languagesRepository.findById(id);

	}

	public void update(Languages languages) {
		languagesRepository.update(languages);
	}

	@Override
	public void delete(Languages languages) {
		languagesRepository.delete(languages);

	}

	@Override
	public void deleteById(Integer id) {
		languagesRepository.deleteById(id);

	}

	public List<Languages> findAll() {
		List<Languages> languageList = languagesRepository.findAll();
		return languageList;
	}

	@Override
	public List<LanguagesDTO> findLanguagesById(Integer id) {
		List<LanguagesDTO> languageses = languagesRepository.findLanguagesById(id);
		return languageses;
	}

	@Override
	public LanguagesDTO findLanguages(Integer id) {
		LanguagesDTO languages = languagesRepository.findByLanguagesId(id);
		return languages;
	}

}
