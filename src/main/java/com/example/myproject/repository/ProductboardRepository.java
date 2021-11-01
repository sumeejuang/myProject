package com.example.myproject.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myproject.model.ProductBoard;

public interface ProductboardRepository extends JpaRepository<ProductBoard, Long>{
	
	public Page<ProductBoard> findByProductCategory(String productCategory, Pageable pageable);

	
}
