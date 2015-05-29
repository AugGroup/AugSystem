

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Reference;
import com.aug.db.services.ReferenceService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class ReferenceServiceTest {
	@Autowired
	private ReferenceService referenceService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testCreateReferenceService() throws Exception {
		Reference reference = new Reference();
		reference.setFullName("Natalie");
		referenceService.create(reference);
	}
	
	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateReferenceService() throws Exception {
		
		Reference reference = referenceService.findById(5);
		reference.setFullName("Riley");
		referenceService.update(reference);
	}
	
	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteReferenceService() throws Exception {
		referenceService.deleteById(2);
	}
	
	@Test
	@Transactional
	public void testFindByIdReferenceService() throws Exception {
		Reference reference = referenceService.findById(2);
		System.out.println("Reference : " + reference.getFullName());
	}

	@Test
	@Transactional
	public void testFindAllReferenceService() throws Exception {
		List<Reference> references = referenceService.findAll();
		for (Reference reference : references)
			System.out.println("Reference : " + reference.getFullName());
	}
	
	
	
	
	
	
}
