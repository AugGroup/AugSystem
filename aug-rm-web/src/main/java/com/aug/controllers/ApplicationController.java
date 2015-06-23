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
import com.aug.db.dto.EducationDTO;
import com.aug.db.dto.ExperienceDTO;
import com.aug.db.dto.LanguagesDTO;
import com.aug.db.dto.ReferenceDTO;
import com.aug.db.entities.Department;
import com.aug.db.entities.Position;
import com.aug.db.repositories.AddressRepository;
import com.aug.db.repositories.ExperienceRepository;
import com.aug.db.dto.SkillDTO;
import com.aug.db.services.ApplicantService;
import com.aug.db.services.DepartmentService;
import com.aug.db.services.EducationService;
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
	private AddressRepository addressRepository;
	@Autowired
	private ExperienceRepository experienceRepository;
	@Autowired
	private EducationService educationService;
	@Autowired
	private SkillService skillService;
	@Autowired
	private LanguagesService languagesService;
	
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
	
	@RequestMapping(value = "/address", method = { RequestMethod.GET })
	public String address(Model model) {
        model.addAttribute("id",2);
        return "address";

	}
	@RequestMapping(value = "/saveAddress",method ={ RequestMethod.POST })
	public  ApplicationDTO saveAddress(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveAddress(applicationDTO);
		return applicationDTO;
	}
	@RequestMapping(value = "/family", method = { RequestMethod.GET })
	public String family(Model model) {
        model.addAttribute("id",2);
        return "family";

	}
	@RequestMapping(value = "/saveFamily",method ={ RequestMethod.POST })
	public  ApplicationDTO saveFamily(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveFamily(applicationDTO);
		return applicationDTO;
	}
	
	@RequestMapping(value = "/educations", method = { RequestMethod.GET })
	public String educations(Model model) {
		model.addAttribute("id",2);
        return "educations";

	}
	@RequestMapping(value = "/saveEducations",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveEducations(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveEducation(applicationDTO);
		return applicationDTO;
		
	}
	@RequestMapping(value = "/experiences", method = { RequestMethod.GET })
	public String experiences(Model model) {
		
        model.addAttribute("id",2);
        return "experiences";

	}
	@RequestMapping(value = "/saveExperiences",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveExperiences(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveExperiences(applicationDTO);
		return applicationDTO;
		
	}
	@RequestMapping(value = "/certificates", method = { RequestMethod.GET })
	public String certificate(Model model) {
		
        model.addAttribute("id",2);
        return "certificate";

	}
	@RequestMapping(value = "/saveCertificate",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveCertificates(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveCertificate(applicationDTO);
		return applicationDTO;
		
	}
	@RequestMapping(value = "/languages", method = { RequestMethod.GET })
	public String languages(Model model) {
		
        model.addAttribute("id",2);
        return "languages";

	}
	@RequestMapping(value = "/saveLanguages",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveLanguages(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveLanguages(applicationDTO);
		return applicationDTO;
		
	}
	@RequestMapping(value = "/references", method = { RequestMethod.GET })
	public String references(Model model) {
		
        model.addAttribute("id",2);
        return "references";

	}
	@RequestMapping(value = "/saveReferences",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveReferences(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveReferences(applicationDTO);
		return applicationDTO;
		
	}
	@RequestMapping(value = "/skills", method = { RequestMethod.GET })
	public String skills(Model model) {
		
        model.addAttribute("id",2);
        return "skills";

	}
	@RequestMapping(value = "/saveSkills",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveSkills(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveSkills(applicationDTO);
		return applicationDTO;
		
	}

	/*
	@RequestMapping(value = "/informations", method = { RequestMethod.GET })
	public String informations() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "informations";

	}
	@RequestMapping(value = "/saveInformations",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveInformations(@RequestBody ApplicationDTO applicationDTO,Model model) throws ParseException{
		
		applicantService.saveInformations(applicationDTO);
		model.addAttribute("id",applicationDTO.getId());
		return applicationDTO;
	}

	
	@RequestMapping(value = "/applications", method = { RequestMethod.GET })
	public String applications(Model model) {
        LOGGER.info("**** Welcome to Application Controller ****");
//        
//        System.out.println("PATHVARIABLE ID : "+id);
//        System.out.println("ID : "+keepId);
       model.addAttribute("id",2);
        return "applications";
	}
	@RequestMapping(value = "/saveApplications",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveApplications(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveApplications(applicationDTO);
		return applicationDTO;
	}
	@RequestMapping(value = "/address", method = { RequestMethod.GET })
	public String address(Model model) {
        model.addAttribute("id",2);
        return "address";

	}
	@RequestMapping(value = "/saveAddress",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveAddress(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveAddress(applicationDTO);
		return applicationDTO;
	}
	@RequestMapping(value = "/educations/{id}", method = { RequestMethod.GET })
	public String educations(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "educations";

	}
	@RequestMapping(value = "/saveEducations",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveEducations(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveEducation(applicationDTO);
		return applicationDTO;
		
	}
	@RequestMapping(value = "/experiences/{id}", method = { RequestMethod.GET })
	public String experiences(@PathVariable Integer id,Model model) {
        model.addAttribute("id",id);
        return "experiences";

	}
	@RequestMapping(value = "/saveExperiences",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveExperiences(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		applicantService.saveExperiences(applicationDTO);
		return applicationDTO;

	}*/
	
	
	
	// Update
	// Search Applicant By Id
	@RequestMapping(value = "/findByIdApplicants/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicationDTO findByIdApplications(@RequestBody ApplicationDTO applicationDTO,@PathVariable Integer id) {
		applicationDTO = applicantService.findApplicationById(id);
		return applicationDTO;
	}
	
	@RequestMapping(value = "/findAddressId/{id}", method = { RequestMethod.POST })
	public @ResponseBody AddressDTO findAddress(@PathVariable Integer id) {
		return addressRepository.findByAddressId(id);
	}
	
	@RequestMapping(value = "/findExperienceId/{id}", method = { RequestMethod.POST })
	public @ResponseBody ExperienceDTO findExperience(@PathVariable Integer id) {
		return experienceRepository.findExperience(id);
	}
	
	@RequestMapping(value = "/findEducationId/{id}", method = { RequestMethod.POST })
	public @ResponseBody EducationDTO findEducation(@PathVariable Integer id) {
		return educationService.findEducation(id);
	}
	
	@RequestMapping(value = "/findSkillId/{id}", method = { RequestMethod.POST })
	public @ResponseBody SkillDTO findSkill(@PathVariable Integer id) {
		return skillService.findSkill(id);
	}
	
	@RequestMapping(value = "/findLanguagesId/{id}", method = { RequestMethod.POST })
	public @ResponseBody LanguagesDTO findLanguages(@PathVariable Integer id) {
		return languagesService.findLanguages(id);
	}
	
	@RequestMapping(value = "/findByIdAddress/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdApplication(@PathVariable Integer id) {
		 final List<AddressDTO> list= addressRepository.findAddressById(id);
		 AddressDTO add = new AddressDTO();
		 for(AddressDTO ad : list){
			 add.setAddressType(ad.getAddressType());
			 add.setHouseNo(ad.getHouseNo());
			 add.setRoad(ad.getRoad());
			 add.setDistrict(ad.getDistrict());
			 add.setSubDistrict(ad.getSubDistrict());
			 add.setProvince(ad.getProvince());
			 add.setZipcode(ad.getZipcode());
		 }
		 
		return new Object() {
			public List<AddressDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdExperience/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdExperience(@PathVariable Integer id) {
		 final List<ExperienceDTO> list= experienceRepository.findExperienceById(id);
		 ExperienceDTO expDto = new ExperienceDTO();
			for(ExperienceDTO exp : list){
				expDto.setId(exp.getId());
				expDto.setAddress(exp.getAddress());
				expDto.setDescription(exp.getDescription());
				expDto.setEmployerName(exp.getEmployerName());
				expDto.setFromDate(exp.getFromDate());
				expDto.setToDate(exp.getToDate());
				expDto.setPosition(exp.getPosition());
				expDto.setPositionOfEmployer(exp.getPositionOfEmployer());
				expDto.setReason(exp.getReason());
				expDto.setSalary(exp.getSalary());
				expDto.setSupervisor(exp.getSupervisor());
				expDto.setTypeOfBusiness(exp.getTypeOfBusiness());
			}
		 
		return new Object() {
			public List<ExperienceDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdReference/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdReference(@PathVariable Integer id) {
		 final List<ReferenceDTO> list = referenceService.findReferenceById(id);
		 ReferenceDTO refDto = new ReferenceDTO();
		 for(ReferenceDTO ref : list){
			 refDto.setId(ref.getId());
			 refDto.setCompleteAddress(ref.getCompleteAddress());
			 refDto.setFullName(ref.getFullName());
			 refDto.setOccupation(ref.getOccupation());
			 refDto.setTel(ref.getTel());
		 }
		 
		return new Object() {
			public List<ReferenceDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdEducation/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdEducation(@PathVariable Integer id) {
		 final List<EducationDTO> list = educationService.findEducationById(id);
		 EducationDTO edDto = new EducationDTO();
		 for(EducationDTO ed : list){
			 edDto.setId(ed.getId());
			 edDto.setDegree(ed.getDegree());
			 edDto.setFaculty(ed.getFaculty());
			 edDto.setGpa(ed.getGpa());
			 edDto.setMajor(ed.getMajor());
			 edDto.setSchoolName(ed.getSchoolName());
			 edDto.setYearsOfGraduate(ed.getYearsOfGraduate());
		 }
		 
		return new Object() {
			public List<EducationDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdSkill/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdSkill(@PathVariable Integer id) {
		 final List<SkillDTO> list = skillService.findSkillById(id);
		 SkillDTO skillDto = new SkillDTO();
		 for(SkillDTO skill : list){
			 skillDto.setId(skill.getId());
			 skillDto.setSkillDetail(skill.getSkillDetail());
		 }
		 
		return new Object() {
			public List<SkillDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/findByIdLanguages/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findByIdLanguages(@PathVariable Integer id) {
		 final List<LanguagesDTO> list = languagesService.findLanguagesById(id);
		 LanguagesDTO langDto = new LanguagesDTO();
		 for(LanguagesDTO lang : list){
			 langDto.setId(lang.getId());
			 langDto.setLanguagesName(lang.getLanguagesName());
			 langDto.setReading(lang.getReading());
			 langDto.setSpeaking(lang.getSpeaking());
			 langDto.setUnderstanding(lang.getUnderstanding());
			 langDto.setWriting(lang.getWriting());
		 }
		 
		return new Object() {
			public List<LanguagesDTO> getData() {
				return list;
			}
		};
	}
	
	@RequestMapping(value = "/applications/{id}", method = { RequestMethod.GET })
	public String applications(@PathVariable Integer id,Model model) {
		System.out.println("APPLICANT_ID : " + id);
		model.addAttribute("id",id);
        return "applications";

	}
	
	@RequestMapping(value = "/address/{id}", method = { RequestMethod.GET })
	public String informations(@PathVariable Integer id,Model model) {
		model.addAttribute("id",id);
        return "address";

	}
	
	@RequestMapping(value = "/address/{id}", method = { RequestMethod.POST })
	public @ResponseBody Object findIdAddress(@RequestBody AddressDTO addressDTO,@PathVariable Integer id) {
		System.out.println("ADDRESS : " + id);
		System.out.println("ADDRESS2 ADDRESS2 ADDRESS2 ADDRESS2");
		
		final List<AddressDTO> data = addressRepository.findAddressById(id);
		return new Object() {
			public List<AddressDTO> getData() {
				return data;
			}
		};
	}
	
	
	// delete method
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
