package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.ReferenceDTO;
import com.aug.db.entities.Reference;

public interface ReferenceRepository extends GenericRepository<Reference, Serializable> {
	
	public List<ReferenceDTO> findReferenceById(Integer id);
	
	public ReferenceDTO findReference(Integer id);

}
