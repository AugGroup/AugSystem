/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.AugRequestDTO;
import com.aug.db.entities.AugRequest;

/**
 *
 * @author Supannika Pattanodom
 */
@Repository(value = "augRequestRepository")
public class AugRequestRepositoryImpl extends
		HibernateRepositoryImpl<AugRequest, Serializable> implements
		AugRequestRepository {

	@Override
	public List<AugRequestDTO> findAllAugRequest() {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ALL_REQUEST");
		List<AugRequestDTO> results = query.list();
		return results;
	}

	@Override
	public AugRequestDTO findAugRequestById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_REQUEST_BY_ID");
		query.setParameter("ID", id);
		List<AugRequestDTO> result = query.list();
		AugRequestDTO app = result.get(0);
		return app;
	}

}
