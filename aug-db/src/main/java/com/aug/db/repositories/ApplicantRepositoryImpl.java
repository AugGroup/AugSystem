package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.entities.Applicant;

@Repository(value = "applicantRepository")
@Transactional
public class ApplicantRepositoryImpl extends
		HibernateRepositoryImpl<Applicant, Serializable> implements
		ApplicantRepository {

	@Override
	public List<ApplicantDTO> findByPosition(String position) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_APPLICANT");
		query.setParameter("POSITION", "%" + position + "%");
		List<ApplicantDTO> results = query.list();
		return results;
	}

	@Override
	public List<ApplicantDTO> findAllApplicant() {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ALL");
		List<ApplicantDTO> results = query.list();
		return results;
	}

	@Override
	public ApplicantDTO findApplicantById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_BY_ID");
		query.setParameter("ID", id);
		List<ApplicantDTO> result = query.list();
		ApplicantDTO app = result.get(0);
		return app;
	}
	

	
	
}
