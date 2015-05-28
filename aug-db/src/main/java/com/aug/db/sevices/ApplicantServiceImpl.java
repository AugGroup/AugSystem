package com.aug.db.sevices;

import java.util.List;

import com.aug.db.repositories.ApplicantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Applicant;

@Service(value = "applicantService")
@Transactional
public class ApplicantServiceImpl implements ApplicantService {
	
	@Autowired
	private ApplicantRepository applicantRepository;
	
	@Override
	public Applicant findById(Integer id) {
		return applicantRepository.findById(id);
	}

	@Override
	public void create(Applicant applicant) {
		applicantRepository.insert(applicant);
		
	}

	@Override
	public void update(Applicant applicant) {
		applicantRepository.update(applicant);
		
	}

	@Override
	public void delete(Integer id) {
//		applicantRepository.delete(id);
		
	}

	@Override
	public List<Applicant> findAll() {
		List<Applicant> applicants = applicantRepository.findAll();
		return applicants;
	}
	
}
