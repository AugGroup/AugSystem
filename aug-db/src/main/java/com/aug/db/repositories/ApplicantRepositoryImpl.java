package com.aug.db.repositories;

import java.io.Serializable;
import java.text.ParseException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.dto.ReportApplicantDTO;
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
	public List<ReportApplicantDTO> findReportByCriteria(Integer position, String degree, String major, String schoolName, Double gpa) {
		Query query = getCurrentSession().getNamedQuery(
				"REPORT_SEARCH_BY_CRITERIA");
		String queryStr = query.getQueryString();
		if (position > 0) {
			queryStr = query.getQueryString();
			queryStr += " AND (position1.ID = :POSITION OR position2.ID = :POSITION OR position3.ID = :POSITION ) ";
			query = getCurrentSession().createSQLQuery(queryStr).addEntity(ReportApplicantDTO.class);
			query.setParameter("POSITION", position);
		}
		if (gpa != null) {
			queryStr = query.getQueryString();
			queryStr += " AND education.GPA = :GPA";
			query = getCurrentSession().createSQLQuery(queryStr).addEntity(ReportApplicantDTO.class);
			query.setParameter("GPA", gpa);
		}
		query = getCurrentSession().createSQLQuery(queryStr).addEntity(ReportApplicantDTO.class);
		if (position > 0) {
			query.setParameter("POSITION", position);
		}
		if (gpa != null) {
			query.setParameter("GPA", gpa);
			System.out.println("TEST:::" + queryStr);
		}

		query.setParameter("DEGREE", "%" + degree + "%");
		query.setParameter("MAJOR", "%" + major + "%");
		query.setParameter("SCHOOL_NAME", "%"+ schoolName +"%");
		
		List<ReportApplicantDTO> results = query.list();
		//System.out.println("queryStr :"+ queryStr);
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
