package com.aug.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping(value="/applicant", method= {RequestMethod.GET})
	public String loginSpring(){
		return "applicant";
	}
	
	@RequestMapping(value = "/applicant", method= {RequestMethod.POST})
	public String login(@RequestParam String userName,@RequestParam String pass, Model model) {
		model.addAttribute("userName", userName);
		return "applicant";
	}

}
