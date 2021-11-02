package com.example.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.ProductBoard;
import com.example.myproject.model.User;
import com.example.myproject.repository.ProductboardRepository;

@Service
public class ProductboardService {
	
	@Autowired
	ProductboardRepository pbRepository;
	
		//추가
		@Transactional 
		public void pinsert(ProductBoard pboard, User user) { 
			pboard.setUser(user); 
			pbRepository.save(pboard);   
		}
		
		//전체보기
		public List<ProductBoard> findAll(){
			return pbRepository.findAll();
		}
		
		//전체보기(페이징)
		public Page<ProductBoard> findByProductCategory(String productCategory, 
				Pageable pageable){
			return pbRepository.findByProductCategory(productCategory, pageable);
		}
		
		//갯수
		public Long count() {
			return pbRepository.count(); 
		}
		
		//상세
		@Transactional
		public ProductBoard findById(Long productCode) { 
			ProductBoard pboard = pbRepository.findById(productCode).get(); 
			pboard.setProductHitcount(pboard.getProductHitcount()+1); //조회수증가
			return pboard; 
		}
		
		//수정
		@Transactional 
		public void pupdate(ProductBoard pboard) { 
			ProductBoard pb = pbRepository.findById(pboard.getProductCode()).get();
			pb.setProductTitle(pboard.getProductTitle());
			pb.setProductContent(pboard.getProductContent());
			pb.setProductPrice(pboard.getProductPrice());
			pb.setProductAmount(pboard.getProductAmount());
		}
		
		//삭제하기
		@Transactional
		public void delete(Long productCode) {
			pbRepository.deleteById(productCode); 
		}

}
