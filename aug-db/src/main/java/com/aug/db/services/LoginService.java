package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.LoginDTO;
import com.aug.db.entities.Login;

public interface LoginService {
	
	public void create(Login login);
	
	public Login findById(Integer id);
	
	public void update(Login login);
	
	public void deleteById(Integer id);
	
	public void delete(Login login);
	
	public List<Login> findAll();
	
	public LoginDTO findByUserName(String userName);

}
