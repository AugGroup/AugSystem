package com.aug.controllers;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExceptionControllerPage implements Serializable {

	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/exception/custom", method = { RequestMethod.GET })
	public String errorPageCustom() {
		return "errorPages/errorPageCustom";
	}

	@RequestMapping(value = "/exception/400", method = { RequestMethod.GET })
	public String errorPage400() {
		return "errorPages/errorPage400";
	}

	@RequestMapping(value = "/exception/404", method = { RequestMethod.GET })
	public String errorPage404() {
		return "errorPages/errorPage404";
	}

	@RequestMapping(value = "/exception/415", method = { RequestMethod.GET })
	public String errorPage415() {
		return "errorPages/errorPage415";
	}

	@RequestMapping(value = "/exception/500", method = { RequestMethod.GET })
	public String errorPage500() {
		return "errorPages/errorPage500";
	}

}
