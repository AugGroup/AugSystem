package com.aug.db.services;

import java.util.List;

import com.aug.db.entities.AttachFile;

public interface AttachFileService {
	
	public void create(AttachFile attachFile);
	
	public AttachFile findById(Integer id);
	
	public void update(AttachFile attachFile);
	
	public void delete(AttachFile attachFile);
	
	public void deleteById(Integer id);
	
	public List<AttachFile> findAll();

}