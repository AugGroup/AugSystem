package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Certificate;

@Repository(value = "certificateRepository")
public class CertificateRepositoryImpl extends HibernateRepositoryImpl<Certificate, Serializable> implements CertificateRepository {

}