package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Address;


@Service(value = "addressService")
@Transactional
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressService addressService;
	
	@Override
	public Address findById(Integer id) {
		return addressService.findById(id);
	}

	@Override
	public void create(Address address) {
		addressService.create(address);
		
	}

	@Override
	public void update(Address address) {
		addressService.update(address);
		
	}

	@Override
	public void delete(Integer id) {
		addressService.delete(id);
		
	}

	@Override
	public List<Address> findAll() {
		List<Address> addressList = addressService.findAll();
		return addressList;
	}
	

}
