package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Position;

public interface PositionService {
	
	public void create(Position position);
	
	public Position findById(Integer id);
	
	public void update(Position position);
	
	public void deleteById(Integer id);
	
	public void delete(Position position);
	
	public List<Position> findAll();

}