package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Address;

public interface AddressRepository extends GenericRepository<Address, Serializable> {
	
	public List<Address> findAddressById(Integer id);
}
