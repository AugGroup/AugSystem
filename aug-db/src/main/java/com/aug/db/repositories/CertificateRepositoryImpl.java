package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.CertificatedDTO;
import com.aug.db.dto.FamilyDTO;
import com.aug.db.entities.Certificate;
import com.aug.db.entities.Family;

@Repository(value = "certificateRepository")
public class CertificateRepositoryImpl extends HibernateRepositoryImpl<Certificate, Serializable> implements CertificateRepository {

	@Override
	public List<CertificatedDTO> findCertificateById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_CERTIFICATE");
		query.setParameter("ID", id);
		List<CertificatedDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}

	@Override
	public CertificatedDTO findCertificate(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_CERTIFICATE_ID");
		query.setParameter("ID", id);
		List<CertificatedDTO> result = query.list();
		CertificatedDTO app = result.get(0);
		return app;
	}
	
	private List<CertificatedDTO> convert(List<Certificate> certificate){
		CertificatedDTO certificateDto = new CertificatedDTO();
		for(Certificate cer : certificate){
			certificateDto.setId(cer.getId());
			certificateDto.setCertificateName(cer.getCertificateName());
		}
		List<CertificatedDTO> listCertificate = new ArrayList<CertificatedDTO>();
		listCertificate.add(certificateDto);
		return listCertificate;
	}

}