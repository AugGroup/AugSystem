package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Family;

@Repository(value = "familyRepository")
public class FamilyRepositoryImpl extends HibernateRepositoryImpl<Family, Serializable> implements FamilyRepository {
	
}