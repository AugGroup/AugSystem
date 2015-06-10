package com.aug.controllers;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.aug.db.services.LoginService;

@Controller
@SessionAttributes("login")
public class LoginController implements Serializable {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String loginSpring() {
		return "login";

	}

	@RequestMapping(value = "/applicant", method = { RequestMethod.POST })
	public String loginSpringPost(Model model) {
		System.out.println("POST pOST POST pOST POST POST POST POSTB  POSTSt");
		// @RequestParam String userName,
		// @RequestParam String password,ModelMap model) {

		// LoginDTO data = loginService.findByUserName(userName);
		// User user =
		// (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// String name = user.getUsername(); //get logged in username

//		Authentication auth = SecurityContextHolder.getContext()
//				.getAuthentication();
//		String name = auth.getName();
//
//		System.out.println("NAMEUSERNAME :" + name);
//		model.addAttribute("name", name);

		return "main_applicant";
	}

}
