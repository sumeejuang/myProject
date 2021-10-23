package com.example.myproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {


	@GetMapping("/home") //뒷주소표시 함수이름 주소랑 동일시하는것이 좋음
	public String home() {
		return "home"; //viewresolver실행
	}
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	// /WEB-INF/views/(프리픽스)user/login.jsp(써픽스) -> return "user/login" 
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String login(String username, String password) { //(바디데이터)매개변수 input의 name값
		//매개변수 변수를 x-www http바디데이터를 받아서 스프링이 parsing해서 넣어줌 =디스페쳐서블릿역할 (request.getparameter(name))
		//@RequestBody String data - 받은 데이터 그대로 달라 
		System.out.println(username);
		//System.out.println(data); //application/x-www-form-urlencoded 형식
		return "home";
	}
}
