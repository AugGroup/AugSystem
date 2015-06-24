package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.FamilyDTO;
import com.aug.db.entities.Family;
import com.aug.db.repositories.FamilyRepository;

@Service(value = "familyService")
@Transactional
public class FamilyServiceImpl implements FamilyService {
	@Autowired
	private FamilyRepository familyRepository;

	public void create(Family family) {
		familyRepository.insert(family);
	}

	public Family findById(Integer id) {
		return familyRepository.findById(id);
	}

	public void update(Family family) {
		familyRepository.update(family);
	}

	@Override
	public void delete(Family family) {
		familyRepository.delete(family);

	}

	@Override
	public void deleteById(Integer id) {
		familyRepository.deleteById(id);

	}

	public List<Family> findAll() {
		List<Family> families = familyRepository.findAll();
		return families;
	}

	@Override
	public List<FamilyDTO> findFamilyById(Integer id) {
		List<FamilyDTO> families = familyRepository.findFamilyById(id);
		return families;
	}

	@Override
	public FamilyDTO findFamily(Integer id) {
		FamilyDTO family = familyRepository.findFamily(id);
		return family;
	}

}
