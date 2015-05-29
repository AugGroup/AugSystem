/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.services;

import com.aug.db.entities.Applicant;
import com.aug.db.entities.RequestPosition;
import java.util.List;

/**
 *
 * @author Supannika Pattanodom
 */
public interface RequestPositionService {
    
    public void create (RequestPosition requestPosition);
    
    public RequestPosition findById (Integer requestPositionId);
    
    public void update (RequestPosition requestPosition);
    
    public void delete(RequestPosition requestPosition);
	
    public void deleteById(Integer id);
    
    public List<RequestPosition> findAll();
    
}
