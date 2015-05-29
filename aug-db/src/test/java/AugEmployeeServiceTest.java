

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.AttachFile;
import com.aug.db.entities.AugEmployee;
import com.aug.db.services.AugEmployeeService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class AugEmployeeServiceTest {
	@Autowired
	private AugEmployeeService augEmployeeService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertAugEmployeeService() throws Exception {
		AugEmployee augEmployee = new AugEmployee();
		augEmployee.setEmployedName("Julia");
		augEmployeeService.create(augEmployee);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateAugEmployeeService() throws Exception {

		AugEmployee augEmployee = augEmployeeService.findById(1);
		augEmployee.setEmployedName("Destiny");
		augEmployeeService.update(augEmployee);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteByIdAugEmployeeService() throws Exception {
		augEmployeeService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdAugEmployeeService() throws Exception {
		AugEmployee augEmployee = augEmployeeService.findById(2);
		assertNotNull(augEmployee.getEmployedName());
		
	}

	@Test
	@Transactional
	public void testFindAllAugEmployeeService() throws Exception {
		List<AugEmployee> augEmployees = augEmployeeService.findAll();
		for (AugEmployee augEmployee : augEmployees)
			System.out.println("AugEmployee : "
					+ augEmployee.getEmployedName());
	}
}
