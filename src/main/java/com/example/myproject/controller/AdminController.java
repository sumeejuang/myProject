package com.example.myproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.myproject.config.auth.PrincipalDetails;
import com.example.myproject.model.NoticeBoard;
import com.example.myproject.model.User;
import com.example.myproject.service.NoticeboardService;
import com.example.myproject.service.UserService;

@Controller
public class AdminController { //관리자
	
	@Autowired
	private UserService userservice; //관리자권한부여
	
	@Autowired
	private NoticeboardService nbService; //공지사항

	// 관리자 메인페이지
	@GetMapping("/admin")
	public String home() {
		return "/admin/home";
	}
	
	//관리자 회원정보리스트
	@GetMapping("/admin/user")
	public String userlist(Model model) {
		model.addAttribute("list",userservice.findAll()); 
		model.addAttribute("count",userservice.count());
		return "/admin/user";
	} 
	
	//관리자부여
	@PutMapping("role")
	@ResponseBody //문자열
	public String role(@RequestBody User data) {
		userservice.updateRole(data);
		return "success";	
	}
	
	//공지사항
	//추가폼
	@GetMapping("noticeinsert")
	public String noticeForm() {
		return "/board/notice/noticeinsert";
	}
	//전체보기(어드민)
	@GetMapping("/admin/notice")
	public String noticelist(Model model) {
		model.addAttribute("lists",nbService.findAll());
		model.addAttribute("count",nbService.count());
		return "/admin/notice";
	}
	//추가하기
	@PostMapping("noticeinsert")
	public String noticeinsert(NoticeBoard nboard,
			@AuthenticationPrincipal PrincipalDetails principal) { //인증객체
		nbService.ninsert(nboard, principal.getUser());
		return "redirect:/admin/notice";
	}
	
	//수정폼
	@GetMapping("noticeupdate/{noticeCode}")
	public String noticeupdate(@PathVariable Long noticeCode, Model model) {
		model.addAttribute("nboard",nbService.findById(noticeCode));
		return "/board/notice/noticeupdate";
	}
	
	//수정하기
	@PutMapping("noticeupdate")
	@ResponseBody //문자열
	public String update(@RequestBody NoticeBoard nboard) { 
		nbService.update(nboard);
		return "success";
	}
	
	//삭제하기
	@DeleteMapping("noticedelete/{noticeCode}")
	@ResponseBody //문자열
	public String delete(@PathVariable Long noticeCode) {
		nbService.delete(noticeCode); 
		return "success";
	}
	
	
	
	
	// 관리자 제품관리 페이지(정기구독, 침구)
	@GetMapping("/admin/product")
	public String product() {
		return "/admin/product";
	}


	// 관리자 게시글관리 페이지(리뷰 페이지)
	@GetMapping("/admin/review")
	public String review() {
		return "/admin/review";
	}
	//관리자 상품페이지내 리뷰관리페이지
	@GetMapping("/admin/comment")
	public String comment() {
		return "/admin/comment";
	}
	//관리자 블로그 관리 페이지
	@GetMapping("/admin/blog")
	public String blog() {
		return "/admin/blog";
	}
	//관리자 이벤트 관리 페이지
	@GetMapping("/admin/event")
	public String event() {
		return "/admin/event";
	}

	// 관리자 사이트 통계 페이지
	@GetMapping("/admin/charts")
	public String charts() {
		return "/admin/charts";
	}

}
