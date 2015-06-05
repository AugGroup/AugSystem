package com.aug.controllers;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aug.db.entities.Applicant;
import com.aug.db.entities.Login;
import com.aug.db.repositories.ApplicantRepository;
import com.aug.db.repositories.LoginRepository;
import com.aug.db.repositories.LoginRepositoryImpl;
import com.aug.db.services.LoginService;

@Controller
@SessionAttributes("login")
public class LoginController implements Serializable {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/applicant/login", method = { RequestMethod.GET })
	public String loginSpring() {
		return "login";

	}

//	@RequestMapping(value = "/applicant", method = { RequestMethod.POST })
//	public String loginSpringPost(@ModelAttribute String userName,
//			@ModelAttribute String password, Model model) {
////		model.addAttribute("userName", userName);
////		model.addAttribute("password", password);
////		if (!userName.trim().isEmpty()) {
////			loginService.findByUserName(userName, password);
////			return "main_applicant";
////		}
//		return "main_applicant";
//	}

}
