package com.example.myproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myproject.model.ProductBoard;

public interface ProductboardRepository extends JpaRepository<ProductBoard, Long>{
	
	@Query("select sc from nComment sc join fetch sc.nBoard where notice_code=?1")  
	public List<Category> findByBnum(Long noticeCode);
	
}
