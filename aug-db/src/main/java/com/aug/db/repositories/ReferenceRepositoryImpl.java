package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.ExperienceDTO;
import com.aug.db.dto.ReferenceDTO;
import com.aug.db.entities.Experience;
import com.aug.db.entities.Reference;
@Repository(value = "referenceRepository")
public class ReferenceRepositoryImpl extends HibernateRepositoryImpl<Reference, Serializable> implements ReferenceRepository {
	
	@Override
	public List<ReferenceDTO> findReferenceById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_REFERENCE");
		query.setParameter("ID", id);
		List<ReferenceDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}

	@Override
	public ReferenceDTO findReference(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_REFERENCE_ID");
		query.setParameter("ID", id);
		List<ReferenceDTO> result = query.list();
		ReferenceDTO app = result.get(0);
		return app;
	}
	
	private List<ReferenceDTO> convert(List<Reference> reference){
		ReferenceDTO refDto = new ReferenceDTO();
		for(Reference ref : reference){
			refDto.setId(ref.getId());
			refDto.setFullName(ref.getFullName());
			refDto.setOccupation(ref.getOccupation());
			refDto.setCompleteAddress(ref.getCompleteAddress());
			refDto.setTel(ref.getTel());
		}
		List<ReferenceDTO> listAddr = new ArrayList<ReferenceDTO>();
		listAddr.add(refDto);
		return listAddr;
	}
	
}