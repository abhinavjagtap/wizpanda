package com.abhinav.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.abhinav.handler.Validate;
import com.abhinav.model.StudentInfo;
import com.abhinav.repository.User;
import com.abhinav.utils.Utils;


@RestController
public class LoginController {

	@Autowired
	User user;
	
	@RequestMapping(value = "login", produces = "application/json", method=RequestMethod.GET)
	  public  Validate checkEmail(String emailid,String password) {
		StudentInfo s  = user.loginDetails(emailid, Utils.hashString(password));
		Validate validate=new Validate();
		if (s == null) {
			validate.setPresent("0");
		}else {
			validate.setPresent("1");
		}
		return validate;
	  }
}
