package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Position;

@Repository(value = "positionRepository")
public class PositionRepositoryImpl extends HibernateRepositoryImpl<Position, Serializable> implements PositionRepository {
	
}