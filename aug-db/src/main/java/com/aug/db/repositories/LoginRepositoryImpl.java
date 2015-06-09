package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.LoginDTO;
import com.aug.db.entities.Login;

@Repository(value = "loginRepository")
@Transactional
public class LoginRepositoryImpl extends
		HibernateRepositoryImpl<Login, Serializable> implements LoginRepository {

	@Override
	public LoginDTO findByUserName(String userName) throws UsernameNotFoundException {
		Login login = new Login();
		Query query = getCurrentSession().getNamedQuery("SEARCH_USERNAME");
		query.setParameter("USERNAME", userName);
		if(!"admin".equals(userName)){
			throw new UsernameNotFoundException("login incorrect");
		}else {
			login.setUserName(userName);
			login.setPassword("12345678");
		}
		return new LoginDTO();
//		List<LoginDTO> results = query.list();
//		return results;
	}

	// @Override
	// public UserDetails loadUserByUsername(String username) throws
	// UsernameNotFoundException {
	// User user = new User();
	// System.out.println("try login by user name => " + username);
	// if (!"admin".equals(username) && !"editor".equals(username) &&
	// !"public".equals(username)) {
	// throw new UsernameNotFoundException("login incorrect");
	// }else{
	// user.setUsername(username);
	// user.setPassword("1234");
	// }
	// return new UserDetaislApp(user);
	// }

}
