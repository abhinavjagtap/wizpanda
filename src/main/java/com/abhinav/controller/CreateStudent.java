package com.abhinav.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.abhinav.dao.ProjectDAO;
import com.abhinav.handler.Validate;
import com.abhinav.model.StudentInfo;
import com.abhinav.repository.User;


@RestController
@RequestMapping("student")
public class CreateStudent {
	 @Autowired
	 User user;
	
	 @RequestMapping(value = "create", produces = "application/json", method=RequestMethod.POST)
	  public  StudentInfo addNewStud ( String name
	      ,  String email ,  String mobileno,  String password) {
		StudentInfo s = new StudentInfo();
	    ProjectDAO dao=new ProjectDAO();
	    dao.createStudent(name,email,mobileno,password,user,s);
	    return s;
	  }	
	 
	 
	 @RequestMapping(value = "checkEmailId", produces = "application/json", method=RequestMethod.GET)
	  public  Validate checkEmail(String emailid) {
		StudentInfo s  = user.findByEmail(emailid);
		Validate validate=new Validate();
		if (s == null) {
			validate.setPresent("0");
		}else {
			validate.setPresent("1");
		}
		return validate;
	  }
	 
	 @RequestMapping(value = "checkMobileNo", produces = "application/json", method=RequestMethod.GET)
	  public  Validate checkMobileNo(String mobno) {
		StudentInfo s  = user.findByMobile(mobno);
		Validate validate=new Validate();
		if (s == null) {
			validate.setPresent("0");
		}else {
			validate.setPresent("1");
		}
	    return validate;
	  }
	
}
