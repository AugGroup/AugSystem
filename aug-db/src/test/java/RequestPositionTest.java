
import com.aug.db.entities.AugRequest;
import com.aug.db.entities.RequestPosition;
import com.aug.db.services.AugRequestService;
import com.aug.db.services.RequestPositionService;
import java.util.Date;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Supannika Pattanodom
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-bean-db-test.xml")
public class RequestPositionTest {
    
     @Autowired
     private RequestPositionService requestPositionService;
     @Autowired
     private AugRequestService augRequestService;
     
    @Test
    @Transactional
    @Rollback(value = false)
    public void testCreateRequestPosition(){
        AugRequest augRequest = new AugRequest();     
        
        augRequest.setRequesterName("kimberley Chen");
        augRequest.setApprovalName("P J");
        augRequest.setStatus("NEW");
        augRequest.setApprovalDate(new Date());
        augRequest.setRequestDate(new Date());
        augRequestService.create(augRequest);
        
        RequestPosition requestPosition = new RequestPosition();
        requestPosition.setNumberApplicant(3);
        requestPosition.setPositionName("Middel Java");
        requestPosition.setSpecificSkill("Spring Hibernate JSP");
        requestPosition.setYearExperience(1);
        requestPosition.setaugRequest(augRequest);
        
        requestPositionService.create(requestPosition);
    }
    
    @Test
    public void testFindById(){
        RequestPosition requestPosition = requestPositionService.findById(1);
        System.out.println("Position Name :"+requestPosition.getPositionName());
    }
    
    @Test
    @Ignore
    public void testUpdate(){
        RequestPosition requestPosition = requestPositionService.findById(2);
        requestPosition.setNumberApplicant(1);
        requestPositionService.update(requestPosition);
        System.out.println("Update Number of Applicant"+requestPosition.getNumberApplicant());
    }
    
      @Test
    public void findAll(){
        RequestPosition requestPosition = new RequestPosition();
        System.out.println("All Requester " +requestPositionService.findAll().toString());
    }
    
     @Test
     @Ignore
    public void testDelete(){
        RequestPosition requestPosition = new RequestPosition();
        requestPosition.setId(4);
         requestPositionService.delete(requestPosition);
    }
    
    @Test
    public void testDeleteById(){
       RequestPosition requestPosition = new RequestPosition();
        requestPositionService.deleteById(10);
    }
}
