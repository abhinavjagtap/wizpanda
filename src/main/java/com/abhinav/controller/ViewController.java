package com.abhinav.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/")
public class ViewController {

//	public ViewController() {
//		// TODO Auto-generated constructor stub
//	}
	@RequestMapping(name ="/",method=RequestMethod.GET)
	public ModelAndView homePage() {
		try {
			ModelAndView andView =new ModelAndView();
			andView.setViewName("login");
			return andView;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}	
}
