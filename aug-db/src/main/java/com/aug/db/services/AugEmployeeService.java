package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.AugEmployee;

public interface AugEmployeeService {

	public void create(AugEmployee augEmployee);

	public AugEmployee findById(Integer id);

	public void update(AugEmployee augEmployee);

	public void deleteById(Integer id);

	public void delete(AugEmployee augEmployee);

	public List<AugEmployee> findAll();

}