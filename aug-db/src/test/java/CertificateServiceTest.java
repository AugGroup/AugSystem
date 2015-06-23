import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Certificate;
import com.aug.db.services.CertificateService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class CertificateServiceTest {

	@Autowired
	private CertificateService certificateService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertCertificateService() throws Exception {
		Certificate certificate = new Certificate();
		certificate.setCertificateName("java");
		certificateService.create(certificate);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateCertificateService() throws Exception {

		Certificate certificate = certificateService.findById(1);
		certificate.setCertificateName(".net");
		certificateService.update(certificate);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteByIdCertificateService() throws Exception {
		certificateService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdCertificateService() throws Exception {
		Certificate certificate = certificateService.findById(2);
		assertNotNull(certificate.getCertificateName());
		
	}

	@Test
	@Transactional
	public void testFindAllCertificateService() throws Exception {
		List<Certificate> certificates = certificateService.findAll();
		for (Certificate certificate : certificates)
			System.out.println("certificate : "
					+ certificate.getCertificateName());
	}
	
	
	
	
}
