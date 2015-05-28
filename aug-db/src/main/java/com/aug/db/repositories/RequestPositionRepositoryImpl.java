/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.repositories;

import com.aug.db.entities.RequestPosition;
import java.io.Serializable;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Supannika Pattanodom
 */
@Repository(value = "requestPositionRepository")
public class RequestPositionRepositoryImpl extends HibernateRepositoryImpl<RequestPosition, Serializable> implements RequestPositionRepository {
    
}
