package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Address;
import com.aug.db.entities.Applicant;
import com.aug.db.entities.Education;
import com.aug.db.entities.Experience;
import com.aug.db.entities.Languages;
import com.aug.db.entities.Position;
import com.aug.db.entities.Reference;
import com.aug.db.entities.Skill;
import com.aug.db.repositories.AddressRepository;
import com.aug.db.repositories.AddressRepositoryImpl;
import com.aug.db.repositories.ApplicantRepository;
import com.aug.db.repositories.DepartmentRepositoryImpl;
import com.aug.db.repositories.EducationRepositoryImpl;
import com.aug.db.repositories.ExperienceRepositoryImpl;
import com.aug.db.repositories.LanguagesRepository;
import com.aug.db.repositories.LanguagesRepositoryImpl;
import com.aug.db.repositories.PositionRepository;
import com.aug.db.repositories.ReferenceRepositoryImpl;
import com.aug.db.repositories.SkillRepositoryImpl;

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
		List<ApplicantDTO> applicants = applicantRepository
				.findByPosition(position);
		for (ApplicantDTO appl : applicants) {
			String position1 = positionRepository.findById(appl.getPosition1())
					.getPositionName();
			String position2 = positionRepository.findById(appl.getPosition2())
					.getPositionName();
			String position3 = positionRepository.findById(appl.getPosition3())
					.getPositionName();
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
			String position1 = positionRepository.findById(appl.getPosition1())
					.getPositionName();
			String position2 = positionRepository.findById(appl.getPosition2())
					.getPositionName();
			String position3 = positionRepository.findById(appl.getPosition3())
					.getPositionName();
			appl.setPosition1Str(position1);
			appl.setPosition2Str(position2);
			appl.setPosition3Str(position3);
		}
		return applicants;
	}

	@Override
	public ApplicantDTO findApplicantById(Integer id) {
		ApplicantDTO applicants = applicantRepository.findApplicantById(id);
		String position1 = positionRepository.findById(
				applicants.getPosition1()).getPositionName();
		String position2 = positionRepository.findById(
				applicants.getPosition2()).getPositionName();
		String position3 = positionRepository.findById(
				applicants.getPosition3()).getPositionName();
		applicants.setPosition1Str(position1);
		applicants.setPosition2Str(position2);
		applicants.setPosition3Str(position3);

		return applicants;
	}

	@Autowired
	private SkillRepositoryImpl skillRepositoryImpl;

	@Autowired
	private EducationRepositoryImpl educationRepositoryImpl;

	@Autowired
	private LanguagesRepositoryImpl languagesRepositoryImpl;

	@Override
	public ApplicationDTO saveEducation(ApplicationDTO applicationDTO) {
		List<Skill> skills = applicationDTO.getSkills();
		for (Skill sk : skills) {

			sk.setId(applicationDTO.getId());
			skillRepositoryImpl.insert(sk);

		}
		List<Education> educations = applicationDTO.getEducations();
		for (Education ed : educations) {

			ed.setId(applicationDTO.getId());
			educationRepositoryImpl.insert(ed);

		}
		List<Languages> languages = applicationDTO.getLanguages();
		for (Languages lang : languages) {

			lang.setId(applicationDTO.getId());
			languagesRepositoryImpl.insert(lang);

		}
		return applicationDTO;
	}

	@Autowired
	private AddressRepositoryImpl addressRepositoryImpl;

	@Override
	public ApplicationDTO saveAddress(ApplicationDTO applicationDTO) {
		List<Address> address = applicationDTO.getAddress();
		for (Address add : address) {
			add.setId(applicationDTO.getId());
			addressRepositoryImpl.insert(add);
		}
		return applicationDTO;
	}
@Autowired
private DepartmentRepositoryImpl departmentRepositoryImpl;
	@Override
	public ApplicationDTO saveApplications(ApplicationDTO applicationDTO) {
		
		
		return applicationDTO;
	}

	@Autowired
	private ExperienceRepositoryImpl experienceRepositoryImpl;
	@Autowired 
	private ReferenceRepositoryImpl referenceRepositoryImpl;
	@Override
	public ApplicationDTO saveExperiences(ApplicationDTO applicationDTO) {
		List<Experience> experiences = applicationDTO.getExperiences();
		for (Experience experience : experiences) {
			experience.setId(applicationDTO.getId());
			experienceRepositoryImpl.insert(experience);

		}
		List<Reference> references = applicationDTO.getReferences();
		for (Reference reference : references) {
			reference.setId(applicationDTO.getId());
			referenceRepositoryImpl.insert(reference);

		}
	return applicationDTO;
	}

}
