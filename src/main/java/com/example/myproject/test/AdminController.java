package com.example.myproject.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	// 관리자 메인페이지
	@GetMapping("/admin")
	public String home() {
		return "admin/home";
	}

	// 관리자 사이트 통계 페이지
	@GetMapping("/admin/charts")
	public String charts() {
		return "admin/charts";
	}

	// 관리자 회원관리 페이지
	@GetMapping("/admin/user")
	public String user() {
		return "admin/user";
	}

	// 관리자 제품관리 페이지(정기구독, 침구)
	@GetMapping("/admin/product")
	public String product() {
		return "admin/product";
	}

	// 관리자 게시글관리 페이지(공지사항 페이지)
	@GetMapping("/admin/notice")
	public String notice() {
		return "admin/notice";
	}

	// 관리자 게시글관리 페이지(리뷰 페이지)
	@GetMapping("/admin/review")
	public String review() {
		return "admin/review";
	}
	//관리자 상품페이지내 리뷰관리페이지
	@GetMapping("/admin/comment")
	public String comment() {
		return "admin/comment";
	}
	//관리자 블로그 관리 페이지
	@GetMapping("/admin/blog")
	public String blog() {
		return "admin/blog";
	}
	//관리자 이벤트 관리 페이지
	@GetMapping("/admin/event")
	public String event() {
		return "admin/event";
	}

	// 관리자 로그인 페이지
	@GetMapping("/admin/login")
	public String login() {
		return "admin/login";
	}

	// 관리자 회원가입 페이지
	@GetMapping("/admin/join")
	public String join() {
		return "admin/join";
	}


}
