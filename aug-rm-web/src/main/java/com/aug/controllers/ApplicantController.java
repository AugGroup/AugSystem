package com.aug.controllers;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String helloPage(Model model) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		model.addAttribute("name", name);
		return "main_applicant";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",Locale.ENGLISH);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

	}

	// Search by position
	@RequestMapping(value = "/searchByPosition", method = { RequestMethod.GET })
	public @ResponseBody Object searchByPosition(
			@RequestParam final String position) {
		final List<ApplicantDTO> data = applicantService.findByPosition(position);

		return new Object() {
			public List<ApplicantDTO> getData() {
				return data;
			}
		};
	}

	// Search All
	@RequestMapping(value = "/search", method = { RequestMethod.GET })
	public @ResponseBody Object searchAllApplicant() {
		final List<ApplicantDTO> data = applicantService.findAllApplicant();

		return new Object() {
			public List<ApplicantDTO> getData() {
				return data;
			}
		};
	}

	// Update
	// Seach Applicant By Id
	@RequestMapping(value = "/findById/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO findById(@PathVariable Integer id) {

		return applicantService.findApplicantById(id);
	}
	
	//Edit Applicant Score
	@RequestMapping(value = "/score/update/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO updateUser(@RequestBody ApplicantDTO applicantDTO,
			@PathVariable Integer id) throws ParseException {
		
		Applicant applicant = applicantService.findById(applicantDTO.getId());
		applicant.setScore(applicantDTO.getScore());
		applicant.setTechScore(applicantDTO.getTechScore());
		applicant.setAttitudeHome(applicantDTO.getAttitudeHome());
		applicant.setAttitudeOffice(applicantDTO.getAttitudeOffice());
		applicant.setTrackingStatus(applicantDTO.getTrackingStatus());
		
		applicantService.update(applicant);
		
		
		return applicantDTO;

	}
}
