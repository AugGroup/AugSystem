package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Department;

public interface DepartmentService {
	
	public void create(Department department);
	
	public Department findById(Integer id);
	
	public void update(Department Department);
	
	public void deleteById(Integer id);
	
	public void delete(Department Department);
	
	public List<Department> findAll();

}