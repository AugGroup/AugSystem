package com.aug.controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.CertificatedDTO;
import com.aug.db.dto.EducationDTO;
import com.aug.db.dto.ExperienceDTO;
import com.aug.db.dto.FamilyDTO;
import com.aug.db.dto.LanguagesDTO;
import com.aug.db.dto.ReferenceDTO;
import com.aug.db.entities.Address;
import com.aug.db.entities.Certificate;
import com.aug.db.entities.Department;
import com.aug.db.entities.Education;
import com.aug.db.entities.Experience;
import com.aug.db.entities.Family;
import com.aug.db.entities.Languages;
import com.aug.db.entities.Position;
import com.aug.db.entities.Reference;
import com.aug.db.entities.Skill;
import com.aug.db.dto.SkillDTO;
import com.aug.db.services.AddressService;
import com.aug.db.services.ApplicantService;
import com.aug.db.services.CertificateService;
import com.aug.db.services.DepartmentService;
import com.aug.db.services.EducationService;
import com.aug.db.services.ExperienceService;
import com.aug.db.services.FamilyService;
import com.aug.db.services.LanguagesService;
import com.aug.db.services.PositionService;
import com.aug.services.UploadService;
import com.aug.db.services.ReferenceService;
import com.aug.db.services.SkillService;

@Controller
public class ApplicationController {

    private static Logger LOGGER = LoggerFactory.getLogger(ApplicationController.class);

	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private ApplicantService applicantService;
	@Autowired
	private UploadService uploadService;
	@Autowired
	private ReferenceService referenceService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private ExperienceService experienceService;
	@Autowired
	private EducationService educationService;
	@Autowired
	private SkillService skillService;
	@Autowired
	private LanguagesService languagesService;
	@Autowired
	private CertificateService certificatedService;
	@Autowired
	private FamilyService familyService;
	
	@InitBinder 
	public void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	  
	  }

	@RequestMapping(value = "/applicationMenu", method = { RequestMethod.GET })
	public String applicationMenu(Model model) {
        LOGGER.info("**** Welcome to Application Controller ****");
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		model.addAttribute("name", name);
        return "applicationMenu";

	}
	@RequestMapping(value = "/upload")
	public @ResponseBody String upload(MultipartHttpServletRequest request)throws Exception {
	    Iterator<String> itrator = request.getFileNames();
        MultipartFile multiFile = request.getFile(itrator.next());			
			try {
				uploadService.upload("Appilcant", multiFile.getOriginalFilename(), multiFile);
			} catch (RuntimeException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	
		return "SUCCESS";
	}
	
	//////////////////        SAVE METHOD        /////////////////////
	
	@RequestMapping(value = "/informations", method = { RequestMethod.GET })
	public String informations() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "informations";

	}
	@RequestMapping(value = "/saveInformations",method ={ RequestMethod.POST })
	public String saveInformations(@ModelAttribute ApplicationDTO applicationDTO,Model model) throws ParseException{
		
		applicantService.saveInformations(applicationDTO);
		model.addAttribute("id",applicationDTO.getId());
		return "redirect:/informations";
	}
	
	//////////////////        LINK PAGE       ///////////////////////////
	
	@RequestMapping(value = "/address/{id}", method = { RequestMethod.GET })
	public String address(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "address";

	}
	
	@RequestMapping(value = "/family/{id}", method = { RequestMethod.GET })
	public String family(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "family";

	}
	
	@RequestMapping(value = "/educations/{id}", method = { RequestMethod.GET })
	public String educations(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "educations";

	}
	
	@RequestMapping(value = "/certificates/{id}", method = { RequestMethod.GET })
	public String certificate(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "certificate";

	}
	
	@RequestMapping(value = "/skills/{id}", method = { RequestMethod.GET })
	public String skills(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "skills";

	}
	
	@RequestMapping(value = "/languages/{id}", method = { RequestMethod.GET })
	public String languages(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "languages";

	}
	
	@RequestMapping(value = "/references/{id}", method = { RequestMethod.GET })
	public String references(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "references";

	}
	
	@RequestMapping(value = "/experiences/{id}", method = { RequestMethod.GET })
	public String experiences(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "experiences";

	}

    //////////////////        UPDATE METHOD        /////////////////////
	
	// Search Every Class By Id For Show In Text Box
	
	@RequestMapping(value = "/findByIdApplicants/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicationDTO findByIdApplications(@RequestBody ApplicationDTO applicationDTO,@PathVariable Integer id) {
		applicationDTO = applicantService.findApplicationById(id);
		return applicationDTO;
	}
	
	@RequestMapping(value = "/findAddressId/{id}", method = { RequestMethod.POST })
	public @ResponseBody AddressDTO findAddress(@PathVariable Integer id) {
		return addressService.findAddress(id);
	}
	
	@RequestMapping(value = "/findFamilyId/{id}", method = { RequestMethod.POST })
	public @ResponseBody FamilyDTO findFamily(@PathVariable Integer id) {
		return familyService.findFamily(id);
	}
	
	@RequestMapping(value = "/findEducationId/{id}", method = { RequestMethod.POST })
	public @ResponseBody EducationDTO findEducation(@PathVariable Integer id) {
		return educationService.findEducation(id);
	}
	
	@RequestMapping(value = "/findCertificateId/{id}", method = { RequestMethod.POST })
	public @ResponseBody CertificatedDTO findCertificated(@PathVariable Integer id) {
		return certificatedService.findCertificate(id);
	}
	
	@RequestMapping(value = "/findSkillId/{id}", method = { RequestMethod.POST })
	public @ResponseBody SkillDTO findSkill(@PathVariable Integer id) {
		return skillService.findSkill(id);
	}
	
	@RequestMapping(value = "/findLanguagesId/{id}", method = { RequestMethod.POST })
	public @ResponseBody LanguagesDTO findLanguages(@PathVariable Integer id) {
		return languagesService.findLanguages(id);
	}
	
	@RequestMapping(value = "/findReferenceId/{id}", method = { RequestMethod.POST })
	public @ResponseBody ReferenceDTO findReference(@PathVariable Integer id) {
		return referenceService.findReference(id);
	}
	
	@RequestMapping(value = "/findExperienceId/{id}", method = { RequestMethod.POST })
	public @ResponseBody ExperienceDTO findExperience(@PathVariable Integer id) {
		return experienceService.findExperience(id);
	}
	
	//Get Data For Show In DataTable
	
	@RequestMapping(value = "/findByIdAddress/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdAddress(@PathVariable Integer id) {
		final List<AddressDTO> list= addressService.findAddressById(id);
		for(AddressDTO address : list){
			System.out.println(address.getAddressType());
			System.out.println(address.getHouseNo());
		}
		return new Object() {
			public List<AddressDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdFamily/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdFamily(@RequestBody FamilyDTO familyDTO,@PathVariable Integer id) {
		final List<FamilyDTO> list= familyService.findFamilyById(id);
		 
		return new Object() {
			public List<FamilyDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdEducation/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdEducation(@PathVariable Integer id) {
		 final List<EducationDTO> list = educationService.findEducationById(id);
		 
		return new Object() {
			public List<EducationDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdCertificate/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdCertificaten(@PathVariable Integer id) {
		 final List<CertificatedDTO> list = certificatedService.findCertificateById(id);
		 
		return new Object() {
			public List<CertificatedDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdSkill/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdSkill(@PathVariable Integer id) {
		 final List<SkillDTO> list = skillService.findSkillById(id);
		 
		return new Object() {
			public List<SkillDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdLanguages/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdLanguages(@PathVariable Integer id) {
		 final List<LanguagesDTO> list = languagesService.findLanguagesById(id);
		 
		return new Object() {
			public List<LanguagesDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdReference/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdReference(@PathVariable Integer id) {
		 final List<ReferenceDTO> list = referenceService.findReferenceById(id);
		 
		return new Object() {
			public List<ReferenceDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdExperience/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdExperience(@RequestBody ExperienceDTO experienceDTO,@PathVariable Integer id) {
		 final List<ExperienceDTO> list= experienceService.findExperienceById(id);
		 
		return new Object() {
			public List<ExperienceDTO> getData() {
				return list;
			}
		};
	}
	
	//Update Data In DataTable
	
	@RequestMapping(value = "/updateAddress/{id}", method = { RequestMethod.POST })
	public @ResponseBody AddressDTO updateAddress(@RequestBody AddressDTO addressDTO, @PathVariable Integer id) {
		Address address = addressService.findById(addressDTO.getId());
		address.setAddressType(addressDTO.getAddressType());
		address.setHouseNo(addressDTO.getHouseNo());
		address.setRoad(addressDTO.getRoad());
		address.setDistrict(addressDTO.getDistrict());
		address.setSubDistrict(addressDTO.getSubDistrict());
		address.setProvince(addressDTO.getProvince());
		address.setZipcode(addressDTO.getZipcode());
		
		addressService.update(address);
		
		return addressDTO;
	}
	
	@RequestMapping(value = "/updateFamily/{id}", method = { RequestMethod.POST })
	public @ResponseBody FamilyDTO updateFamily(@RequestBody FamilyDTO familyDTO, @PathVariable Integer id) {
		Family family = familyService.findById(familyDTO.getId());
		family.setId(familyDTO.getId());
		family.setAddress(familyDTO.getAddress());
		family.setName(familyDTO.getName());
		family.setOccupation(familyDTO.getOccupation());
		family.setPositionFamily(familyDTO.getPositionFamily());
		family.setRelation(familyDTO.getRelation());
		
		familyService.update(family);
		
		return familyDTO;
	}
	
	@RequestMapping(value = "/updateEducations/{id}", method = { RequestMethod.POST })
	public @ResponseBody EducationDTO updateEducations(@RequestBody EducationDTO educationDTO, @PathVariable Integer id) {
		Education education = educationService.findById(educationDTO.getId());
		education.setId(educationDTO.getId());
		education.setDegree(educationDTO.getDegree());
		education.setFaculty(educationDTO.getFaculty());
		education.setGpa(educationDTO.getGpa());
		education.setMajor(educationDTO.getMajor());
		education.setSchoolName(educationDTO.getSchoolName());
		education.setYearsOfGraduate(educationDTO.getYearsOfGraduate());
		
		educationService.update(education);
		
		return educationDTO;
	}
	
	@RequestMapping(value = "/updateCertificates/{id}", method = { RequestMethod.POST })
	public @ResponseBody CertificatedDTO updateCertificates(@RequestBody CertificatedDTO certificateDTO, @PathVariable Integer id) {
		Certificate certificate = certificatedService.findById(certificateDTO.getId());
		certificate.setId(certificateDTO.getId());
		certificate.setCertificateName(certificateDTO.getCertificateName());
		
		certificatedService.update(certificate);
		
		return certificateDTO;
	}
	
	@RequestMapping(value = "/updateSkills/{id}", method = { RequestMethod.POST })
	public @ResponseBody SkillDTO updateSkills(@RequestBody SkillDTO skillDTO, @PathVariable Integer id) {
		Skill skill = skillService.findById(skillDTO.getId());
		skill.setId(skillDTO.getId());
		skill.setSkillDetail(skillDTO.getSkillDetail());
		
		skillService.update(skill);
		
		return skillDTO;
	}
	
	@RequestMapping(value = "/updateLanguages/{id}", method = { RequestMethod.POST })
	public @ResponseBody LanguagesDTO updateLanguages(@RequestBody LanguagesDTO languagesDTO, @PathVariable Integer id) {
		Languages languages = languagesService.findById(languagesDTO.getId());
		languages.setId(languagesDTO.getId());
		languages.setLanguagesName(languagesDTO.getLanguagesName());
		languages.setReading(languagesDTO.getReading());
		languages.setSpeaking(languagesDTO.getSpeaking());
		languages.setUnderstanding(languagesDTO.getUnderstanding());
		languages.setWriting(languagesDTO.getWriting());
		
		languagesService.update(languages);
		
		return languagesDTO;
	}
	
	@RequestMapping(value = "/updateReferences/{id}", method = { RequestMethod.POST })
	public @ResponseBody ReferenceDTO updateReferences(@RequestBody ReferenceDTO referenceDTO, @PathVariable Integer id) {
		Reference reference = referenceService.findById(referenceDTO.getId());
		reference.setId(referenceDTO.getId());
		reference.setCompleteAddress(referenceDTO.getCompleteAddress());
		reference.setFullName(referenceDTO.getFullName());
		reference.setOccupation(referenceDTO.getOccupation());
		reference.setTel(referenceDTO.getTel());
		
		referenceService.update(reference);
		
		return referenceDTO;
	}
	
	@RequestMapping(value = "/updateExperience/{id}", method = { RequestMethod.POST })
	public @ResponseBody ExperienceDTO updateExperience(@RequestBody ExperienceDTO experienceDTO, @PathVariable Integer id) {
		Experience experience = experienceService.findById(experienceDTO.getId());
		experience.setId(experienceDTO.getId());
		experience.setAddress(experienceDTO.getAddress());
		experience.setDescription(experienceDTO.getDescription());
		experience.setEmployerName(experienceDTO.getEmployerName());
		experience.setFromDate(experienceDTO.getFromDate());
		experience.setToDate(experienceDTO.getToDate());
		experience.setPosition(experienceDTO.getPosition());
		experience.setPositionOfEmployer(experienceDTO.getPositionOfEmployer());
		experience.setReason(experienceDTO.getReason());
		experience.setSalary(experienceDTO.getSalary());
		experience.setSupervisor(experienceDTO.getSupervisor());
		experience.setTypeOfBusiness(experienceDTO.getTypeOfBusiness());
			
		experienceService.update(experience);
			
		return experienceDTO;
	}
	
	////////////////// DELETE METHOD /////////////////////
	
	@RequestMapping(value = "/deleteEducation/{id}", method = RequestMethod.POST)
	public @ResponseBody String delesteEducation(@PathVariable("id") Integer id) {

		educationService.deleteById(id);
		return "success";
	}
	
	@RequestMapping(value = "/deleteSkill/{id}", method = RequestMethod.POST)
	public @ResponseBody String delesteSkill(@PathVariable("id") Integer id) {

		skillService.deleteById(id);
		return "success";
	}
	
	@RequestMapping(value = "/deleteLanguages/{id}", method = RequestMethod.POST)
	public @ResponseBody String delesteLanguages(@PathVariable("id") Integer id) {

		languagesService.deleteById(id);
		return "success";
	}

	@ModelAttribute("departments")
	@Transactional
	public List<Department> departmentList() {
		System.out.println(departmentService.findAll());
		return departmentService.findAll();
	}

	@ModelAttribute("positions")
	@Transactional
	public List<Position> positionList() {
		System.out.println(positionService.findAll());
		return positionService.findAll();
	}

}
