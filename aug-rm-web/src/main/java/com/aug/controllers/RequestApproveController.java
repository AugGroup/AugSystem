/*
 */
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.db.entities.AugRequest;
import com.aug.db.services.AugRequestService;

/**
 *
 * @author Supannika Pattanodom
 */
@Controller
public class RequestApproveController implements Serializable {

	@Autowired
	AugRequestService augRequestService;

	@RequestMapping(value = "/approve", method = { RequestMethod.GET })
	public String listRequest() {

		return "requestApprove";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",
				Locale.ENGLISH);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));

	}

	@RequestMapping(value = "/findAllApprove", method = { RequestMethod.GET })
	public @ResponseBody Object findAllApprove() {
		return new Object() {
			public List<AugRequest> data = augRequestService.findAll();
		};
	}

}
