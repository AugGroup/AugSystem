package com.aug.db.sevices;

import java.util.List;

import com.aug.db.entities.Address;

public interface AddressService {
	
	public void create(Address address);

	public Address findById(Integer id);

	public void update(Address address);

	public void delete(Address address);
	
	public void deleteById(Integer id);

	public List<Address> findAll();
}
