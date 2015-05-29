package com.aug.db.sevices;

import java.util.List;

import com.aug.db.entities.AugEmployee;

public interface AugEmployeeService {
	
	public void create(AugEmployee augEmployee);
	
	public AugEmployee findById(Integer id);
	
	public void update(AugEmployee augEmployee);
	
	public void delete(Integer id);
	
	public List<AugEmployee> findAll();

}