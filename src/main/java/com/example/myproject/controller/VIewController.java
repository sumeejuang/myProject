package com.example.myproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.myproject.service.UserService;

@Controller
public class VIewController {

	
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
	
	
	//큐앤에이
	@GetMapping("qna")
	public String qna() {
		return "qna";
	}
	
	//카트
	@GetMapping("cart")
	public String cart() {
		return "cart";
	}
	//주문
	

	
	
	
	

}
