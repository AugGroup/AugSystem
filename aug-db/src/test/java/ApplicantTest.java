import static org.junit.Assert.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Applicant;
import com.aug.db.sevices.ApplicantService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-bean-db-test.xml"})
public class ApplicantTest {
	
	@Autowired
	private ApplicantService applicantService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testCreateNewApplicant() {
//		session.getTransaction().begin();
		
		Applicant applicant = new Applicant();
		applicant.setFirstNameEN("Payom");
		applicant.setAge(33);
//		session.save(applicant);
		applicantService.create(applicant);
		assertNotNull(applicant.getFirstNameEN());
		assertNotNull(applicant.getAge());
		
//		session.getTransaction().commit();
	}
	
	@Test
	public void testFindById() {
		Applicant applicant = new Applicant();
		applicant = applicantService.findById(1);
		System.out.println("FirstName : " + applicant.getFirstNameEN());
		assertNotNull(applicant);
		
	}
	
	@Test
	public void testUpdateApplicant() {
		Applicant applicant = new Applicant();
		applicant = applicantService.findById(1);
		applicant.setLastNameEN("Mankigg");
		applicantService.update(applicant);
		assertNotNull(applicant.getLastNameEN());
		System.out.println("Last : " + applicant.getLastNameEN());	
	}
	
	@Test
	public void testDeleteApplicant() {
		Applicant applicant = new Applicant();
		applicantService.delete(1);
		assertNull(applicant);
	}
	
	@Test
	public void testFIndAll() {
		Applicant applicant = new Applicant();
		System.out.println("FindAll : " + applicantService.findAll());
	}

}
