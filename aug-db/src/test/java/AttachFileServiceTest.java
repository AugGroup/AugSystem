
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
import com.aug.db.services.AttachFileService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class AttachFileServiceTest {

	@Autowired
	private AttachFileService attachFileService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertAttachFileService() throws Exception {
		AttachFile attachFile = new AttachFile();
		attachFile.setAttachName("testresume");
		attachFileService.create(attachFile);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateAttachFileService() throws Exception {

		AttachFile attachFile = attachFileService.findById(1);
		attachFile.setAttachName("testpicture");
		attachFileService.update(attachFile);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteByIdAttachFileService() throws Exception {
		attachFileService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdAttachFileService() throws Exception {
		AttachFile attachFile = attachFileService.findById(2);
		assertNotNull(attachFile.getAttachName());
		
	}

	@Test
	@Transactional
	public void testFindAllAttachFileService() throws Exception {
		List<AttachFile> attachFiles = attachFileService.findAll();
		for (AttachFile attachFile : attachFiles)
			System.out.println("AttachFile : "
					+ attachFile.getAttachName());
	}

}
