package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.AttachFile;
import com.aug.db.entities.AugEmployee;

@Repository(value = "augEmployeeRepository")
public class AugEmployeeRepositoryImpl extends HibernateRepositoryImpl<AugEmployee, Serializable> implements AugEmployeeRepository {
	
	
}