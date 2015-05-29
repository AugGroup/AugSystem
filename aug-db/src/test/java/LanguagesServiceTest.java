
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Languages;
import com.aug.db.services.LanguagesService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
public class LanguagesServiceTest {
	@Autowired
	private LanguagesService languagesService;

	@Test
	@Transactional
	@Rollback(value = false)
	public void testInsertLanguagesService() throws Exception {
		Languages languages = new Languages();
		languages.setLanguagesName("Korea1");
		languagesService.create(languages);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testUpdateLanguagesService() throws Exception {

		Languages languages = languagesService.findById(1);
		languages.setLanguagesName("korea");
		languagesService.update(languages);
	}

	@Test
	@Transactional
	@Rollback(value = false)
	public void testDeleteByIdLanguagesService() throws Exception {
		languagesService.deleteById(1);
	}

	@Test
	@Transactional
	public void testFindByIdLanguagesService() throws Exception {
		Languages languages = languagesService.findById(2);
		assertNotNull(languages.getLanguagesName());

	}

	@Test
	@Transactional
	public void testFindAllLanguagesService() throws Exception {
		List<Languages> languageList = languagesService.findAll();
		for (Languages languages : languageList)
			System.out.println("Languages : " + languages.getLanguagesName());
	}

}
