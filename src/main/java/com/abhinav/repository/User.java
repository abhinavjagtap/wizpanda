package com.abhinav.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abhinav.model.StudentInfo;


public interface User extends JpaRepository<StudentInfo, Integer>{

}
