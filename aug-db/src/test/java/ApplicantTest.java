import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Applicant;
import com.aug.db.sevices.ApplicantService;

public class ApplicantTest {
	
	private ApplicantService applicantService;

	@Test
	public void testCreateNewApplicant() {
		Applicant applicant = new Applicant();
		applicant.setFirstNameEN("Payom");
		applicant.setAge(33);
		applicantService.create(applicant);
		assertNotNull(applicant.getFirstNameEN());
		assertNotNull(applicant.getAge());
	}
	
	@Test
	public void testFindById() {
		Applicant applicant = new Applicant();
		applicant = applicantService.findById(1);
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
		applicantService.deleteById(1);
		assertNull(applicant);
	}
	
	@Test
	public void testFindAll() {
		Applicant applicant = new Applicant();
		System.out.println("FindAll : " + applicantService.findAll());
	}

}
