package com.example.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.ReviewBoard;
import com.example.myproject.model.User;
import com.example.myproject.repository.ReviewboardRepository;


@Service
public class ReviewboardService {
	
	@Autowired
	private ReviewboardRepository rbRepository;
	
	//추가
	@Transactional 
	public void rinsert(ReviewBoard rboard, User user) { 
		rboard.setUser(user); 
		rbRepository.save(rboard);   
	}
	
	//전체보기
	public List<ReviewBoard> findAll(){
		return rbRepository.findAll();
	}
	
	//전체보기(페이징)
	public Page<ReviewBoard> findAll(Pageable pageable){
		return rbRepository.findAll(pageable);
	}
	
	//갯수
	public Long count() {
		return rbRepository.count(); 
	}
	
	//상세
	@Transactional //(조회수)db에 반영되어진 내용들이 view단까지 반영될 수 있도록 설정
	public ReviewBoard findById(Long ReviewCode) { 
		ReviewBoard rboard = rbRepository.findById(ReviewCode).get(); 
		return rboard; 
	}
	
	//수정
	@Transactional 
	public void rupdate(ReviewBoard rboard) { //수정될값
		// nb 수정전데이터에 set함 
		ReviewBoard rb = rbRepository.findById(rboard.getReviewCode()).get();
		rb.setReviewTitle(rboard.getReviewTitle());
		rb.setReviewContent(rboard.getReviewContent());
		rb.setReviewStar(rboard.getReviewStar());
	}
	
	//삭제하기
	@Transactional
	public void rdelete(Long reviewCode) {
		rbRepository.deleteById(reviewCode); 
	}


}
