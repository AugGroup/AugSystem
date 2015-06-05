package com.aug.controllers;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.services.ApplicantService;

@Controller
@SessionAttributes("applicant")
public class ApplicantController implements Serializable {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ApplicantService applicantService;

	@RequestMapping(value = "/applicant", method = { RequestMethod.GET })
	public String helloPage() {
		return "main_applicant";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",
				Locale.ENGLISH);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));

	}

	// Search by position
	@RequestMapping(value = "/search", method = { RequestMethod.GET })
	public @ResponseBody Object searchByPosition(
			@RequestParam final String position) {
		final List<ApplicantDTO> data = applicantService
				.findByPosition(position);

		return new Object() {
			public List<ApplicantDTO> getData() {
				return data;
			}
		};
	}
	
	//Edit Applicant Informations
		@RequestMapping(value = "/Edit", method = {RequestMethod.POST})
		public @ResponseBody Applicant editApplicantInfo(@RequestBody Applicant applicant,
				@PathVariable Integer id){
			
			final Applicant data = applicantService.findById(id);

			return applicantService.findById(id);
			
		}
	
	// Call Add applicantion.jsp
	
	@RequestMapping(value = "/callCreate", method = {RequestMethod.GET})
	public String callCreate(){
		return "application";
		
	}
	
//	//Save Score
//	@RequestMapping(value = "/saveScore", method= {RequestMethod.POST})
//	public @ResponseBody Applicant userPost(@RequestBody Applicant applicant) throws ParseException{
//		applicantService.create(applicant);
//		Applicant app = applicantService.findById(applicant.getId());
//		return app;
//	}
	
	
	/*
	 * @RequestMapping(value = "/applicant", method= {RequestMethod.POST})
	 * public String login(@RequestParam String userName,@RequestParam String
	 * pass, Model model) { model.addAttribute("userName", userName); return
	 * "applicant"; }
	 */
}
