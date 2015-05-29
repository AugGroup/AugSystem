

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Family;
import com.aug.db.services.FamilyService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class FamilyServiceTest {

	@Autowired
	private FamilyService familyService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertFamilyService() throws Exception {
		Family family = new Family();
		family.setName("Madeline");
		familyService.create(family);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateFamilyService() throws Exception {

		Family family = familyService.findById(1);
		family.setName("Eva");
		familyService.update(family);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteByIdFamilyService() throws Exception {
		familyService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdFamilyService() throws Exception {
		Family family = familyService.findById(2);
		assertNotNull(family.getName());
		
	}

	@Test
	@Transactional
	public void testFindAllFamilyService() throws Exception {
		List<Family> families = familyService.findAll();
		for (Family family : families)
			System.out.println("Family : "
					+ family.getName());
	}
	
	
	
	
	
	
	
	
	
	
	
}
