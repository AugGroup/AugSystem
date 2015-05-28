/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.sevices;

import com.aug.db.entities.AugRequest;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Supannika Pattanodom
 */
@Service(value = "RequestService")
@Transactional
public class AugRequestServiceImpl implements AugRequestService{
    
    @Autowired
    AugRequestService augRequestService;
    
    @Override
    public AugRequest findById (Integer augRequestId){
        return augRequestService.findById(augRequestId);
    }
    
    @Override
    public void create(AugRequest augRequest){
        augRequestService.create(augRequest);
    }
    
    @Override
    public void delete (Integer augRequestId){
         augRequestService.delete(augRequestId);
    }
    
    @Override
    public void update (AugRequest augRequest){
        augRequestService.update(augRequest);
    }
    
    @Override
    public List<AugRequest> findAll(){
        List<AugRequest> augRequests = augRequestService.findAll();
        return augRequests;
    }
}
