package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Experience;

@Repository(value="experienceRepository")
public class ExperienceRepositoryImpl extends HibernateRepositoryImpl<Experience, Serializable> implements
ExperienceRepository{

}
