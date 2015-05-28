/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.sevices;


import com.aug.db.entities.RequestPosition;
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
    RequestPositionService requestPositionService;
    
    @Override
    public RequestPosition findById (Integer requestPositionId){
        return requestPositionService.findById(requestPositionId);
    }
    
    @Override
    public void create(RequestPosition requestPosition){
        requestPositionService.create(requestPosition);
    }
    
    @Override
    public void delete (Integer requestPositionId){
         requestPositionService.delete(requestPositionId);
    }
    
    @Override
    public void update (RequestPosition requestPosition){
        requestPositionService.update(requestPosition);
    }
    
    @Override
    public List<RequestPosition> findAll(){
        List<RequestPosition> requestPositions = requestPositionService.findAll();
        return requestPositions;
    }
}
