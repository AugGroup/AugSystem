package com.aug.db.repositories;

import java.io.Serializable;
import org.springframework.stereotype.Repository;
import com.aug.db.entities.Department;
@Repository(value = "departmentRepository")
public class DepartmentRepositoryImpl extends HibernateRepositoryImpl<Department, Serializable> implements DepartmentRepository {
	
}