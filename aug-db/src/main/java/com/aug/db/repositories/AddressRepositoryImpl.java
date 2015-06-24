package com.aug.db.repositories;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.aug.db.dto.AddressDTO;
import com.aug.db.entities.Address;

@Repository(value = "addressRepository")
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
