package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Department;

public interface DepartmentService {
	
	public void create(Department department);
	
	public Department findById(Integer id);
	
	public void update(Department Department);
	
	public void delete(Integer id);
	
	public List<Department> findAll();

}