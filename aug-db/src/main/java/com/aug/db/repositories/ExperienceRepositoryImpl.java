package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.ExperienceDTO;
import com.aug.db.entities.Address;
import com.aug.db.entities.Experience;

@Repository(value="experienceRepository")
public class ExperienceRepositoryImpl extends HibernateRepositoryImpl<Experience, Serializable> implements ExperienceRepository {

	@Override
	public List<ExperienceDTO> findExperienceById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_EXPERIENCE");
		query.setParameter("ID", id);
		List<ExperienceDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}

	@Override
	public ExperienceDTO findExperience(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_EXPERIENCE_ID");
		query.setParameter("ID", id);
		List<ExperienceDTO> result = query.list();
		ExperienceDTO app = result.get(0);
		return app;
	}
	
	private List<ExperienceDTO> convert(List<Experience> experience){
		ExperienceDTO expDto = new ExperienceDTO();
		for(Experience exp : experience){
			expDto.setId(exp.getId());
			expDto.setAddress(exp.getAddress());
			expDto.setDescription(exp.getDescription());
			expDto.setEmployerName(exp.getEmployerName());
			expDto.setFromDate(exp.getFromDate());
			expDto.setToDate(exp.getToDate());
			expDto.setPosition(exp.getPosition());
			expDto.setPositionOfEmployer(exp.getPositionOfEmployer());
			expDto.setReason(exp.getReason());
			expDto.setSalary(exp.getSalary());
			expDto.setSupervisor(exp.getSupervisor());
			expDto.setTypeOfBusiness(exp.getTypeOfBusiness());
		}
		List<ExperienceDTO> listAddr = new ArrayList<ExperienceDTO>();
		listAddr.add(expDto);
		return listAddr;
	}

}
