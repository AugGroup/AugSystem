package com.aug.db.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.Position;
import com.aug.db.repositories.PositionRepository;
@Service(value = "positionService")
@Transactional
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionRepository positionRepository;
	
	@Rollback(value = false)
	public void create(Position position) {
		positionRepository.insert(position);
	}

	public Position findById(Integer id) {
		return positionRepository.findById(id);
	}

	@Rollback(value = false)
	public void update(Position position) {
		positionRepository.update(position);		
	}

	@Rollback(value = false)
	public void delete(Integer id) {
		positionRepository.delete(id);
	}

	public List<Position> findAll() {
		List<Position> positions = positionRepository.findAll();
		return positions;
	}

}
