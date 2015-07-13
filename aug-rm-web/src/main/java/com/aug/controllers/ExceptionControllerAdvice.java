package com.aug.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.exception.SQLGrammarException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControllerAdvice {
	//BAD_REQUEST(400, "Bad Request")
	//NOT_FOUND(404, "Not Found")
	//UNSUPPORTED_MEDIA_TYPE(415, "Unsupported Media Type")
	//INTERNAL_SERVER_ERROR(500, "Internal Server Error")
	

	
	
	//IOException
	/*@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="IOException occured")
	@ExceptionHandler(IOException.class)
	public ModelAndView exception(IOException e){
		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("nameException", e.getClass().getSimpleName());
		mav.addObject("message", e.getMessage());
		return mav;
	}*/
	
	/*
	//Exception (all) 500
	@ExceptionHandler(Exception.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public ModelAndView exception(Exception e){
		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("nameException", e.getClass().getSimpleName()+" eie");
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
	
	//SQLGrammarException
	  @ExceptionHandler(SQLGrammarException.class)//{SQLGrammarException.class,DataAccessException.class}
	  public ModelAndView databaseError(SQLGrammarException e) {
		  ModelAndView mav = new ModelAndView("exception");
			mav.addObject("nameException", e.getClass().getSimpleName());
			mav.addObject("message", e.getMessage());
			return mav;
	  }
	  
	//NullPointerException 400
	  @ExceptionHandler(NullPointerException.class)
	  public ModelAndView handleNullPointerException(NullPointerException e) {
		  ModelAndView mav = new ModelAndView("exception");
			mav.addObject("nameException", e.getClass().getSimpleName());
			mav.addObject("message", e.getMessage());
			return mav;
	  }
	  
	//ParseException
	  @ExceptionHandler(ParseException.class)
	  public ModelAndView handleParseException(ParseException e) {
		  ModelAndView mav = new ModelAndView("exception");
			mav.addObject("nameException", e.getClass().getSimpleName());
			mav.addObject("message", e.getMessage());
			return mav;
	  }
	  */
	
	// IllegalArgumentException with ajax //INTERNAL_SERVER_ERROR(500,
	// "Internal Server Error"),
	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public ExceptionVO handleException5(IllegalArgumentException ex,
			HttpServletResponse response) throws IOException {
		ExceptionVO exceptionVO = new ExceptionVO(ex.getMessage());
		return exceptionVO;
	}

	// IndexOutOfBoundsException with ajax //INTERNAL_SERVER_ERROR(500)
	// "Internal Server Error"),
	@ExceptionHandler(IndexOutOfBoundsException.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public ExceptionVO handleException9(IndexOutOfBoundsException ex,
			HttpServletResponse response) throws IOException {
		ExceptionVO exceptionVO = new ExceptionVO("Exception as JSON data (request not found) IndexOutOfBoundsException");
		System.out.println(ex.getMessage());
		return exceptionVO;
	}

	// SQLGrammarException with ajax
	// INTERNAL_SERVER_ERROR(500, "Internal Server Error"),
	@ExceptionHandler(SQLGrammarException.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public ExceptionVO handleException7(SQLGrammarException ex,
			HttpServletResponse response) throws IOException {
		ExceptionVO exceptionVO = new ExceptionVO("Exception as JSON data (Could not execute query)");
		return exceptionVO;
	}
	
	// SQLException 
	@ExceptionHandler(SQLException.class)
	@ResponseBody
	public ModelAndView handleException7(HttpServletRequest request, Exception ex) throws IOException {
		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("nameException", ex.getClass().getSimpleName());
		mav.addObject("message", ex.getMessage());
		return mav;
	}

	// BadRequest 400
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public ExceptionVO handleBadRequest(Exception ex,
			HttpServletResponse response) throws IOException {
		ExceptionVO exceptionVO = new ExceptionVO("Exception as JSON data (Could not read JSON)");
		return exceptionVO;
	}
	   
	    
	    
}
//Exception>RuntimeException>IllegalArgumentException>DataformatException
