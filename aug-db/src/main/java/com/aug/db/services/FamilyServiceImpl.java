package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Family;
import com.aug.db.repositories.FamilyRepository;
@Service(value = "familyService")
@Transactional
public class FamilyServiceImpl implements FamilyService {
	@Autowired
	private FamilyRepository familyRepository;

	@Rollback(value = false)
	public void create(Family family) {
		familyRepository.insert(family);		
	}

	public Family findById(Integer id) {
		return familyRepository.findById(id);
	}

	@Rollback(value = false)
	public void update(Family family) {
		familyRepository.update(family);		
	}

	@Override 
	@Rollback(value = false)
	public void delete(Family family) {
		familyRepository.delete(family);
		
	}
	
	@Override 
	@Rollback(value = false)
	public void deleteById(Integer id) {
		familyRepository.deleteById(id);
		
	}

	public List<Family> findAll() {
		List<Family> families = familyRepository.findAll();
		return families;
	}

}
