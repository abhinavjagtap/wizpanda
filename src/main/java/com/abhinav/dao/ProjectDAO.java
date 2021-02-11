package com.abhinav.dao;

import com.abhinav.model.StudentInfo;
import com.abhinav.repository.User;
import com.abhinav.utils.Utils;


public class ProjectDAO {
   
	
    
	public String createStudent(String name, String email, String mobileno, String password, User user, StudentInfo s) {
		try {
		    s.setName(name);
		    s.setEmailid(email);
		    s.setMobileno(mobileno);
		    s.setPassword(Utils.hashString(password));
		    user.save(s);
		    return "Saved";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
