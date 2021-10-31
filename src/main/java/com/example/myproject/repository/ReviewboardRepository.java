package com.example.myproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myproject.model.ReviewBoard;

public interface ReviewboardRepository extends JpaRepository<ReviewBoard, Long>{
	
	

}
