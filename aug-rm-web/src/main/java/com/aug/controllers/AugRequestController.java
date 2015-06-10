package com.aug.controllers;

import java.io.Serializable;
import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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

	@RequestMapping(value = "/addRequest", method = { RequestMethod.POST })
	public String addRequest(
			@ModelAttribute("augRequest") AugRequest augRequest,
			BindingResult result) {
		augRequestService.create(augRequest);
		return "redirect:/request";
	}

	@RequestMapping(value = "/findAllRequest", method = { RequestMethod.GET })
	public @ResponseBody Object findAllRequest() {

		final List<AugRequestDTO> data = augRequestService.findAllAugRequest();

		return new Object() {
			public List<AugRequestDTO> getData() {
				return data;
			}
		};
	}

	@RequestMapping(value = "/saveRequest", method = RequestMethod.POST)
	public @ResponseBody AugRequest save(@RequestBody AugRequest augRequest,
			BindingResult result) {
		// SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
		// System.out.println(json.getDateStr());
		// Date birthDate = sf.parse(json.getDateStr());
		// json.setBirthdate(birthDate);
		augRequestService.create(augRequest);
		return augRequestService.findById(augRequest.getId());
	}

	// Edit AugRequest
	@RequestMapping(value = "/editRequest/{id}", method = { RequestMethod.POST })
	public @ResponseBody AugRequestDTO editAugRequest(
			@RequestBody AugRequestDTO augRequestDTO, @PathVariable Integer id)
			throws ParseException {

		AugRequest augRequest = augRequestService.findById(augRequestDTO
				.getId());
		augRequest.setRequestDate(augRequestDTO.getRequestDate());
		augRequest.setRequesterName(augRequestDTO.getRequesterName());
		augRequest.setStatus(augRequestDTO.getStatus());
		augRequest.setApprovalName(augRequestDTO.getApprovalName());
		augRequest.setApprovalDate(augRequestDTO.getApprovalDate());
		/*Position position = positionService.findById(augRequestDTO
				.getPositionRequest());
		augRequest.setPositionRequest(position);
*/		augRequest.setNumberApplicant(augRequestDTO.getNumberApplicant());
		augRequest.setSpecificSkill(augRequestDTO.getSpecificSkill());
		augRequest.setYearExperience(augRequestDTO.getYearExperience());

		augRequestService.update(augRequest);

		return augRequestDTO;

	}

	// Search AugRequest By Id
	@RequestMapping(value = "/searchRequest/{id}", method = { RequestMethod.POST })
	public @ResponseBody AugRequestDTO searchRequestById(
			@PathVariable Integer id) {
		return augRequestService.findAugRequestById(id);

	}

	@RequestMapping(value = "/deleteRequest/{id}", method = RequestMethod.POST)
	public @ResponseBody AugRequest delesteUser(
			@ModelAttribute AugRequest augRequest,
			@PathVariable("id") Integer id) {

		augRequestService.delete(augRequest);
		return augRequestService.findById(id);
	}

	@ModelAttribute("position")
	public List<Position> getPosition() {
		return positionService.findAll();

	}
}
