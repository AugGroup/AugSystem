

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Position;
import com.aug.db.services.PositionService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class PositionServiceTest {
	@Autowired
	private PositionService positionService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testCreatePositionService() throws Exception {
		Position position = new Position();
		position.setPositionName("hr manager");
		positionService.create(position);
	}
	
	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdatePositionService() throws Exception {
		
		Position position = positionService.findById(15);
		position.setPositionName("manager");
		positionService.update(position);
	}
	
	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeletePositionService() throws Exception {
		positionService.deleteById(15);
	}
	
	@Test
	@Transactional
	public void testFindByIdPositionService() throws Exception {
		Position position = positionService.findById(2);
		System.out.println("Position : " + position.getPositionName());
	}

	@Test
	@Transactional
	public void testFindAllPositionService() throws Exception {
		List<Position> positions = positionService.findAll();
		for (Position position : positions)
			System.out.println("Position : " + position.getPositionName());
	}
	
	
	
}
