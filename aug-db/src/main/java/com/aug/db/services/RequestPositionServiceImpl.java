/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.services;


import com.aug.db.entities.RequestPosition;
import com.aug.db.repositories.RequestPositionRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Supannika Pattanodom
 */
@Service(value = "RequestPositionService")
@Transactional
public class RequestPositionServiceImpl implements RequestPositionService{
    
    @Autowired
    RequestPositionRepository requestPositionRepository;
    
    @Override
    public RequestPosition findById (Integer requestPositionId){
        return requestPositionRepository.findById(requestPositionId);
    }
    
    @Override
    public void create(RequestPosition requestPosition){
        requestPositionRepository.insert(requestPosition);
    }
    
    @Override
    public void delete (RequestPosition requestPosition){
         requestPositionRepository.delete(requestPosition);
    }
    
     @Override
	public void deleteById(Integer id) {
        requestPositionRepository.deleteById(id);
		
	}
    
    @Override
    public void update (RequestPosition requestPosition){
        requestPositionRepository.update(requestPosition);
    }
    
    @Override
    public List<RequestPosition> findAll(){
        List<RequestPosition> requestPositions = requestPositionRepository.findAll();
        return requestPositions;
    }
}
