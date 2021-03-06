package com.aug.controllers;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

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
@EnableWebMvc
public class AugRequestController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Autowired private AugRequestService augRequestService;
	@Autowired private PositionService positionService;
	
	
	@RequestMapping(value = "/request", method = { RequestMethod.GET })
	public String listRequest(){ 
		return "augRequest";
	}
	

	/*-------------------- Search All Request ----Exception handler-------------*/
	@RequestMapping(value = "/request/search", method = { RequestMethod.GET })
	public @ResponseBody Object findAllRequest() throws Exception{
		final List<AugRequestDTO> data = augRequestService.findAllAugRequest();	
		if(data == null){
			throw new NullPointerException();
		}
		return new Object() {
			public List<AugRequestDTO> getData() {
				return data;
			}
		};
	}
	
	
	/*-------------------- Search Request By Id--------------------*/
	@RequestMapping(value = "/request/search/{id}", method = { RequestMethod.POST, RequestMethod.GET  })
	public @ResponseBody AugRequestDTO searchRequestById(
			@PathVariable Integer id, Model model){
		//AugRequestDTO augRequest = augRequestService.findAugRequestById(500);//test 404 resource not found
		AugRequestDTO augRequest = augRequestService.findAugRequestById(id);
		
		return augRequest;
	}

	

	/*-------------------- Save Request--------------------*/
	@RequestMapping(value = "/request/save", method = RequestMethod.POST)
	public @ResponseBody AugRequestDTO saveRequest(
			@RequestBody AugRequestDTO augRequestDTO,HttpSession session){
		
		AugRequest augRequest = new AugRequest();
		augRequest.setId(augRequestDTO.getId());
		augRequest.setRequestDate(augRequestDTO.getRequestDate());
		augRequest.setRequesterName(augRequestDTO.getRequesterName());
		augRequest.setStatus(augRequestDTO.getStatus());
		augRequest.setApprovalName(augRequestDTO.getApprovalName());
		augRequest.setApproveDate(augRequestDTO.getApproveDate());
		Position position = positionService.findById(augRequestDTO.getPositionRequest());
		augRequest.setPositionRequest(position);
		augRequest.setNumberApplicant(augRequestDTO.getNumberApplicant());
		augRequest.setSpecificSkill(augRequestDTO.getSpecificSkill());
		augRequest.setYearExperience(augRequestDTO.getYearExperience());
		augRequestService.create(augRequest);

		
		return augRequestDTO;
	}

	/*-------------------- Update Request--------------------*/
	@RequestMapping(value = "/request/edit/{id}", method = { RequestMethod.POST, RequestMethod.GET})
	public @ResponseBody AugRequestDTO editAugRequest(
			@RequestBody AugRequestDTO augRequestDTO, @PathVariable Integer id) throws Exception {
		
		AugRequest augRequest = augRequestService.findById(augRequestDTO.getId());
		augRequest.setId(augRequestDTO.getId());
		augRequest.setRequestDate(augRequestDTO.getRequestDate());
		augRequest.setRequesterName(augRequestDTO.getRequesterName());
		augRequest.setStatus(augRequestDTO.getStatus());
		augRequest.setApprovalName(augRequestDTO.getApprovalName());
		augRequest.setApproveDate(augRequestDTO.getApproveDate());
		Position position = positionService.findById(augRequestDTO.getPositionRequest());
		augRequest.setPositionStr(position.getPositionName());
		augRequest.setPositionRequest(position);
		augRequest.setNumberApplicant(augRequestDTO.getNumberApplicant());
		augRequest.setSpecificSkill(augRequestDTO.getSpecificSkill());
		augRequest.setYearExperience(augRequestDTO.getYearExperience());

		augRequestService.update(augRequest);
		
		AugRequestDTO requestDTO = augRequestService.findAugRequestById(id);
		requestDTO.setPositionStr(position.getPositionName());
		return requestDTO;

	}

	/*-------------------- Delete Request--------------------*/
	@RequestMapping(value = "/request/delete/{id}", method = RequestMethod.POST)
	public @ResponseBody AugRequest delesteUser(@ModelAttribute AugRequest augRequest,
			@PathVariable("id") Integer id) throws Exception {
		
		augRequestService.delete(augRequest);
		return augRequestService.findById(id);
	}

	/*-------------------- Position List--------------------*/
	@ModelAttribute("positionRequest")
	public List<Position> getPosition() {
		return positionService.findAll();

	}
	
	/*-------------------- Test Exception Handle 'SQLGrammarException'--------------------*/ //NameNativeQuery is wrong
/*	@RequestMapping(value = "/request/search/testSQLGrammarException/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody AugRequestDTO testHandlerException(
			@PathVariable Integer id, Model model) throws Exception {
		AugRequestDTO augRequest = augRequestService.findAugRequestByIdTest(id);
		return augRequest;
	}*/
	
	
	/*if(date!=null){
		split + call search
	}else
		find all
		
*/
	
	
}
