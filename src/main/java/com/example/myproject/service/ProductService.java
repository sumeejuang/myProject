package com.example.myproject.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.NoticeBoard;

public class ProductService {
	
	//전체보기(페이징)
	public Page<Product> findByCategory(Long categorycode, Pageable pageable){
		
		return pRepository.findByCategory(categorycode,pageable);
	}
	
	//갯수
	public Long countByCategory(Long categorycode) {
		return pRepository.count(categorycode); 
	}
	
	
	//상세
	@Transactional //(조회수)db에 반영되어진 내용들이 view단까지 반영될 수 있도록 설정
	public NoticeBoard findById(Long noticeCode) { 
		NoticeBoard nboard = nbRepository.findById(noticeCode).get(); 
		nboard.setNoticeHitcount(nboard.getNoticeHitcount()+1); //조회수증가
		return nboard; 
	}

}
