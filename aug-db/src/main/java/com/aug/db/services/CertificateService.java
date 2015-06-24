package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.CertificatedDTO;
import com.aug.db.entities.Certificate;

public interface CertificateService {
	
	public void create(Certificate certificate);

	public Certificate findById(Integer id);

	public void update(Certificate certificate);

	public void deleteById(Integer id);
	
	public void delete(Certificate certificate);

	public List<Certificate> findAll();
	
	public List<CertificatedDTO> findCertificateById(Integer id);

	public CertificatedDTO findCertificate(Integer id);
}
