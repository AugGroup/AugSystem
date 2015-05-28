package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Position;

public interface PositionService {
	
	public void create(Position position);
	
	public Position findById(Integer id);
	
	public void update(Position position);
	
	public void delete(Integer id);
	
	public List<Position> findAll();

}