/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.sevices;

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
    
    public void delete (Integer requestPositionId);
    
    public List<RequestPosition> findAll();
    
}
