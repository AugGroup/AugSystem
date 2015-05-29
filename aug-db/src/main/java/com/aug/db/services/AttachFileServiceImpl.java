package com.aug.db.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.AttachFile;
import com.aug.db.repositories.AttachFileRepository;

@Service(value = "attachFileService")
@Transactional
public class AttachFileServiceImpl implements AttachFileService {

	@Autowired
	private AttachFileRepository attachFileRepository;

	public void create(AttachFile attachFile) {
		attachFileRepository.insert(attachFile);

	}

	public AttachFile findById(Integer id) {
		return attachFileRepository.findById(id);

	}

	public void update(AttachFile attachFile) {
		attachFileRepository.update(attachFile);

	}

	public void delete(AttachFile attachFile) {
		attachFileRepository.delete(attachFile);

	}

	public void deleteById(Integer id) {
		attachFileRepository.deleteById(id);

	}

	public List<AttachFile> findAll() {
		List<AttachFile> attachFiles = attachFileRepository.findAll();
		return attachFiles;
	}

}
