/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.services;

import com.aug.db.entities.AugRequest;
import java.util.List;

/**
 *
 * @author Supannika Pattanodom
 */
public interface AugRequestService {
 
    public void create (AugRequest augRequest);
    
    public AugRequest findById (Integer id);
    
    public void update (AugRequest augRequest);
    
    public void delete (AugRequest augRequest);
    
    public void deleteById(Integer id);
    
    public List<AugRequest> findAll();
}
