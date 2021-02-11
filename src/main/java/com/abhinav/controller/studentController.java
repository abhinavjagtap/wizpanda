package com.abhinav.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.abhinav.model.StudentInfo;
import com.abhinav.repository.User;


@RestController
public class studentController {

	@Autowired
	User user;
	
	@RequestMapping(value = "students", produces = "application/json", method=RequestMethod.GET)
	  public  ArrayList<StudentInfo> studentData() {
		ArrayList<StudentInfo> s  = user.studentDetails();
		return s;
	  }
	
}
