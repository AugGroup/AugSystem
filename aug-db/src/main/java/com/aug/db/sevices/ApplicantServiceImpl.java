package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Applicant;

@Service(value = "applicantService")
@Transactional
public class ApplicantServiceImpl implements ApplicantService {
	
	@Autowired
	private ApplicantService applicantService;
	
	@Override
	public Applicant findById(Integer id) {
		return applicantService.findById(id);
	}

	@Override
	public void create(Applicant applicant) {
		applicantService.create(applicant);
		
	}

	@Override
	public void update(Applicant applicant) {
		applicantService.update(applicant);
		
	}

	@Override
	public void delete(Integer id) {
		applicantService.delete(id);
		
	}

	@Override
	public List<Applicant> findAll() {
		List<Applicant> applicants = applicantService.findAll();
		return applicants;
	}
	
}
