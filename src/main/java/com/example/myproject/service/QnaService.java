package com.example.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.Qna;
import com.example.myproject.model.User;
import com.example.myproject.repository.QnaRepository;

@Service
public class QnaService {

	@Autowired
	private QnaRepository qrepository;
	
	//추가
	@Transactional 
	public void qinsert(Qna qna, User user) { 
		qna.setUser(user); 
		qrepository.save(qna);   
	}
	
	//전체보기
	public List<Qna> findAll(){
		return qrepository.findAll();
	}
	
	//갯수
	public Long count() {
		return qrepository.count(); 
	}
}
