package com.aug.db.services;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.entities.Address;
import com.aug.db.entities.Applicant;
import com.aug.db.entities.Education;
import com.aug.db.entities.Experience;
import com.aug.db.entities.Family;
import com.aug.db.entities.Languages;
import com.aug.db.entities.Position;
import com.aug.db.entities.Reference;
import com.aug.db.entities.Skill;
import com.aug.db.repositories.AddressRepository;
import com.aug.db.repositories.ApplicantRepository;
import com.aug.db.repositories.EducationRepository;
import com.aug.db.repositories.ExperienceRepository;
import com.aug.db.repositories.FamilyRepository;
import com.aug.db.repositories.LanguagesRepository;
import com.aug.db.repositories.PositionRepository;
import com.aug.db.repositories.ReferenceRepository;
import com.aug.db.repositories.SkillRepository;

@Service(value = "applicantService")
@Transactional
public class ApplicantServiceImpl implements ApplicantService {

	@Autowired
	private ApplicantRepository applicantRepository;
	@Autowired
	private PositionRepository positionRepository;
	@Autowired
	private FamilyRepository familyRepository;
	@Autowired
	private SkillRepository skillRepository;
	@Autowired
	private EducationRepository educationRepository;
	@Autowired
	private LanguagesRepository languagesRepository;	
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
	public ApplicationDTO saveEducation(ApplicationDTO applicationDTO) {
		List<Skill> skills = applicationDTO.getSkills();
		for (Skill sk : skills) {

			sk.setId(applicationDTO.getId());
			skillRepository.insert(sk);

		}
		List<Education> educations = applicationDTO.getEducations();
		for (Education ed : educations) {

			ed.setId(applicationDTO.getId());
			educationRepository.insert(ed);

		}
		List<Languages> languages = applicationDTO.getLanguages();
		for (Languages lang : languages) {

			lang.setId(applicationDTO.getId());
			languagesRepository.insert(lang);

		}
		return applicationDTO;
	}

	

	@Override
	public ApplicationDTO saveAddress(ApplicationDTO applicationDTO) {
		List<Address> address = applicationDTO.getAddress();
		for (Address add : address) {
			add.setId(applicationDTO.getId());
			addressRepository.insert(add);
		}
		return applicationDTO;
	}

	@Override
	public ApplicationDTO saveApplications(ApplicationDTO applicationDTO) {

		Position position1 = applicationDTO.getPosition1();
		positionRepository.insert(position1);
		Position position2 = applicationDTO.getPosition2();
		positionRepository.insert(position2);
		Position position3 = applicationDTO.getPosition3();
		positionRepository.insert(position3);
		return applicationDTO;
	}

	@Autowired
	private ExperienceRepository experienceRepository;
	@Autowired
	private ReferenceRepository referenceRepository;

	@Override
	public ApplicationDTO saveExperiences(ApplicationDTO applicationDTO) {
		List<Experience> experiences = applicationDTO.getExperiences();
		for (Experience experience : experiences) {
			experience.setId(applicationDTO.getId());
			experienceRepository.insert(experience);

		}
		List<Reference> references = applicationDTO.getReferences();
		for (Reference reference : references) {
			reference.setId(applicationDTO.getId());
			referenceRepository.insert(reference);

		}
		return applicationDTO;
	}

	@Override
	public ApplicationDTO saveInformations(ApplicationDTO applicationDTO) {
		Applicant applicant = new Applicant();
		try {
			applicant.setTrackingStatus("Waiting for consider");
			applicantRepository.insert(applicant.fromApplicationDTO(applicant,
					applicationDTO));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Family> families = applicationDTO.getFamilies();
		for (Family family : families) {
			family.setId(applicant.getId());
			familyRepository.insert(family);

		}
		applicationDTO.setId(applicant.getId());
		return applicationDTO;
	}

	@Override
	public List<ReportApplicantDTO> reportApplicant() {
		return applicantRepository.reportApplicant();
	}

}
