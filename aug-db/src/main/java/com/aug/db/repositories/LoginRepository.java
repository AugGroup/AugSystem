package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.LoginDTO;
import com.aug.db.entities.Login;

public interface LoginRepository extends GenericRepository<Login,Serializable>{
	
	public List<LoginDTO> findByUserName(String userName, String password);

}
