/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.AugRequestDTO;
import com.aug.db.entities.AugRequest;

/**
 *
 * @author Supannika Pattanodom
 */
public interface AugRequestRepository extends GenericRepository<AugRequest, Serializable> {

	public List<AugRequestDTO> findAllAugRequest();
	
	public AugRequestDTO findAugRequestById(Integer id);

}
