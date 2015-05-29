package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Position;
import com.aug.db.repositories.PositionRepository;

@Service(value = "positionService")
@Transactional
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionRepository positionRepository;


	public void create(Position position) {
		positionRepository.insert(position);
	}

	public Position findById(Integer id) {
		return positionRepository.findById(id);
	}

	
	public void update(Position position) {
		positionRepository.update(position);
	}

	@Override
	public void delete(Position position) {
		positionRepository.delete(position);

	}

	@Override
	public void deleteById(Integer id) {
		positionRepository.deleteById(id);

	}

	public List<Position> findAll() {
		List<Position> positions = positionRepository.findAll();
		return positions;
	}

}
