
import java.util.Date;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aug.db.entities.AugRequest;
import com.aug.db.services.AugRequestService;

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
public class AugRequestTest {
    
    @Autowired
    private AugRequestService augRequestService;
    

    
    @Test
//  @Transactional
    @Rollback(value = false)
    public void testCreateNewRequest(){
        
        AugRequest augRequest = new AugRequest();     
        
        augRequest.setRequesterName("Sale Name");
        augRequest.setApprovalName("Approval Name");
        augRequest.setStatus("NEW");
        augRequest.setApproveDate(new Date());
        augRequest.setRequestDate(new Date());
        //augRequest.setPosition(1);
        augRequest.setNumberApplicant(2);
        augRequest.setSpecificSkill("SpringHibernate");
        augRequest.setYearExperience(2);
        augRequestService.create(augRequest);
     
    }
    
    @Test
    public void testFindById(){ 
       AugRequest augRequest = augRequestService.findById(1);
       System.out.println("Request Name "+augRequest.getRequesterName());
       
    }
    
    @Test
    public void testUpdate(){
        AugRequest augRequest = augRequestService.findById(1);
        augRequest.setRequesterName("Chuck Bass");
        augRequestService.update(augRequest);
        System.out.println("Update Requester Name : "+augRequest.getRequesterName());
    }
    
    @Test
    public void findAll(){
        AugRequest augRequest = new AugRequest();
        System.out.println("All Requester " +augRequestService.findAll().toString());
    }
    
    @Test
    @Ignore
    public void testDelete(){
        AugRequest augRequest = new AugRequest();
        augRequest.setId(5);
         augRequestService.delete(augRequest);
    }
    
    @Test
    public void testDeleteById(){
        AugRequest augRequest = new AugRequest();
        augRequestService.deleteById(8);
    }
}
