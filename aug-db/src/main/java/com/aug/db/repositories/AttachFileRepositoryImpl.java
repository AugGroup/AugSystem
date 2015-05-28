package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.AttachFile;

@Repository(value = "attachFileRepository")
public class AttachFileRepositoryImpl extends HibernateRepositoryImpl<AttachFile, Serializable> implements AttachFileRepository {

	
}