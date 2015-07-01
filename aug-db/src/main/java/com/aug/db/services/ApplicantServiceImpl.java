package com.aug.db.services;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.repositories.AddressRepository;
import com.aug.db.repositories.ApplicantRepository;
import com.aug.db.repositories.PositionRepository;

@Service(value = "applicantService")
@Transactional
public class ApplicantServiceImpl implements ApplicantService {

	@Autowired
	private ApplicantRepository applicantRepository;
	
	@Autowired
	private PositionRepository positionRepository;
	
	@Autowired
	private AddressRepository addressRepository;

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
		for (ApplicantDTO appl : applicants) {
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
		for (ApplicantDTO appl : applicants) {
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
	public ApplicantDTO findApplicantById(Integer id) {
		ApplicantDTO applicants = applicantRepository.findApplicantById(id);
		String position1 = positionRepository.findById(applicants.getPosition1()).getPositionName();
		String position2 = positionRepository.findById(applicants.getPosition2()).getPositionName();
		String position3 = positionRepository.findById(applicants.getPosition3()).getPositionName();
		applicants.setPosition1Str(position1);
		applicants.setPosition2Str(position2);
		applicants.setPosition3Str(position3);

		return applicants;
	}

	
	@Override
	public ApplicationDTO findApplicationById(Integer id) {
		ApplicationDTO applicants = applicantRepository.findApplicationById(id);

		return applicants;
	}
	
	@Override
	public ApplicationDTO findByIdApplicant(Integer id) {
		return applicantRepository.findApplicationById(id);
		
	}

	@Override
	public ApplicationDTO saveInformations(ApplicationDTO applicationDTO) {
		Applicant applicant = new Applicant();
		applicant.setTrackingStatus("Waiting for consider");
		
		try {
			applicantRepository.insert(applicant.fromApplicationDTO(applicant,applicationDTO));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		applicationDTO.setId(applicant.getId());
		return applicationDTO;
	}
	

   
	  /*-------------------- Report --------------------*/
		//findAll
		public List<ReportApplicantDTO> reportApplicant() {
			return applicantRepository.reportApplicant();
		}
		//find by criteria
		@Override
		public List<ReportApplicantDTO> findReportByCriteria(String position, String degree, String major, String schoolName, Double gpa) {
			return applicantRepository.findReportByCriteria(position, degree, major, schoolName, gpa);
		}
		
		/*-------------------- Monthly report --------------------*/
		@Override
		public List<ReportApplicantDTO> findReportByMonth(Integer applyDate) {
			return applicantRepository.findReportByMonth(applyDate);
		}

		@Override
		public void update(ApplicationDTO applicationDTO) {
			applicantRepository.update(applicationDTO);
			
		}

		@Override
		public ApplicationDTO getMaxApplicantId() {
			return applicantRepository.getMaxApplicantId();
		}
}
