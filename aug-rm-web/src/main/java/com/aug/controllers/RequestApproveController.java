/*
 */
package com.aug.controllers;

import java.io.Serializable;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.db.dto.AugRequestDTO;
import com.aug.db.entities.AugRequest;
import com.aug.db.entities.Position;
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

	@RequestMapping(value = "/findAllApprove", method = { RequestMethod.GET })
	public @ResponseBody Object findAllApprove() {
		final List<AugRequestDTO> data = augRequestService.findAllAugRequest();
		return new Object() {
			public List<AugRequestDTO> getData(){
				return data;
			}
		};
	}

	// Edit AugRequest
	@RequestMapping(value = "/editApprove/{id}", method = { RequestMethod.POST })
	public @ResponseBody AugRequestDTO editApprove(
			@RequestBody AugRequestDTO augRequestDTO, @PathVariable Integer id)
			throws ParseException {

		AugRequest augRequest = augRequestService.findById(augRequestDTO
				.getId());
		augRequest.setStatus(augRequestDTO.getStatus());

		augRequestService.update(augRequest);
		return augRequestService.findAugRequestById(id);

	}

}
