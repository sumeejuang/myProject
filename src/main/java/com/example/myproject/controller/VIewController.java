package com.example.myproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.myproject.config.auth.PrincipalDetails;
import com.example.myproject.model.Qna;
import com.example.myproject.service.QnaService;

@Controller
public class VIewController {
	
	@Autowired
	private QnaService qService; //큐엔에이

	
	//메인
	@GetMapping("main")
	public String main(){
		return "main";
	}
	//브랜드
	@GetMapping("brandstory")
	public String brandstory() {
		return "brandstory";
	}

	
	
	//큐앤에이폼
	@GetMapping("qna")
	public String qna() {
		return "qna";
	}
	//입력
	@PostMapping("qnainsert")
	public String qnainsert(Qna qna,
			@AuthenticationPrincipal PrincipalDetails principal) {
		qService.qinsert(qna,principal.getUser());
		return "qna";
	}
	
	
	
	//카트
	@GetMapping("cart")
	public String cart() {
		return "cart";
	}
	//주문
	


}
