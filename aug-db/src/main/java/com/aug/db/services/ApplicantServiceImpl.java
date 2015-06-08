package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.entities.Position;
import com.aug.db.repositories.ApplicantRepository;
import com.aug.db.repositories.PositionRepository;

@Service(value = "applicantService")
@Transactional
public class ApplicantServiceImpl implements ApplicantService {
	
	@Autowired
	private ApplicantRepository applicantRepository;
	
	@Autowired
	private PositionRepository positionRepository;
	
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
	public void delete(Applicant applicant) {
		applicantRepository.delete(applicant);
		
	}
	
	@Override
	public void deleteById(Integer id) {
		applicantRepository.deleteById(id);
		
	}

	@Override
	public List<Applicant> findAll() {
		List<Applicant> applicants = applicantRepository.findAll();
		return applicants;
	}
	
	
	@Override
	public List<ApplicantDTO> findByPosition(String position) {
		List<ApplicantDTO> applicants = applicantRepository.findByPosition(position);
		for(ApplicantDTO appl : applicants){
			String position1 = positionRepository.findById(appl.getPosition1()).getPositionName();
			String position2 = positionRepository.findById(appl.getPosition2()).getPositionName();	
			String position3 = positionRepository.findById(appl.getPosition3()).getPositionName();	
			appl.setPosition1Str(position1);
			appl.setPosition2Str(position2);
			appl.setPosition3Str(position3);
		}
		return applicants;
	}
	
	
	@Override
	public List<ApplicantDTO> findAllApplicant() {
		List<ApplicantDTO> applicants = applicantRepository.findAllApplicant();
		for(ApplicantDTO appl : applicants){
			String position1 = positionRepository.findById(appl.getPosition1()).getPositionName();
			String position2 = positionRepository.findById(appl.getPosition2()).getPositionName();	
			String position3 = positionRepository.findById(appl.getPosition3()).getPositionName();	
			appl.setPosition1Str(position1);
			appl.setPosition2Str(position2);
			appl.setPosition3Str(position3);
		}
		return applicants;
	}
}
