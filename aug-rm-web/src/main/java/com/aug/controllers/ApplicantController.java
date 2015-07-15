package com.aug.controllers;

import java.io.Serializable;
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
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.dto.SearchReportDTO;
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
			@RequestParam final String position) throws Exception {
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
	public String informations(@PathVariable Integer id,Model model) throws Exception {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		model.addAttribute("name", name);
		System.out.println("APPLICANT_ID : " + id);
		model.addAttribute("id",id);
//		applicantService.findById(id);
        return "informations";

	}
	

	//Search Applicant By Id 
	@RequestMapping(value = "/applicant/search/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO findById(@PathVariable Integer id) throws Exception {
		return applicantService.findApplicantById(id);
	}
	
	@RequestMapping(value = "/findByIdApplication/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicationDTO findByIdApplication(@PathVariable Integer id) throws Exception {

		return applicantService.findApplicationById(id);
	}
	
	//Edit Applicant Score
	@RequestMapping(value = "/update/score/{id}", method = { RequestMethod.POST })
	public @ResponseBody ApplicantDTO updateUser(@RequestBody ApplicantDTO applicantDTO,
			@PathVariable Integer id) throws Exception {

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
	
	/*-------------------- search all applicant and search applicant for Report dataTable--------------------*/
	@RequestMapping(value = "/report/search", method = { RequestMethod.POST })
	public @ResponseBody Object searchReportBy(
			@RequestParam Integer position, String degree, String major, String schoolName, Double gpa) throws Exception {
		
		final List<ReportApplicantDTO> data;
		if (position == -1 && degree.equals("") && major.isEmpty() && schoolName.isEmpty() && gpa==null){ 			
			data = applicantService.reportApplicant();
		} else {
			data = applicantService.findReportByCriteria(position, degree, major, schoolName, gpa);	
		}
		
		return new Object() {
			public List<ReportApplicantDTO> getData() {
				return data;
			}
		};
	}
	
	/*-------------------- preview reports function--------------------*/
	@RequestMapping(value = "/report/preview", method = { RequestMethod.POST,RequestMethod.GET  })
	public ModelAndView previewReport(@ModelAttribute SearchReportDTO searchReportDTO,
			HttpSession session, Locale locale)  throws Exception {
		List<ReportApplicantDTO> reportApplicantList =null;
		Integer position = searchReportDTO.getPosition();
		String degree = searchReportDTO.getDegree();
		String major = searchReportDTO.getMajor();
		String schoolName = searchReportDTO.getSchoolName();
		Double gpa = searchReportDTO.getGpa();
		String reportType = searchReportDTO.getReportType();
		System.out.println(position);
		if (position == -1 && degree.equals("") && major.isEmpty() && schoolName.isEmpty() && gpa==null){  			
			reportApplicantList = applicantService.reportApplicant();
		}else {
			reportApplicantList = applicantService.findReportByCriteria(position, degree, major, schoolName, gpa);// search by
		}
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("date", new java.util.Date());
		parameterMap.put(JRParameter.REPORT_LOCALE, Locale.ENGLISH);
		ModelAndView mv = reportService.getReport(reportApplicantList,
				"Report_AugRmSystem", reportType, parameterMap);
		return mv;
	}
	
	
	// Monthly report
		@RequestMapping(value = "/monthlyReport", method = RequestMethod.GET)
		public String modalMonthlyReport() {
			return "/monthly_report";
		}
		/*-------------------- search all applicant and search applicant for Report dataTable--------------------*/
		@RequestMapping(value = "/report/searchMonth", method = { RequestMethod.POST })
		public @ResponseBody Object searchReportByMonth(@RequestParam String applyDateStr) {

			String date = applyDateStr;
			 String[] parts = date.split(" \\- ");
			 String startDate = parts[0];
			 String endDate = parts[1];
			 if(startDate!=null&&endDate!=null){
			 System.out.println("startDate : "+startDate);
			 System.out.println("endDate : "+endDate);
			 }
			
			final List<ReportApplicantDTO> data = null ;
			
		
				
			return new Object() {
				public List<ReportApplicantDTO> getData() {
					return data;
				}
			};
		}


//		@RequestMapping(value = "/reportMonthly/preview", method = { RequestMethod.POST })
//		public ModelAndView searchMonthlyReport(@ModelAttribute SearchReportDTO searchReportDTO,
//				HttpSession session, Locale locale) {
//			List<ReportApplicantDTO> reportApplicantList;
//			Date applyDate = searchReportDTO.getApplyDate();
//			String reportType = searchReportDTO.getReportType();
//			if (applyDate==null){ 			
//				reportApplicantList = applicantService.reportApplicant();
//			}else {
//				reportApplicantList = applicantService.findReportByMonth(applyDate);
//			}
//			
//			Map<String, Object> parameterMap = new HashMap<String, Object>();
//			parameterMap.put("date", new java.util.Date());
//			parameterMap.put(JRParameter.REPORT_LOCALE, Locale.ENGLISH);
//			ModelAndView mv = reportService.getReport(reportApplicantList,
//					"applicantSummaryMonthly", reportType, parameterMap);
//			return mv;
//		}
	/*-------------------- Position List--------------------*/
	@ModelAttribute("positionRequest")
	public List<Position> getPosition() {
		return positionService.findAll();

	}
	
	@ModelAttribute("searchReportDTO")
	public SearchReportDTO getsearchReport() {
		return new SearchReportDTO();

	}
}
