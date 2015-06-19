package com.aug.db.repositories;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.ApplicantDTO;
import com.aug.db.dto.ApplicationDTO;
import com.aug.db.entities.Address;

@Repository(value = "addressRepository")
@Transactional
public class AddressRepositoryImpl extends HibernateRepositoryImpl<Address, Serializable> implements AddressRepository {
	
	@Override
	public List<Address> findAddressById(Integer id) {
		Query query = getCurrentSession().getNamedQuery("SEARCH_ADDRESS");
		query.setParameter("ID", id);
		List<Address> result = query.list();
//		ApplicationDTO app = result.get(0);
		System.out.println("QUERYADDRESS :: " + result);
		return result;
	}
}
