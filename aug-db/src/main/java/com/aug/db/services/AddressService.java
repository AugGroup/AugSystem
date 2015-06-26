package com.aug.db.services;

import java.util.List;

import com.aug.db.dto.AddressDTO;
import com.aug.db.entities.Address;

public interface AddressService {
	
	public void create(Address address);

	public Address findById(Integer id);

	public void update(Address address);

	public void deleteById(Integer id);
	
	public void delete(Address address);
	
//	public AddressDTO saveAddress(AddressDTO addressDTO);

	public List<Address> findAll();
	
	public List<AddressDTO> findAddressById(Integer id);

	public AddressDTO findAddress(Integer id);
}
