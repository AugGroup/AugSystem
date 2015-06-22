package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.EducationDTO;
import com.aug.db.entities.Address;
import com.aug.db.entities.Education;

@Repository(value="educationRepository")
public class EducationRepositoryImpl extends HibernateRepositoryImpl<Education, Serializable> implements
EducationRepository{

	@Override
	public List<EducationDTO> findEducationById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_EDUCATION");
		query.setParameter("ID", id);
		List<EducationDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}

	@Override
	public EducationDTO findByEducationId(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_EDUCATION_ID");
		query.setParameter("ID", id);
		List<EducationDTO> result = query.list();
		EducationDTO app = result.get(0);
		return app;
	}
	
	private List<EducationDTO> convert(List<Education> education){
		EducationDTO edDto = new EducationDTO();
		for(Education ed : education){
			edDto.setId(ed.getId());
			edDto.setDegree(ed.getDegree());
			edDto.setFaculty(ed.getFaculty());
			edDto.setGpa(ed.getGpa());
			edDto.setMajor(ed.getMajor());
			edDto.setSchoolName(ed.getSchoolName());
			edDto.setYearsOfGraduate(ed.getYearsOfGraduate());
		}
		List<EducationDTO> listEd = new ArrayList<EducationDTO>();
		listEd.add(edDto);		
		return listEd;
	}

}
