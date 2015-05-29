import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aug.db.entities.Applicant;
import com.aug.db.services.ApplicantService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-bean-db-test.xml")
public class ApplicantTest {
	
	@Autowired
	private ApplicantService applicantService;

	@Test
	@Rollback(value = false)
	public void testCreateNewApplicant() {
		Applicant applicant = new Applicant();
		applicant.setFirstNameEN("Monkey");
		applicant.setAge(12);
		applicantService.create(applicant);
	}
	
	@Test
	public void testFindById() {
		Applicant applicant = new Applicant();
		applicant = applicantService.findById(1);
		System.out.println("FirstName : " + applicant.getFirstNameEN());		
	}
	
	@Test
	public void testUpdateApplicant() {
		Applicant applicant = new Applicant();
		applicant = applicantService.findById(4);
		applicant.setFirstNameEN("Mankigg");
		applicantService.update(applicant);
		System.out.println("Last : " + applicant.getLastNameEN());	
	}
	
	@Test
	public void testDeleteApplicant() {
		Applicant applicant = new Applicant();
		applicantService.deleteById(4);
		assertNull(applicant);
	}
	
	@Test
	public void testFindAll() {
		Applicant applicant = new Applicant();
		System.out.println("FindAll : " + applicantService.findAll());
	}

}
