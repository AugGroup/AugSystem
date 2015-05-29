package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Department;
import com.aug.db.repositories.DepartmentRepository;

@Service(value = "departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentRepository departmentRepository;
	
	@Rollback(value = false)
	public void create(Department department) {
		departmentRepository.insert(department);
		
	}

	public Department findById(Integer id) {
		return departmentRepository.findById(id);
	}

	@Rollback(value = false)
	public void update(Department Department) {
		departmentRepository.update(Department);		
	}

	@Rollback(value = false)
	public void delete(Integer id) {
		departmentRepository.deleteById(id);		
	}

	public List<Department> findAll() {
		List<Department> departments = departmentRepository.findAll();
		return departments;
	}

}
