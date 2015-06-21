package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Address;

public interface AddressRepository extends GenericRepository<Address, Serializable> {
	
	public List<AddressDTO> findAddressById(Integer id);
	
	public List<AddressDTO> findALLAddressById();
	
	public AddressDTO findByAddressId(Integer id);
}
