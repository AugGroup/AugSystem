
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Department;
import com.aug.db.services.DepartmentService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class DepartmentServiceTest {
	@Autowired
	private DepartmentService departmentService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertDepartmentService() throws Exception {
		Department department = new Department();
		department.setDepartmentName("HR");
		departmentService.create(department);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateDepartmentService() throws Exception {

		Department department = departmentService.findById(1);
		department.setDepartmentName("Product Manager");
		departmentService.update(department);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteDepartmentService() throws Exception {
		departmentService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdDepartmentService() throws Exception {
		Department department = departmentService.findById(2);
		System.out.println("Department : " + department.getDepartmentName());
	}

	@Test
	@Transactional
	public void testFindAllDepartmentService() throws Exception {
		List<Department> departmentList = departmentService.findAll();
		for (Department department : departmentList)
			System.out.println("Department : "
					+ department.getDepartmentName());
	}


}
