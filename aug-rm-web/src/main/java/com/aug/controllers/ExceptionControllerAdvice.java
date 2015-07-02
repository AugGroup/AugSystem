package com.aug.controllers;

import java.util.zip.DataFormatException;

import javax.servlet.http.HttpServletResponse;

import org.hibernate.exception.SQLGrammarException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControllerAdvice {
	
	//IOException
	/*@ExceptionHandler(IOException.class)
	public ModelAndView exception(IOException e){
		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("nameException", e.getClass().getSimpleName());
		mav.addObject("message", e.getMessage());
		return mav;
	}*/
	
	//Exception (all)
	@ExceptionHandler(Exception.class)
	public ModelAndView exception(Exception e){
		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("nameException", e.getClass().getSimpleName()+"eie");
		mav.addObject("message", e.getMessage());
		return mav;
	}
	
	
	//404 page not found
	@ExceptionHandler(DataFormatException.class)
	@ResponseStatus(value = HttpStatus.NOT_FOUND)//, reason = "My Response Status Change….!! 404")
	public ModelAndView handleDataFormatException(DataFormatException ex,
		      HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("nameException", ex.getClass().getSimpleName());
		mav.addObject("message", ex.getMessage());
		return mav;

		  }
	
	  @ExceptionHandler(SQLGrammarException.class)//({SQLException.class,DataAccessException.class}
	  public ModelAndView databaseError(SQLGrammarException e) {
		  ModelAndView mav = new ModelAndView("exception");
			mav.addObject("nameException", e.getClass().getSimpleName());
			mav.addObject("message", e.getMessage());
			return mav;
	  }
}

