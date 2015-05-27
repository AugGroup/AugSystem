package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface GenericRepository<Entity, ID extends Serializable> {
	
	ID insert(Entity entity);
	
    Entity findById(ID id);
    
    void update(Entity entity);

    void delete(Entity entity);
    
    List findAll();
}
