package com.example.myproject.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageControllerTest {
	
	@GetMapping("main")
	public String main(){
		return "main";
	}

	@GetMapping("joinForm")
	public String join() {
		return "/user/joinForm";
	}
	
	@GetMapping("loginForm")
	public String login() {
		return "/user/loginForm";
	}
	@GetMapping("updateForm")
	public String update() {
		return "/user/updateForm";
	}
	@GetMapping("qna")
	public String qna() {
		return "qna";
	}
	
	//상품
	//정기
	@GetMapping("subslist")
	public String subslist() {
		return "/board/product/subs/subslist";
	}
	@GetMapping("subsview")
	public String subsview() {
		return "/board/product/subs/subsview";
	}
	//침구
	@GetMapping("beddinglist")
	public String beddinglist() {
		return "/board/product/bedding/beddinglist";
	}
	@GetMapping("beddingview")
	public String beddingview() {
		return "/board/product/bedding/beddingview";
	}
	//공지사항
	@GetMapping("noticelist")
	public String noticelist() {
		return "/board/notice/noticelist";
	}
	@GetMapping("noticeinsert")
	public String noticeinsert() {
		return "/board/notice/noticeinsert";
	}
	
	//리뷰게시판
	@GetMapping("reviewlist")
	public String reviewlist() {
		return "/board/review/reviewlist";
	}
	
	//블로그
	@GetMapping("bloglist")
	public String bloglist() {
		return "/board/blog/bloglist";
	}
	@GetMapping("blogview")
	public String blogview() {
		return "/board/blog/blogview";
	}
	
	//이벤트
	@GetMapping("eventlist")
	public String eventlist() {
		return "/board/event/eventlist";
	}
	@GetMapping("eventview")
	public String eventview() {
		return "/board/event/eventview";
	}
	
	//카트
	@GetMapping("cart")
	public String cart() {
		return "cart";
	}
	
	//브랜드
	@GetMapping("brandstory")
	public String brandstory() {
		return "brandstory";
	}

}
