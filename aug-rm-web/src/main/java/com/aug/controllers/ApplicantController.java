package com.aug.controllers;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRParameter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Applicant;
import com.aug.db.entities.Position;
import com.aug.db.services.ApplicantService;
import com.aug.db.services.PositionService;
import com.aug.services.ReportService;

@Controller
// @SessionAttributes("applicant")
public class ApplicantController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Autowired private ApplicantService applicantService;
	@Autowired private PositionService positionService;
	@Autowired private ReportService reportService;

	@RequestMapping(value = "/applicant", method = { RequestMethod.GET })
	public String helloPage(Model model) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		model.addAttribute("name", name);
		return "main_applicant";
	}
	/*-------------------- initBinder --------------------*/
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy",
				Locale.ENGLISH);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));

	}

	/*-------------------- search all applicant --------------------*/
	/*@RequestMapping(value = "/applicant/search", method = { RequestMethod.GET })
	public @ResponseBody Object searchAllApplicant() {
		final List<ApplicantDTO> data = applicantService.findAllApplicant();
		return new Object() {
			public List<ApplicantDTO> getData() {
				return data;
			}
		};
	}*/
	
	/*-------------------- search all applicant and applicant by position for dataTable--------------------*/
	@RequestMapping(value = "/applicant/search", method = { RequestMethod.POST })
	public @ResponseBody Object searchByPosition(
			@RequestParam final String position) {
		List<ApplicantDTO> data = applicantService.findByPosition(position);
		if (StringUtils.isEmpty(position)) {
			data = applicantService.findAllApplicant();
		}
		final List<ApplicantDTO> datas = data;
		return new Object() {
			public List<ApplicantDTO> getData() {
				return datas;
			}
		};
	}
	
	/*-------------------- Update Method --------------------*/
	
	@RequestMapping(value = "/informations/{id}", method = { RequestMethod.GET })
	public String informations(@PathVariable Integer id,Model model) {
		System.out.println("APPLICANT_ID : " + id);
		model.addAttribute("id",id);
//		applicantService.findById(id);
        return "informations";

	}
	
	@RequestMapping(value = "/informations/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicationDTO updateUser(@RequestBody ApplicationDTO applicationDTO,@RequestBody ApplicantDTO applicantDTO,
			@PathVariable Integer id) throws ParseException {
		System.out.println("EDIT EDIT EDIT EDIT");
		applicationDTO = applicantService.findApplicationById(id);
		Applicant applicant = applicantService.findById(applicationDTO.getId());

		applicant.setId(applicationDTO.getId());
		applicant.setFirstNameTH(applicantDTO.getFirstNameTH());
//		applicant.setFirstNameTH(applicationDTO.getFirstNameTH());
//		applicant.setFirstNameEN(applicationDTO.getFirstNameEN());
//		applicant.setLastNameTH(applicationDTO.getLastNameTH());
//		applicant.setLastNameEN(applicationDTO.getLastNameEN());
//		applicant.setNickNameTH(applicationDTO.getNickNameTH());
//		applicant.setNickNameEN(applicationDTO.getNickNameEN());
//		applicant.setBirthDate(applicationDTO.getBirthDate());
//		applicant.setPlaceBirth(applicationDTO.getPlaceBirth());
//		applicant.setAge(applicationDTO.getAge());
//		applicant.setHeight(applicationDTO.getHeight());
//		applicant.setWeight(applicationDTO.getWeight());
//		applicant.setReligion(applicationDTO.getReligion());
//		applicant.setNationality(applicationDTO.getNationality());
//		applicant.setTel(applicationDTO.getTel());
//		applicant.setEmail(applicationDTO.getEmail());
//		applicant.setCardId(applicationDTO.getCardId());
//		applicant.setCardIssuedOffice(applicationDTO.getCardIssuedOffice());
//		applicant.setCardExpiryDate(applicationDTO.getCardExpiryDate());
//		applicant.setMilitaryFromYear(applicationDTO.getMilitaryFromYear());
//		applicant.setMilitarytoYear(applicationDTO.getMilitarytoYear());
//		applicant.setMilitaryPlace(applicationDTO.getMilitaryPlace());
//		applicant.setMilitaryServiceNo(applicationDTO.getMilitaryServiceNo());
//		applicant.setMilitaryReason(applicationDTO.getMilitaryReason());
//		applicant.setMilitaryStatus(applicationDTO.getMilitaryStatus());
//		applicant.setMarritalStatusName(applicationDTO.getMarritalStatusName());
//		applicant.setNumberOfChildren(applicationDTO.getNumberOfChildren());
//		applicant.setSpouseName(applicationDTO.getSpouseName());
//		applicant.setMarriageCertificateNo(applicationDTO.getMarriageCertificateNo());
//		applicant.setIssueOficeMarriage(applicationDTO.getIssueOficeMarriage());
//		applicant.setOccupationMarriage(applicationDTO.getOccupationMarriage());
//		applicant.setBranchService(applicationDTO.getBranchService());
//		applicant.setDateToBeDrafted(applicationDTO.getDateToBeDrafted());
//		applicant.setMarriageAddress(applicationDTO.getMarriageAddress());

		applicantService.update(applicant);
		System.out.println("EDIT2 EDIT2 EDIT2 EDIT2");
		return applicationDTO;

	}
	
	//Search Applicant By Id 
	@RequestMapping(value = "/applicant/search/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO findById(@PathVariable Integer id) {
		return applicantService.findApplicantById(id);
	}
	
	@RequestMapping(value = "/findByIdApplication/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicationDTO findByIdApplication(@PathVariable Integer id) {

		return applicantService.findApplicationById(id);
	}
	
	//Edit Applicant Score
	@RequestMapping(value = "/update/score/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO updateUser(@RequestBody ApplicantDTO applicantDTO, @PathVariable Integer id) throws ParseException {

		Applicant applicant = applicantService.findById(applicantDTO.getId());
		applicant.setScore(applicantDTO.getScore());
		applicant.setTechScore(applicantDTO.getTechScore());
		applicant.setAttitudeHome(applicantDTO.getAttitudeHome());
		applicant.setAttitudeOffice(applicantDTO.getAttitudeOffice());
		applicant.setTrackingStatus(applicantDTO.getTrackingStatus());

		applicantService.update(applicant);

		return applicantDTO;

	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	public @ResponseBody String delesteUser(@PathVariable("id") Integer id) {

		applicantService.deleteById(id);
		return "success";
		// augRequestService.delete(augRequest);
		// return augRequestService.findById(id);
	}

	/*-------------------- Report Method --------------------*/
	//Main report
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public String mainReport(){
		return "/main_report";
	}
	//Report search all Don't use
	@RequestMapping(value = "/report/search", method = { RequestMethod.GET })
	public @ResponseBody Object searchAllApplicantForReport() {
		final List<ReportApplicantDTO> data = applicantService.reportApplicant();
		return new Object() {
			public List<ReportApplicantDTO> getData() {
				return data;
			}
		};
	}
	
	/*-------------------- search all applicant and search applicant for Report dataTable--------------------*/
/*	@RequestMapping(value = "/report/search", method = { RequestMethod.POST })
	public @ResponseBody Object searchAllApplicantForReport(
			@RequestParam final String position, String degree, String major, double gpa,String schoolName) {
		final List<ReportApplicantDTO> data = applicantService.reportApplicant();
		if (StringUtils.isEmpty(major)) {
			data = applicantService.reportApplicant();
		}
		final List<ReportApplicantDTO> datas = data;
		return new Object() {
			public List<ReportApplicantDTO> getData() {
				return data;
			}
		};
	}
	*/
	
	
/*
	// Degree report
	@RequestMapping(value = "/modalDegreeReport", method = RequestMethod.GET)
	public String modalDegreeReport(ModelMap map) {
		return "/modalDegreeReport";
	}

	@RequestMapping(value = "/searchDegreeReport", method = { RequestMethod.POST })
	public ModelAndView searchDegreeReport(
			@ModelAttribute(value = "applicant") Applicant applicant,
			ModelMap map, HttpSession session, Locale locale) {
		List<ReportApplicantDTO> reportApplicantList = applicantService.reportApplicant();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		ModelAndView mv = reportService.getReport(reportApplicantList,
				"applicantSummaryDegree", "pdf", parameterMap);
		return mv;
	}

	// Major report
	@RequestMapping(value = "/modalMajorReport", method = RequestMethod.GET)
	public String modalMajorReport(ModelMap map) {
		return "/modalMajorReport";
	}

	@RequestMapping(value = "/searchMajorReport", method = { RequestMethod.POST })
	public ModelAndView searchMajorReport(
			@ModelAttribute(value = "applicant") Applicant applicant,
			ModelMap map, HttpSession session, Locale locale) {
		List<ReportApplicantDTO> reportApplicantList = applicantService.reportApplicant();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		ModelAndView mv = reportService.getReport(reportApplicantList,
				"applicantSummaryMajor", "pdf", parameterMap);
		return mv;
	}
	
	// Position report
		@RequestMapping(value = "/modalPositionReport", method = RequestMethod.GET)
		public String modalPositionReport(ModelMap map) {
			return "/modalPositionReport";
		}

		@RequestMapping(value = "/searchPositionReport", method = { RequestMethod.POST })
		public ModelAndView searchPositionReport(
				@ModelAttribute(value = "applicant") Applicant applicant,
				ModelMap map, HttpSession session, Locale locale) {
			List<ReportApplicantDTO> reportApplicantList = applicantService.reportApplicant();
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			ModelAndView mv = reportService.getReport(reportApplicantList,
					"applicantSummaryPos", "pdf", parameterMap);
			return mv;
		}


	// Monthly report
	@RequestMapping(value = "/modalMonthlyReport", method = RequestMethod.GET)
	public String modalMonthlyReport(ModelMap map) {
		return "/modalMonthlyReport";
	}

	@RequestMapping(value = "/searchMonthlyReport", method = { RequestMethod.POST })
	public ModelAndView searchMonthlyReport(
			@ModelAttribute(value = "applicant") Applicant applicant,
			ModelMap map, HttpSession session, Locale locale) {
		//List<Applicant> reportApplicantList = applicantService.findAll();	
		List<ReportApplicantDTO> reportApplicantList = applicantService.reportApplicant();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		// ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		// parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		parameterMap.put("date", new java.util.Date());
		parameterMap.put(JRParameter.REPORT_LOCALE, Locale.ENGLISH);
		ModelAndView mv = reportService.getReport(reportApplicantList,
				"applicantSummaryMonthly", "pdf", parameterMap);
		return mv;
	}
	
	// position EE report
	@RequestMapping(value = "/modalEEReport", method = RequestMethod.GET)
	public String modalEEReport(ModelMap map) {
		return "/modalEEReport";
	}

	@RequestMapping(value = "/searchEEReport", method = { RequestMethod.POST })
	public ModelAndView searchEEReport(
			@ModelAttribute(value = "applicant") Applicant applicant,
			ModelMap map, HttpSession session, Locale locale) {
		//List<Applicant> reportApplicantList = applicantService.findAll();	
		List<ReportApplicantDTO> reportApplicantList = applicantService.reportApplicant();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		// ResourceBundle bundle = ResourceBundle.getBundle("messages",locale);
		// parameterMap.put(JRParameter.REPORT_RESOURCE_BUNDLE, bundle);
		parameterMap.put("date", new java.util.Date());
		parameterMap.put(JRParameter.REPORT_LOCALE, Locale.ENGLISH);
		ModelAndView mv = reportService.getReport(reportApplicantList,
				"applicantSummaryPos", "pdf", parameterMap);
		return mv;
	}
*/
	
	/*-------------------- Position List--------------------*/
	@ModelAttribute("positionRequest")
	public List<Position> getPosition() {
		return positionService.findAll();

	}
}
