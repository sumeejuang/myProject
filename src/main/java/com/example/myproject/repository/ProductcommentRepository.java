package com.example.myproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myproject.model.NoticeComment;
import com.example.myproject.model.ProductComment;

public interface ProductcommentRepository extends JpaRepository<ProductComment, Long>{
	@Query("select sc from pComment sc join fetch sc.pBoard where product_code=?1")  
	public List<ProductComment> findBypBnum(Long productCode);

}
