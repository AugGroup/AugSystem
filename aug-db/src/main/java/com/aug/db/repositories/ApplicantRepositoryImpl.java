package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Applicant;

@Repository(value = "applicantRepository")
public class ApplicantRepositoryImpl extends HibernateRepositoryImpl<Applicant, Serializable> implements ApplicantRepository {
	
}
