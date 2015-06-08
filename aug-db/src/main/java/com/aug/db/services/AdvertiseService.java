package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Advertise;
public interface AdvertiseService {
	
	public void create(Advertise advertise);

	public Advertise findById(Integer id);

	public void update(Advertise advertise);

	public void deleteById(Integer id);
	
	public void delete(Advertise advertise);

	public List<Advertise> findAll();
}