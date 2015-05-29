import static org.junit.Assert.assertNotNull;

import java.io.Serializable;

import org.hibernate.SessionFactory;
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

import com.aug.db.entities.Address;
import com.aug.db.services.AddressService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
@Transactional
public class AddressServiceTest {
	
	Serializable id;
	Integer aId;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private AddressService addressService;
	
	@Before
	public void setUp() throws Exception {
		/*Address address = new Address();
		address.setHouseNo("1123");
		addressService.create(address);
		aId = address.getId();*/
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test 
	//@Ignore
	@Rollback(value = false)
	public void testCreateAddress(){
		Address address = new Address();
		address.setHouseNo("1122");
		addressService.create(address);
		assertNotNull(address.getHouseNo());
	}
	
	
	
	@Test
	public void testFindById() {
		Address address = addressService.findById(aId);
		assertNotNull(address);
		System.out.println("chhhh"+address.getHouseNo());
		
	}
	
	@Test
	@Ignore
	public void testUpdateAddress() {
		Address address = new Address();
		address = addressService.findById(aId);
		address.setHouseNo("11/11");
		addressService.update(address);
		assertNotNull(address.getHouseNo());
		System.out.println("HouseNo : " + address.getHouseNo());	
	}

/*	@Test
	public void testDeleteApplicant() {
		addressService.deleteById(aId);
		assertNull(addressService.findById(aId));
	}*/

}
