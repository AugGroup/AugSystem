package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Education;

@Repository(value="educationRepository")
public class EducationRepositoryImpl extends HibernateRepositoryImpl<Education, Serializable> implements
EducationRepository{

}
