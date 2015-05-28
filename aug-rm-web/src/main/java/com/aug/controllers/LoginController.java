package com.aug.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping(value="/applicant", method= {RequestMethod.GET})
	public String loginSpring(){
		return "login";
	}
	
	@RequestMapping(value = "/applicant", method= {RequestMethod.POST})
	public String login(@RequestParam String userName,@RequestParam String pass, Model model) {
		model.addAttribute("userName", userName);
		return "applicant";
	}

}
