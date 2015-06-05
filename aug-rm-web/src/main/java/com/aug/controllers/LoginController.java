package com.aug.controllers;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aug.db.entities.Applicant;
import com.aug.db.entities.Login;
import com.aug.db.repositories.ApplicantRepository;
import com.aug.db.repositories.LoginRepository;

@Controller
@SessionAttributes("login")
public class LoginController implements Serializable{
	
	@Autowired
	private LoginRepository loginRepository;
	
	@Autowired
	private ApplicantRepository applicantRepository;
	
	@RequestMapping(value="/applicant/login", method= {RequestMethod.GET})
	public String loginSpring(){
		System.out.println("GET GET GET GET GET GET GET GET GET");
		List<Login> loginList = loginRepository.findAll();
		for(Login logins : loginList){
			System.out.println(logins.getUserName()+","+logins.getPassword());
		}
		List<Applicant> appList = applicantRepository.findAll();
		for(Applicant logins : appList){
			System.out.println(logins.getFirstNameEN());
		}
		return "login";

	}

	@RequestMapping(value = "/applicant/login", method= {RequestMethod.POST})
	public String loginSpringPost(@RequestParam String userName,@RequestParam String password, Model model) {
		model.addAttribute("userName", userName);
//		model.addAttribute("password",password);
		System.out.println("POST POST POST POST POST POST POST POST");
//		String result="false";
		List<Login> loginList = loginRepository.findAll();
		for(Login logins : loginList){
			System.out.println(logins.getUserName()+","+logins.getPassword());
		}
		List<Applicant> appList = applicantRepository.findAll();
		for(Applicant logins : appList){
			System.out.println(logins.getFirstNameEN());
		}
		
//		if(password==password){
//			result="true";
//		}
		return "login";
	}

}
