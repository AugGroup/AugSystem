package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Reference;
import com.aug.db.repositories.ReferenceRepository;

@Service(value = "referenceService")
@Transactional
public class ReferenceServiceImpl implements ReferenceService{

	@Autowired
	private ReferenceRepository referenceRepository;
	
	@Rollback(value = false)
	public void create(Reference reference) {
		referenceRepository.insert(reference);		
	}

	public Reference findById(Integer id) {
		return referenceRepository.findById(id);
	}
	
	@Rollback(value = false)
	public void update(Reference reference) {
		referenceRepository.update(reference);		
	}
	
	@Rollback(value = false)
	public void delete(Integer id) {
		referenceRepository.deleteById(id);		
	}

	public List<Reference> findAll() {
		List<Reference> references = referenceRepository.findAll();
		return references;
	}

}
