package com.aug.db.dto;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.aug.db.entities.Login;

@Entity
@NamedNativeQueries({ @NamedNativeQuery(name = "SEARCH_USERNAME", query = " SELECT USERNAME, PASSWORD, "
+ " FROM LOGIN WHERE USERNAME = :USERNAME AND PASSWORD = :PASSWORD", resultClass = LoginDTO.class) })
public class LoginDTO {
	
	@Id
	@Column(name = "ID")
	private Integer id;
	
	@Column(name = "USERNAME")
	private String userName;

	@Column(name = "PASSWORD")
	private String password;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
