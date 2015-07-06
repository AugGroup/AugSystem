package com.aug.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.zip.DataFormatException;

import javax.servlet.http.HttpSession;

import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	private static final long serialVersionUID = 1L;
	@Autowired private AugRequestService augRequestService;
	@Autowired private PositionService positionService;
	
	
	@RequestMapping(value = "/request", method = { RequestMethod.GET })
	public String listRequest() throws DataFormatException { 
		return "augRequest";
	}
	

	

	/*-------------------- Search All Request ----Exception handler-------------*/
	@RequestMapping(value = "/request/search", method = { RequestMethod.GET })
	public @ResponseBody Object findAllRequest() throws Exception{
		final List<AugRequestDTO> data = augRequestService.findAllAugRequest();	
		if(data == null){
			throw new IllegalArgumentException("Exception as JSON data (request not found)");
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
			@PathVariable Integer id, Model model) throws Exception {
		AugRequestDTO augRequest = augRequestService.findAugRequestById(id);
		if(augRequest == null){
			throw new IndexOutOfBoundsException("Exception as JSON data (request not found) IndexOutOfBoundsException");
		}
		return augRequest;
	}

	

	/*-------------------- Save Request--------------------*/
	@RequestMapping(value = "/request/save", method = RequestMethod.POST)
	public @ResponseBody AugRequestDTO saveRequest(
			@RequestBody AugRequestDTO augRequestDTO) {
		
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
       //BAD_REQUEST
		augRequestService.create(augRequest);

		return augRequestDTO;
	}

	/*-------------------- Update Request--------------------*/
	@RequestMapping(value = "/request/edit/{id}", method = { RequestMethod.POST })
	public @ResponseBody AugRequestDTO editAugRequest(
			@RequestBody AugRequestDTO augRequestDTO, @PathVariable Integer id)
			throws ParseException {
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
	public @ResponseBody AugRequest delesteUser(
			@ModelAttribute AugRequest augRequest,
			@PathVariable("id") Integer id) {

		augRequestService.delete(augRequest);
		return augRequestService.findById(id);
	}

	/*-------------------- Position List--------------------*/
	@ModelAttribute("positionRequest")
	public List<Position> getPosition() {
		return positionService.findAll();

	}
	
	/*-------------------- Search Request By Id Test------??--------------*/
	/*@RequestMapping(value = "/request/search/{id}", method = { RequestMethod.POST, RequestMethod.GET  })
	public @ResponseBody AugRequestDTO searchRequestByIdTest(
			@PathVariable Integer id, Model model) throws Exception {
		AugRequestDTO augRequest =null;
		if(augRequest==null) throw new RequestNotFoundException();
		return augRequest;
	}*/
	/*-------------------- Search All Request Test ajax--------------------*/
	/*@RequestMapping(value = "/request/search", method = { RequestMethod.GET })
	public @ResponseBody Object findAllRequestTest(HttpSession session){
		final List<AugRequestDTO> data = null;// augRequestService.findAllAugRequest();
		if(data==null){
			throw new IllegalArgumentException("Test exception 5 with ExceptionVO as JSON data");
		}
		return data;
		
	}
	
	------------
	------------
	------------
	*/
	/*-------------------- Test Exception 'DataFormatException' 404  --------------------
	@RequestMapping(value = "/request/testDataFormatException", method = { RequestMethod.GET })
	public String testHandlerDataFormatException() throws DataFormatException { //IOException for IOExceptio
		boolean throwException = true;
		if (throwException) {
		      throw new DataFormatException("This is my DataFormatException");
		    }
		return "augRequest";
	}
	
	-------------------- Test Exception Handle 'IOException' ? --------------------
	@RequestMapping(value = "/request/search/testIOException/{id}")
    public String testHandlerIOException() throws IOException {
        //just throw exception to test the exception handler mapping
        if(true) {
            throw new IOException("this is io exception");
        }
        return "augRequest";
    }
	
	-------------------- Test Exception Handle 'SQLGrammarException'-------------------- //NameNativeQuery is wrong
	@RequestMapping(value = "/request/search/testSQLGrammarException/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody AugRequestDTO testHandlerException(
			@PathVariable Integer id, Model model) throws SQLGrammarException {
		AugRequestDTO augRequest = augRequestService.findAugRequestByIdTest(id);
		return augRequest;
	}
	
	-------------------- Test Exception Handle 'IndexOutOfBoundsException'--------------------
	@RequestMapping(value = "/request/search/testException/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody AugRequestDTO testHandlerIndexOutOfBoundsException(Model model) throws Exception {
		int id=500;
		AugRequestDTO augRequest = augRequestService.findAugRequestById(id);
		if(augRequest==null) throw new SQLException("this is sql exception");
		return augRequest;
	}
	
	-------------------- Search All Request Test ajax--------------------
	@RequestMapping(value = "/request/search/test", method = { RequestMethod.GET })
	public @ResponseBody Object findAllRequestTest(HttpSession session){
		final List<AugRequestDTO> data = null;// augRequestService.findAllAugRequest();
		if(data==null){
			throw new IllegalArgumentException("Test exception 5 with ExceptionVO as JSON data");
		}
		return data;
		
	}*/
	

}
