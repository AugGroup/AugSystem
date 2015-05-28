package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.AugEmployee;
import com.aug.db.repositories.AugEmployeeRepository;
@Service(value = "augEmployeeService")
@Transactional
public class AugEmployeeServiceImpl implements AugEmployeeService {

	@Autowired
	private AugEmployeeRepository augEmployeeRepository;
	
	@Rollback(value = false)
	public void create(AugEmployee augEmployee) {
		augEmployeeRepository.insert(augEmployee);
		
	}

	public AugEmployee findById(Integer id) {
		return augEmployeeRepository.findById(id);
	}

	@Rollback(value = false)
	public void update(AugEmployee augEmployee) {
		augEmployeeRepository.update(augEmployee);	
	}

	@Rollback(value = false)
	public void delete(Integer id) {
		augEmployeeRepository.delete(id);
	}

	public List<AugEmployee> findAll() {
		List<AugEmployee> augEmployees = augEmployeeRepository.findAll();
		return augEmployees;
	}

}
