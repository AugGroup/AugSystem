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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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

    @RequestMapping(value = "/request", method = {RequestMethod.GET})
    public String listRequest() {

        return "augRequest";
    }

    @RequestMapping(value = "/addRequest", method = {RequestMethod.POST})
    public String addRequest(@ModelAttribute("augRequest") AugRequest augRequest, BindingResult result) {
        augRequestService.create(augRequest);
        return "redirect:/request";
    }

    @RequestMapping(value = "/findAllRequest", method = {RequestMethod.GET})
    public @ResponseBody Object findAllRequest() {
        return new Object() {
            public List<AugRequest> data = augRequestService.findAll();
        };
    }

    @RequestMapping(value = "/saveRequest", method = RequestMethod.POST)
    public @ResponseBody AugRequest save(@RequestBody AugRequest augRequest, BindingResult result) {
//            SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
//            System.out.println(json.getDateStr());
//            Date birthDate = sf.parse(json.getDateStr());
//            json.setBirthdate(birthDate);
        augRequestService.create(augRequest);
        return augRequestService.findById(augRequest.getId());
    }

    @RequestMapping(value = "/editRequest/{id}", method = RequestMethod.POST)
    public @ResponseBody AugRequest edit(@RequestBody AugRequest augRequest) {
        augRequestService.update(augRequest);
        return augRequestService.findById(augRequest.getId());
    }

    @RequestMapping(value = "/searchRequest/{id}", method = {RequestMethod.POST})
    public @ResponseBody AugRequest search(@PathVariable("id") Integer id) {
        return augRequestService.findById(id);

    }

    @RequestMapping(value = "/deleteRequest/{id}" , method = RequestMethod.POST)
    public @ResponseBody AugRequest delesteUser(@ModelAttribute AugRequest augRequest, @PathVariable("id") Integer id){
       
        augRequestService.delete(augRequest);
        return augRequestService.findById(id);
    }
}
