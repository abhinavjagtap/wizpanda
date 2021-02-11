package com.abhinav.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.abhinav.model.StudentInfo;

@Repository
public interface User extends JpaRepository<StudentInfo, Integer>{

	 @Query("select s from StudentInfo s where s.emailid = ?1")
	 StudentInfo findByEmail(String emailid);
	 
	 
	 @Query("select s from StudentInfo s where s.mobileno = ?1")
	 StudentInfo findByMobile(String mobno);
	 
	 @Query("select s from StudentInfo s where s.emailid = ?1 AND s.password = ?2")
	 StudentInfo loginDetails(String emailid,String password);
	 
	 @Query("select s from StudentInfo s")
	 ArrayList<StudentInfo> studentDetails();
}
