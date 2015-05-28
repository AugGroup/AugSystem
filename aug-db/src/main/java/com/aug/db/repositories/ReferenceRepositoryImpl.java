package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Reference;
@Repository(value = "referenceRepository")
public class ReferenceRepositoryImpl extends HibernateRepositoryImpl<Reference, Serializable> implements ReferenceRepository {
	
}