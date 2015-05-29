package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Languages;

@Repository(value = "languagesRepository")
public class LanguagesRepositoryImpl extends HibernateRepositoryImpl<Languages, Serializable> implements LanguagesRepository {
	
}