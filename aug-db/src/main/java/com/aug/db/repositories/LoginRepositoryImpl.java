package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Login;

@Repository(value = "loginRepository")
public class LoginRepositoryImpl extends HibernateRepositoryImpl<Login,Serializable> implements LoginRepository{

}
