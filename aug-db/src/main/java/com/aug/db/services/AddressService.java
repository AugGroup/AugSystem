package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.Address;

public interface AddressService {
	
	public void create(Address address);

	public Address findById(Integer id);

	public void update(Address address);

	public void delete(Integer id);

	public List<Address> findAll();
}
