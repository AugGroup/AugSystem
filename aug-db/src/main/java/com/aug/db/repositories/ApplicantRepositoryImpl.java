package com.aug.db.repositories;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ReportApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Applicant;

@Repository(value = "applicantRepository")
@Transactional
public class ApplicantRepositoryImpl extends
		HibernateRepositoryImpl<Applicant, Serializable> implements
		ApplicantRepository {

	@Override
	public List<ApplicantDTO> findByPosition(String position) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_APPLICANT");
		query.setParameter("POSITION", "%" + position + "%");
		List<ApplicantDTO> results = query.list();
		return results;
	}

	@Override
	public List<ApplicantDTO> findAllApplicant() {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ALL");
		List<ApplicantDTO> results = query.list();
		return results;
	}

	@Override
	public ApplicantDTO findApplicantById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_BY_ID");
		query.setParameter("ID", id);
		List<ApplicantDTO> result = query.list();
		ApplicantDTO app = result.get(0);
		return app;
	}
/*-------------------- report --------------------*/
	@Override
	public List<ReportApplicantDTO> reportApplicant() {
		Query query = getCurrentSession().getNamedQuery("REPORT_APPLICANT");
		List<ReportApplicantDTO> results = query.list();
		return results;
	}

	@Override
	public List<ReportApplicantDTO> findReportByCriteria(String position, String degree, String major, String schoolName, Double gpa) {
		Query query = getCurrentSession().getNamedQuery("REPORT_SEARCH_BY_CRITERIA"); 
		query.setParameter("POSITION", "%" + position + "%");
		query.setParameter("DEGREE", "%" + degree + "%");
		query.setParameter("MAJOR", "%" + major + "%");
		query.setParameter("SCHOOL_NAME", "%"+ schoolName +"%");
		if(gpa!=null){
			String queryStr = query.getQueryString();
			queryStr += " education.GPA = :GPA " ;
			getCurrentSession().createSQLQuery(queryStr);
			query.setParameter("GPA",gpa);
		}
		List<ReportApplicantDTO> results = query.list();
		return results;
	}
	
	
	/*-------------------- Monthly report --------------------*/
	public List<ReportApplicantDTO> findReportByMonth(Integer applyDate){
		Query query = getCurrentSession().getNamedQuery("REPORT_SEARCH_BY_MONTH"); 
		query.setParameter("APPLY_DATE", applyDate);
		List<ReportApplicantDTO> results = query.list();
		return results;
	}
	
	@Override
	public ApplicationDTO findApplicationById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_BY_ID_APPLICATION");
		query.setParameter("ID", id);
		List<ApplicationDTO> result = query.list();
		ApplicationDTO app = result.get(0);
		return app;
	}

	@Override
	public void update(ApplicationDTO applicationDTO) {
		Applicant applicant= new Applicant();
		try {
			getCurrentSession().saveOrUpdate(applicant.fromApplicationDTO(applicant, applicationDTO));
		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ApplicationDTO getMaxApplicantId() {
		Query query = getCurrentSession().getNamedQuery("MAX_ID_APPLICANT");
		List<ApplicationDTO> result = query.list();
		ApplicationDTO app = result.get(0);
		return app;
	}
	

}
