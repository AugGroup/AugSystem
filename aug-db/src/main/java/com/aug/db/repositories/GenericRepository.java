package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface GenericRepository<Entity, ID extends Serializable> {
	
	public ID insert(Entity entity);
	
	public Entity findById(ID id);
    
    public void update(Entity entity);

    public void delete(Entity entity);
    
    public void deleteById(ID id);
    
    public List<Entity> findAll();
}
