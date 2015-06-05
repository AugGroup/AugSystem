package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.LoginDTO;
import com.aug.db.entities.Login;

@Repository(value = "loginRepository")
@Transactional
public class LoginRepositoryImpl extends HibernateRepositoryImpl<Login,Serializable> implements LoginRepository{

	@Override
	public List<LoginDTO> findByUserName(String userName, String password) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_USERNAME");
		query.setParameter("USERNAME", userName);
		query.setParameter("PASSWORD", password);
		List<LoginDTO> results = query.list();
		return results;
	}

}
