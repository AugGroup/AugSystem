/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.services;

import com.aug.db.entities.AugRequest;
import com.aug.db.repositories.AugRequestRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Supannika Pattanodom
 */
@Service(value = "AugRequestService")
@Transactional
public class AugRequestServiceImpl implements AugRequestService{
    
    @Autowired
    AugRequestRepository augRequestRepository;
    
    @Override
    public AugRequest findById (Integer augRequestId){
        return augRequestRepository.findById(augRequestId);
    }
    
    @Override
    public void create(AugRequest augRequest){
        augRequestRepository.insert(augRequest);
    }
    
    @Override
    public void delete (AugRequest augRequest){
         augRequestRepository.delete(augRequest);
    }
    
    @Override
	public void deleteById(Integer id) {
		augRequestRepository.deleteById(id);
		
	}
    
    @Override
    public void update (AugRequest augRequest){
        augRequestRepository.update(augRequest);
    }
    
    @Override
    public List<AugRequest> findAll(){
        List<AugRequest> augRequests = augRequestRepository.findAll();
        return augRequests;
    }
}
