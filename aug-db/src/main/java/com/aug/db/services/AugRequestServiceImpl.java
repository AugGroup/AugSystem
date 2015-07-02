/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.dto.AugRequestDTO;
import com.aug.db.entities.AugRequest;
import com.aug.db.repositories.AugRequestRepository;
import com.aug.db.repositories.PositionRepository;

/**
 *
 * @author Supannika Pattanodom
 */
@Service(value = "AugRequestService")
@Transactional
public class AugRequestServiceImpl implements AugRequestService {

	@Autowired
	AugRequestRepository augRequestRepository;

	@Autowired
	private PositionRepository positionRepository;

	@Override
	public AugRequest findById(Integer augRequestId) {
		return augRequestRepository.findById(augRequestId);
	}

	@Override
	public void create(AugRequest augRequest) {
		augRequestRepository.insert(augRequest);
	}

	@Override
	public void delete(AugRequest augRequest) {
		augRequestRepository.delete(augRequest);
	}

	@Override
	public void deleteById(Integer id) {
		augRequestRepository.deleteById(id);

	}

	@Override
	public void update(AugRequest augRequest) {
		augRequestRepository.update(augRequest);
	}

	@Override
	public List<AugRequest> findAll() {
		List<AugRequest> augRequests = augRequestRepository.findAll();
		return augRequests;
	}

	@Override
	public List<AugRequestDTO> findAllAugRequest() {
		List<AugRequestDTO> augRequests = augRequestRepository
				.findAllAugRequest();
		for (AugRequestDTO augRequest : augRequests) {
			String positionStr = positionRepository.findById(
					augRequest.getPositionRequest()).getPositionName();
			augRequest.setPositionStr(positionStr);
		}
		return augRequests;
	}

	@Override
	public AugRequestDTO findAugRequestById(Integer id) {
		AugRequestDTO augRequest = augRequestRepository.findAugRequestById(id);
		String positionStr = positionRepository.findById(id).getPositionName();
		augRequest.setPositionStr(positionStr);

		return augRequest;
	}

	@Override
	public AugRequestDTO findAugRequestByIdTest(Integer id) {
		AugRequestDTO augRequest = augRequestRepository.findAugRequestByIdTest(id);
		String positionStr = positionRepository.findById(id).getPositionName();
		augRequest.setPositionStr(positionStr);

		return augRequest;
	}

}
