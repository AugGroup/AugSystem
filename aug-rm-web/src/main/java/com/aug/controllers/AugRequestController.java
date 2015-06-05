/*
 */
package com.aug.controllers;

import com.aug.db.entities.AugRequest;
import com.aug.db.services.AugRequestService;
import java.io.Serializable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Supannika Pattanodom
 */
@Controller
public class AugRequestController implements Serializable {
    
    @Autowired
    AugRequestService augRequestService;
    
    @RequestMapping(value="/request" , method= {RequestMethod.GET} )
        public String listRequest(){
        
            return "augRequest";
        }
    
    @RequestMapping(value="/addRequest", method= {RequestMethod.POST})
	public String addRequest(@ModelAttribute("augRequest") AugRequest augRequest ,BindingResult result){
            augRequestService.create(augRequest);
            return "redirect:/request";
        }
        
    @RequestMapping(value="/findAllRequest" , method={RequestMethod.GET})
        public  @ResponseBody Object findAllRequest(){
            return new Object () { public List<AugRequest> data = augRequestService.findAll(); };
        }
        
    
    
}
