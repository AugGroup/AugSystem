
import com.aug.db.entities.AugRequest;
import com.aug.db.entities.RequestPosition;
import com.aug.db.sevices.RequestPositionService;
import com.aug.db.sevices.AugRequestService;
import java.util.ArrayList;
import java.util.Date;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
@ContextConfiguration(locations = { "/spring-bean-db-test.xml" })
@TransactionConfiguration(defaultRollback = true)
@Transactional
public class AugRequestTest {
    
    @Autowired
    private AugRequestService augRequestService;
//    @Autowired
//    private RequestPositionService requestPositionService;
    
    @Test
    public void testCreateNewRequest(){
        
        AugRequest augRequest = new AugRequest();     
        //List<RequestPosition> requestPositionList = new ArrayList<RequestPosition>();

        augRequest.setRequesterName("Sale Name");
        augRequest.setApprovalName("Approval Name");
        augRequest.setStatus("NEW");
        augRequest.setApprovalDate(new Date());
//      request.setRequestPosition(requestPositionList);
 
//        RequestPosition requestPosition = new RequestPosition();
//        requestPosition.setReqPositionId(1);
//        requestPosition.setPositionName(".Net");
//        requestPosition.setYearExperience(3);
//        requestPosition.setNumberApplicant(2);
//        requestPosition.setSpecificSkill("Java Script , Bootstrap");
//        requestPositionList.add(requestPosition);
        
        augRequestService.create(augRequest);
        //requestPositionService.create(requestPosition);
     
    }
    
}
