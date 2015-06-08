package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Advertise;
import com.aug.db.repositories.AdvertiseRepository;

@Service(value = "advertiseService")
@Transactional
public class AdvertiseServiceImpl implements AdvertiseService {
	@Autowired
	private AdvertiseRepository advertiseRepository;

	@Override
	public void create(Advertise advertise) {
		advertiseRepository.insert(advertise);
	}

	@Override
	public Advertise findById(Integer id) {
		return advertiseRepository.findById(id);

	}

	@Override
	public void update(Advertise advertise) {
		advertiseRepository.update(advertise);

	}

	@Override
	public void deleteById(Integer id) {
		advertiseRepository.deleteById(id);
	}

	@Override
	public void delete(Advertise advertise) {
		advertiseRepository.delete(advertise);
	}

	@Override
	public List<Advertise> findAll() {
		List<Advertise> advertises = advertiseRepository.findAll();
		return advertises;
	}

}
