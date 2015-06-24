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

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import com.aug.db.entities.Applicant;
import com.aug.db.services.ApplicantService;
import com.aug.services.ReportService;

@Controller
// @SessionAttributes("applicant")
public class ApplicantController implements Serializable {

	private static final long serialVersionUID = 1L;
	@Autowired private ApplicantService applicantService;
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
	
	//Search Applicant By Id 
	@RequestMapping(value = "/applicant/search/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO findById(@PathVariable Integer id) {
		return applicantService.findApplicantById(id);
	}

	//Update Applicant Score
	@RequestMapping(value = "/update/score/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO updateUser(
			@RequestBody ApplicantDTO applicantDTO, @PathVariable Integer id)
			throws ParseException {

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

}
