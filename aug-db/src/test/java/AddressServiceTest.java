import com.aug.db.entities.Address;
import com.aug.db.services.AddressService;
import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
@Transactional
public class AddressServiceTest {


	Integer aId;


	@Autowired
	private AddressService addressService;

	@Before
	public void setUp() throws Exception {

		/*
		 * Address address = new Address();
		 * address.setHouseNo("1123");
		 * addressService.create(address); 
		 * aId = address.getId();
		 */

	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Ignore
	@Rollback(value = false)
	public void testCreateAddress() {
		Address address = new Address();
		address.setHouseNo("1122");
		addressService.create(address);
	}

	@Test
	public void testFindById() {
		Address address = addressService.findById(2);
		assertNotNull(address);
		System.out.println("chhhh" + address.getHouseNo());

	}

	@Test
	public void testFindAll() {
		List<Address> addressList = addressService.findAll();
		assertNotNull(addressList);
		System.out.println("All HouseNo " + addressList);

	}

	@Test
	@Ignore
	public void testUpdateAddress() {
		Address address = new Address();
		address = addressService.findById(8);
		address.setHouseNo("11/11");
		addressService.update(address);
		assertEquals("11/11", address.getHouseNo());
	}

	@Test
	@Rollback(value = false)
	public void testDeleteApplicant() {
		addressService.deleteById(8);
		assertNull(addressService.findById(8));
	}


}
