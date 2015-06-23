package com.aug.db.services;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.dto.SkillDTO;
import com.aug.db.entities.Address;
import com.aug.db.repositories.AddressRepository;


@Service(value = "addressService")
@Transactional
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressRepository addressRepository;
	
	@Override
	public Address findById(Integer id) {
		return addressRepository.findById(id);
	}

	@Override
	public void create(Address address) {
		addressRepository.insert(address);
		
	}

	@Override
	public void update(Address address) {
		addressRepository.update(address);
		
	}

	@Override

	public void delete(Address address) {
		addressRepository.delete(address);
		
	}
	
	@Override
	public void deleteById(Integer id) {
		addressRepository.deleteById(id);

	}

	@Override
	public List<Address> findAll() {
		List<Address> addressList = addressRepository.findAll();
		return addressList;
	}

	@Override
	public List<AddressDTO> findAddressById(Integer id) {
		List<AddressDTO> addresses = addressRepository.findAddressById(id);
		return addresses;
	}

	@Override
	public AddressDTO findAddress(Integer id) {
		AddressDTO address = addressRepository.findByAddressId(id);
		return address;
	}
}
