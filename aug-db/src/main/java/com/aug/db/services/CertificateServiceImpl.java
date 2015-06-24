package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.CertificatedDTO;
import com.aug.db.entities.Certificate;
import com.aug.db.repositories.CertificateRepository;
@Service(value = "certificateService")
@Transactional
public class CertificateServiceImpl implements CertificateService {

	@Autowired
	private CertificateRepository certificateRepository;
	@Override
	public void create(Certificate certificate) {
		certificateRepository.insert(certificate);		
	}

	@Override
	public Certificate findById(Integer id) {
		return certificateRepository.findById(id);
	}

	@Override
	public void update(Certificate certificate) {
		certificateRepository.update(certificate);
	}

	@Override
	public void deleteById(Integer id) {
		certificateRepository.deleteById(id);
		
	}

	@Override
	public void delete(Certificate certificate) {
		certificateRepository.delete(certificate);
		
	}

	@Override
	public List<Certificate> findAll() {
		return certificateRepository.findAll();
	}

	@Override
	public List<CertificatedDTO> findCertificateById(Integer id) {
		List<CertificatedDTO> certificates = certificateRepository.findCertificateById(id);
		return certificates;
	}

	@Override
	public CertificatedDTO findCertificate(Integer id) {
		CertificatedDTO certificate = certificateRepository.findCertificate(id);
		return certificate;
	}

}
