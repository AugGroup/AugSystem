package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Address;


@Repository(value = "addressRepository")
public class AddressRepositoryImpl extends HibernateRepositoryImpl<Address, Serializable> implements AddressRepository {

}
