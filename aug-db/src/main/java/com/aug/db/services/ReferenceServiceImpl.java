package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ReferenceDTO;
import com.aug.db.entities.Reference;
import com.aug.db.repositories.ReferenceRepository;

@Service(value = "referenceService")
@Transactional
public class ReferenceServiceImpl implements ReferenceService {

	@Autowired
	private ReferenceRepository referenceRepository;


	public void create(Reference reference) {
		referenceRepository.insert(reference);
	}

	public Reference findById(Integer id) {
		return referenceRepository.findById(id);
	}


	public void update(Reference reference) {
		referenceRepository.update(reference);
	}

	@Override
	public void delete(Reference reference) {
		referenceRepository.delete(reference);

	}

	@Override
	public void deleteById(Integer id) {
		referenceRepository.deleteById(id);

	}

	public List<Reference> findAll() {
		List<Reference> references = referenceRepository.findAll();
		return references;
	}
	
	@Override
	public List<ReferenceDTO> findReferenceById(Integer id){
		
		List<ReferenceDTO> references = referenceRepository.findReferenceById(id);
		return references;
	}
	
	@Override
	public ReferenceDTO findReference(Integer id){
		
		ReferenceDTO references = referenceRepository.findReference(id);
		return references;
	}

}
