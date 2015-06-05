/*
 */
package com.aug.controllers;

import com.aug.db.entities.AugRequest;
import com.aug.db.services.AugRequestService;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Supannika Pattanodom
 */
@Controller
public class RequestApproveController implements Serializable {
    
    @Autowired
    AugRequestService augRequestService;
    
     @RequestMapping(value="/approve" , method= {RequestMethod.GET} )
        public String listRequest(){
        
            return "requestApprove";
        }
        
    @RequestMapping(value="/findAllApprove" , method={RequestMethod.GET})
        public  @ResponseBody Object findAllApprove(){
            return new Object () { public List<AugRequest> data = augRequestService.findAll(); };
        }    
}
