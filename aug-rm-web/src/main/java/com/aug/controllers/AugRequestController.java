package com.aug.controllers;

import java.io.Serializable;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aug.db.dto.AugRequestDTO;
import com.aug.db.entities.AugRequest;
import com.aug.db.entities.Position;
import com.aug.db.services.AugRequestService;
import com.aug.db.services.PositionService;

/**
 *
 * @author Supannika Pattanodom
 */
@Controller
public class AugRequestController implements Serializable {

	@Autowired
	AugRequestService augRequestService;

	@Autowired
	PositionService positionService;

	@RequestMapping(value = "/request", method = { RequestMethod.GET })
	public String listRequest() {

		return "augRequest";
	}

	// Search all AugRequest
	@RequestMapping(value = "/findAllRequest", method = { RequestMethod.GET })
	public @ResponseBody Object findAllRequest() {

		final List<AugRequestDTO> data = augRequestService.findAllAugRequest();

		return new Object() {
			public List<AugRequestDTO> getData() {
				return data;
			}
		};
	}

	// Search AugRequest By Id
	@RequestMapping(value = "/searchRequest/{id}", method = { RequestMethod.POST })
	public @ResponseBody AugRequestDTO searchRequestById(
			@PathVariable Integer id) {
		return augRequestService.findAugRequestById(id);

	}
	
	// Search AugRequest By Id
		@RequestMapping(value = "/searchRequest/{id}", method = { RequestMethod.GET })
		public @ResponseBody AugRequestDTO searchRequestByIdGet(
				@PathVariable Integer id) {
			return augRequestService.findAugRequestById(id);

		}


	// Create AugRequest
	@RequestMapping(value = "/saveRequest", method = RequestMethod.POST)
	public @ResponseBody AugRequestDTO saveRequest(
			@RequestBody AugRequestDTO augRequestDTO)throws ParseException {

		AugRequest augRequest = new AugRequest();
		augRequest.setId(augRequestDTO.getId());
		augRequest.setRequestDate(augRequestDTO.getRequestDate());
		augRequest.setRequesterName(augRequestDTO.getRequesterName());
		augRequest.setStatus(augRequestDTO.getStatus());
		augRequest.setApprovalName(augRequestDTO.getApprovalName());
		augRequest.setApproveDate(augRequestDTO.getApproveDate());
		Position position = positionService.findById(augRequestDTO
				.getPositionRequest());
		augRequest.setPositionRequest(position);
		augRequest.setNumberApplicant(augRequestDTO.getNumberApplicant());
		augRequest.setSpecificSkill(augRequestDTO.getSpecificSkill());
		augRequest.setYearExperience(augRequestDTO.getYearExperience());

		augRequestService.create(augRequest);

		return augRequestDTO;

	}

	// Edit AugRequest
	@RequestMapping(value = "/editRequest/{id}", method = { RequestMethod.POST })
	public @ResponseBody AugRequestDTO editAugRequest(
			@RequestBody AugRequestDTO augRequestDTO, @PathVariable Integer id)
			throws ParseException {

		AugRequest augRequest = augRequestService.findById(augRequestDTO
				.getId());
		augRequest.setId(augRequestDTO.getId());
		augRequest.setRequestDate(augRequestDTO.getRequestDate());
		augRequest.setRequesterName(augRequestDTO.getRequesterName());
		augRequest.setStatus(augRequestDTO.getStatus());
		augRequest.setApprovalName(augRequestDTO.getApprovalName());
		augRequest.setApproveDate(augRequestDTO.getApproveDate());
		Position position = positionService.findById(augRequestDTO
				.getPositionRequest());
		augRequest.setPositionStr(position.getPositionName());
		augRequest.setPositionRequest(position);
		augRequest.setNumberApplicant(augRequestDTO.getNumberApplicant());
		augRequest.setSpecificSkill(augRequestDTO.getSpecificSkill());
		augRequest.setYearExperience(augRequestDTO.getYearExperience());
		
		augRequestService.update(augRequest);
		AugRequestDTO augDTO =  augRequestService.findAugRequestById(id);
		augDTO.setPositionStr(position.getPositionName());
		return augDTO;

	}

	// Delete AugRequest
	@RequestMapping(value = "/deleteRequest/{id}", method = RequestMethod.POST)
	public @ResponseBody AugRequest delesteUser(
			@ModelAttribute AugRequest augRequest,
			@PathVariable("id") Integer id) {

		augRequestService.delete(augRequest);
		return augRequestService.findById(id);
	}

	// Position List
	@ModelAttribute("positionRequest")
	public List<Position> getPosition() {
		return positionService.findAll();

	}
}
