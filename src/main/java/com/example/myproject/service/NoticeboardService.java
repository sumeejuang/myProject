package com.example.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.NoticeBoard;
import com.example.myproject.model.User;
import com.example.myproject.repository.NoticeboardRepository;

@Transactional(readOnly = true)
@Service
public class NoticeboardService {
	
	@Autowired
	private NoticeboardRepository nbRepository;
	
	//추가
	@Transactional 
	public void ninsert(NoticeBoard nboard, User user) { 
		nboard.setUser(user); 
		nbRepository.save(nboard);   
	}
	
	//전체보기
	public List<NoticeBoard> findAll(){
		return nbRepository.findAll();
	}
	
	//전체보기(페이징)
	public Page<NoticeBoard> findAll(Pageable pageable){
		return nbRepository.findAll(pageable);
	}
	
	//갯수
	public Long count() {
		return nbRepository.count(); 
	}
	
	//상세
	@Transactional //(조회수)db에 반영되어진 내용들이 view단까지 반영될 수 있도록 설정
	public NoticeBoard findById(Long noticeCode) { 
		NoticeBoard nboard = nbRepository.findById(noticeCode).get(); 
		nboard.setNoticeHitcount(nboard.getNoticeHitcount()+1); //조회수증가
		return nboard; 
	}
	
	//수정
	@Transactional 
	public void update(NoticeBoard nboard) { //수정될값
		// nb 수정전데이터에 set함 
		NoticeBoard nb = nbRepository.findById(nboard.getNoticeCode()).get();
		nb.setNoticeTitle(nboard.getNoticeTitle());
		nb.setNoticeContent(nboard.getNoticeContent());
	}
	
	//삭제하기
	@Transactional
	public void delete(Long noticeCode) {
		nbRepository.deleteById(noticeCode); 
	}

}
