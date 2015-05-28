/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.repositories;

import com.aug.db.entities.AugRequest;
import java.io.Serializable;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Supannika Pattanodom
 */
@Repository(value = "requestRepository")
public class AugRequestRepositoryImpl extends HibernateRepositoryImpl<AugRequest, Serializable> implements AugRequestRepository {
    
}
