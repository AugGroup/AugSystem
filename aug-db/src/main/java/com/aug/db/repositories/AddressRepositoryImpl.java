package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.AddressDTO;
import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Address;

@Repository(value = "addressRepository")
@Transactional
public class AddressRepositoryImpl extends HibernateRepositoryImpl<Address, Serializable> implements AddressRepository {
	
	@Override
	public List<AddressDTO> findAddressById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ADDRESS");
		query.setParameter("ID", id);
		List<AddressDTO> result = query.list();
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}
	
	@Override
	public AddressDTO findByAddressId(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ADDRESS_ID");
		query.setParameter("ID", id);
		List<AddressDTO> result = query.list();
		AddressDTO app = result.get(0);
		return app;
	}
	
	@Override
	public List<AddressDTO> findALLAddressById() {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ADDRESS_ALL");
		List<Address> result = query.list();
		List<AddressDTO> addrDto = convert(result);
		for(AddressDTO addr : addrDto){
			System.out.println("ADDRESS :: " + addr.getHouseNo());
		}
		
		System.out.println("QUERYADDRESS :: " + result);
		return addrDto;
	}
	
	private List<AddressDTO> convert(List<Address> address){
		AddressDTO addrDto = new AddressDTO();
		for(Address addr : address){
			addrDto.setId(addr.getId());
			addrDto.setAddressType(addr.getAddressType());
			addrDto.setHouseNo(addr.getHouseNo());
			addrDto.setDistrict(addr.getDistrict());
			addrDto.setSubDistrict(addr.getSubDistrict());
			addrDto.setRoad(addr.getRoad());
			addrDto.setProvince(addr.getProvince());
			addrDto.setZipcode(addr.getZipcode());
		}
		List<AddressDTO> listAddr = new ArrayList<AddressDTO>();
		listAddr.add(addrDto);		
		return listAddr;
	}
}
