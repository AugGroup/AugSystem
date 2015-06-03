package com.aug.controllers;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login")
public class LoginController implements Serializable{

	@RequestMapping(value="/applicant", method= {RequestMethod.GET})
	public String loginSpring(){
		return "login";

	}

	@RequestMapping(value = "/applicant", method= {RequestMethod.POST})
	public String loginSpringPost(@RequestParam String userName, Model model) {
		model.addAttribute("userName", userName);
		return "applicant";
	}

}
