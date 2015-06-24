package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.CertificatedDTO;
import com.aug.db.dto.FamilyDTO;
import com.aug.db.entities.Certificate;

public interface CertificateRepository extends GenericRepository<Certificate, Serializable> {
	
	public List<CertificatedDTO> findCertificateById(Integer id);
	
	public CertificatedDTO findCertificate(Integer id);

}