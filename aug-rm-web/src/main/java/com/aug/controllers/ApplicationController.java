package com.aug.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aug.db.entities.Department;
import com.aug.db.entities.Position;
import com.aug.db.services.DepartmentService;
import com.aug.db.services.PositionService;

@Controller
public class ApplicationController {
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PositionService positionService;

	@RequestMapping(value = "/application", method = { RequestMethod.GET })
	public String application() {
		return "application";

	}

	@ModelAttribute("departments")
	@Transactional
	public List<Department> departmentList() {
		System.out.println(departmentService.findAll());
		return departmentService.findAll();
	}

	@ModelAttribute("positions")
	@Transactional
	public List<Position> positionList() {
		System.out.println(positionService.findAll());
		return positionService.findAll();
	}

}
