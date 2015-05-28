
import com.aug.db.entities.AugRequest;
import com.aug.db.entities.RequestPosition;
import com.aug.db.services.RequestPositionService;
import com.aug.db.services.AugRequestService;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
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
@ContextConfiguration(locations = { "classpath:spring-bean-db-test.xml" })
@Transactional
public class AugRequestTest {
    
    @Autowired
    private AugRequestService augRequestService;
    

    
    @Test
    @Transactional
    @Rollback(value = false)
    public void testCreateNewRequest(){
        
        AugRequest augRequest = new AugRequest();     
        
        augRequest.setRequesterName("Sale Name");
        augRequest.setApprovalName("Approval Name");
        augRequest.setStatus("NEW");
        //augRequest.setApprovalDate(new Date());

        
        augRequestService.create(augRequest);
     
    }
    
}
