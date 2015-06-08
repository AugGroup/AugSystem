import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Advertise;
import com.aug.db.services.AdvertiseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class AdvertiseServiceTest {

	@Autowired
	private AdvertiseService advertiseService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertAdvertiseService() throws Exception {
		Advertise advertise = new Advertise();
		advertise.setAdvertiseName("Paper");
		advertiseService.create(advertise);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateAdvertiseService() throws Exception {

		Advertise advertise = advertiseService.findById(1);
		advertise.setAdvertiseName("Board");
		advertiseService.update(advertise);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteByIdAdvertiseService() throws Exception {
		advertiseService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdAdvertiseService() throws Exception {
		Advertise advertise = advertiseService.findById(2);
		assertNotNull(advertise.getAdvertiseName());
		
	}

	@Test
	@Transactional
	public void testFindAllAdvertiseService() throws Exception {
		List<Advertise> advertises = advertiseService.findAll();
		for (Advertise advertise : advertises)
			System.out.println("advertise : "
					+ advertise.getAdvertiseName());
	}

}
