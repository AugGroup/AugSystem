package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Advertise;

@Repository(value = "advertiseRepository")
public class AdvertiseRepositoryImpl extends HibernateRepositoryImpl<Advertise, Serializable> implements AdvertiseRepository {

}
