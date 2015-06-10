package com.aug.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.entities.Department;
import com.aug.db.entities.Position;
import com.aug.db.services.ApplicantService;
import com.aug.db.services.DepartmentService;
import com.aug.db.services.PositionService;

@Controller
public class ApplicationController {

    private static Logger LOGGER = LoggerFactory.getLogger(ApplicationController.class);

	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PositionService positionService;
	@Autowired
	private ApplicantService applicantService;

	@InitBinder public void InitBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	  
	  }
	
	@RequestMapping(value = "/application", method = { RequestMethod.GET })
	public String application(Model model) {
        LOGGER.info("**** Welcome to Application Controller ****");
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		model.addAttribute("name", name);
        return "application";

	}
	@RequestMapping(value = "/save",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO save(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		Applicant applicant = new Applicant(); 
		
		applicantService.create(applicant.fromApplicationDTO(applicant, applicationDTO));
		
		
		return applicationDTO;
		
		
		
	}
	@RequestMapping(value = "/informations", method = { RequestMethod.GET })
	public String informations() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "informations";

	}
	@RequestMapping(value = "/saveinformations",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveInformations(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		Applicant applicant = new Applicant(); 
		
		applicantService.create(applicant.fromApplicationDTO(applicant, applicationDTO));
		
		
		return applicationDTO;
		
		
		
	}
	@RequestMapping(value = "/saveeducations",method ={ RequestMethod.POST })
	public @ResponseBody ApplicationDTO saveEducations(@RequestBody ApplicationDTO applicationDTO) throws ParseException{
		Applicant applicant = new Applicant(); 
		
		applicantService.create(applicant.fromApplicationDTO(applicant, applicationDTO));
		
		
		return applicationDTO;
		
		
		
	}

	@RequestMapping(value = "/applications", method = { RequestMethod.GET })
	public String applications() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "applications";

	}

	@RequestMapping(value = "/address", method = { RequestMethod.GET })
	public String address() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "address";

	}
	@RequestMapping(value = "/educations", method = { RequestMethod.GET })
	public String educations() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "educations";

	}
	@RequestMapping(value = "/experiences", method = { RequestMethod.GET })
	public String experiences() {
        LOGGER.info("**** Welcome to Application Controller ****");
        return "experiences";

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
