package com.example.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.EventBoard;
import com.example.myproject.model.User;
import com.example.myproject.repository.EventboardRepository;

@Service
public class EventboardService {
	
	@Autowired
	EventboardRepository ebRepository;
	
	//추가
		@Transactional 
		public void einsert(EventBoard eboard, User user) { 
			eboard.setUser(user); 
			ebRepository.save(eboard);   
		}
		
		//전체보기
		public List<EventBoard> findAll(){
			return ebRepository.findAll();
		}
		
		//전체보기(페이징)
		public Page<EventBoard> findAll(Pageable pageable){
			return ebRepository.findAll(pageable);
		}
		
		//갯수
		public Long count() {
			return ebRepository.count(); 
		}
		
		//상세
		@Transactional 
		public EventBoard findById(Long eventCode) { 
			EventBoard eboard = ebRepository.findById(eventCode).get(); 
			eboard.setEventHitcount(eboard.getEventHitcount()+1); //조회수증가
			return eboard; 
		}
		
		//수정
		@Transactional 
		public void eupdate(EventBoard eboard) { 
			EventBoard eb = ebRepository.findById(eboard.getEventCode()).get();
			eb.setEventTitle(eboard.getEventTitle());
			eb.setEventContent(eboard.getEventContent());
			eb.setImageContent(eboard.getImageContent());
		}
		
		//삭제하기
		@Transactional
		public void delete(Long eventCode) {
			ebRepository.deleteById(eventCode); 
		}
	

}
