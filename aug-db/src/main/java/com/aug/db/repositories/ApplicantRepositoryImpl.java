package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Applicant;

@Repository(value = "applicantRepository")
@Transactional
public class ApplicantRepositoryImpl extends
		HibernateRepositoryImpl<Applicant, Serializable> implements
		ApplicantRepository {

	@Override
	public List<Applicant> findByPosition(String position) {
		Query query = getCurrentSession().createQuery(
				"from Applicant a where a.position1 = :POSITION");
		query.setParameter("POSITION", position);

		List<Applicant> results = query.list();
		return results;
	}
}
