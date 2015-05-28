import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Address;
import com.aug.db.entities.Applicant;
import com.aug.db.sevices.AddressService;

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
		Address address = new Address();
		address.setHouseNo("1123");
		addressService.create(address);
		aId = address.getId();
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test 
	@Ignore
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
	public void testUpdateAddress() {
		Address address = new Address();
		address = addressService.findById(aId);
		address.setHouseNo("11/11");
		addressService.update(address);
		assertNotNull(address.getHouseNo());
		System.out.println("HouseNo : " + address.getHouseNo());	
	}

	@Test
	public void testDeleteApplicant() {
		addressService.deleteById(aId);
		assertNull(addressService.findById(aId));
	}

}
