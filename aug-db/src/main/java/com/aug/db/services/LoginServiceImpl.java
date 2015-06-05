package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Login;
import com.aug.db.repositories.LoginRepository;

@Service(value = "loginService")
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginRepository loginRepository;
	
	@Override
	public void create(Login login) {
		loginRepository.insert(login);
	}

	@Override
	public Login findById(Integer id) {
		return loginRepository.findById(id);
	}

	@Override
	public void update(Login login) {
		loginRepository.update(login);
	}

	@Override
	public void deleteById(Integer id) {
		loginRepository.deleteById(id);
	}

	@Override
	public void delete(Login login) {
		loginRepository.delete(login);
	}

	@Override
	public List<Login> findAll() {
		return loginRepository.findAll();
	}

}
