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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.entities.Department;
import com.aug.db.entities.Position;
import com.aug.db.services.ApplicantService;
import com.aug.db.services.DepartmentService;
import com.aug.db.services.PositionService;
import com.aug.services.UploadService;

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
	
	@InitBinder public void InitBinder(WebDataBinder binder){
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
		
	}*/

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
