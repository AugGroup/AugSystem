package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Department;
import com.aug.db.repositories.DepartmentRepository;

@Service(value = "departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentRepository departmentRepository;

	public void create(Department department) {
		departmentRepository.insert(department);

	}

	public Department findById(Integer id) {
		return departmentRepository.findById(id);
	}

	public void update(Department Department) {
		departmentRepository.update(Department);
	}

	@Override
	public void delete(Department Department) {
		departmentRepository.delete(Department);

	}

	@Override
	public void deleteById(Integer id) {
		departmentRepository.deleteById(id);

	}

	public List<Department> findAll() {
		List<Department> departments = departmentRepository.findAll();
		return departments;
	}

}
