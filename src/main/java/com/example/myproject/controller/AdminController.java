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
import com.example.myproject.model.EventBoard;
import com.example.myproject.model.NoticeBoard;
import com.example.myproject.model.ProductBoard;
import com.example.myproject.model.User;
import com.example.myproject.service.EventboardService;
import com.example.myproject.service.NoticeboardService;
import com.example.myproject.service.ProductboardService;
import com.example.myproject.service.ReviewboardService;
import com.example.myproject.service.UserService;

@Controller
public class AdminController { //관리자
	
	@Autowired
	private UserService userservice; //관리자권한부여
	@Autowired
	private NoticeboardService nbService; //공지사항
	@Autowired
	private ReviewboardService rbService; //리뷰
	@Autowired
	private EventboardService ebService; //이벤트
	@Autowired
	private ProductboardService pbService; //제품

	
	
	// 관리자 메인페이지
	@GetMapping("/admin")
	public String home() {
		return "/admin/home";
	}
	
	
	//회원
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
	//전체보기(어드민)
	@GetMapping("/admin/notice")
	public String noticelist(Model model) {
		model.addAttribute("lists",nbService.findAll());
		model.addAttribute("count",nbService.count());
		return "/admin/notice";
	}
	//추가폼
	@GetMapping("noticeinsert")
	public String noticeForm() {
		return "/board/notice/noticeinsert";
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
	public String noticeupdate(@RequestBody NoticeBoard nboard) { 
		nbService.update(nboard);
		return "success";
	}	
	//삭제하기
	@DeleteMapping("noticedelete/{noticeCode}")
	@ResponseBody //문자열
	public String noticedelete(@PathVariable Long noticeCode) {
		nbService.delete(noticeCode); 
		return "success";
	}
	
	
	
	//리뷰게시판
	//전체보기(어드민)
	@GetMapping("/admin/review")
	public String reviewlist(Model model) {
		model.addAttribute("lists",rbService.findAll());
		model.addAttribute("count",rbService.count());
		return "/admin/review";
	}
	
	
	
	//이벤트게시판
	//전체보기(어드민)
	@GetMapping("/admin/event")
	public String event(Model model) {
		model.addAttribute("lists",rbService.findAll());
		model.addAttribute("count",rbService.count());
		return "/admin/event";
	}
	//추가폼
	@GetMapping("eventinsert")
	public String eventinsertForm() {
		return "/board/event/eventinsert";
	}
	//추가하기
	@PostMapping("eventinsert")
	public String eventinsert(EventBoard eboard,
			@AuthenticationPrincipal PrincipalDetails principal) {
		ebService.einsert(eboard, principal.getUser());
		return "/board/event/eventinsert";
	}
	//수정폼
	@GetMapping("eventupdate/{eventcode}")
	public String eventupdate(@PathVariable Long eventcode, 
			Model model) {
		model.addAttribute("eboard",ebService.findById(eventcode));
		return "/board/event/eventupdate";
	}
	//수정하기
	@PutMapping("eventupdate")
	@ResponseBody
	public String eventupdate(@RequestBody EventBoard eboard) {
		ebService.eupdate(eboard);
		return "success";
	}
	//삭제하기
	@DeleteMapping("eventdelete/{eventcode}")
	@ResponseBody //문자열
	public String delete(@PathVariable Long eventcode) {
		ebService.delete(eventcode); 
		return "success";
	}
	
	
	
	
	
	//제품관리(정기구독, 침구) 
	//전체보기(어드민)
	@GetMapping("/admin/product")
	public String product(Model model) {
		model.addAttribute("lists",pbService.findAll());
		model.addAttribute("count",pbService.count());
		return "/admin/product";
	}
	//추가폼
	@GetMapping("productinsert")
	public String productinsertForm() {
		return "/board/product/productinsert";
	}
	//추가
	@PostMapping("productinsert")
	public String productinsert(ProductBoard pboard,
			@AuthenticationPrincipal PrincipalDetails principal) {
		pbService.pinsert(pboard, principal.getUser());
		return "/board/product/productinsert";
	}
	//수정폼
	@GetMapping("productupdate/{productCode}")
	public String productupdateForm(@PathVariable Long productCode, 
			Model model) {
		model.addAttribute("rboard",pbService.findById(productCode));
		return "/board/product/productupdate";
	}
	//수정
	@PutMapping("productupdate")
	@ResponseBody
	public String productupdate(@RequestBody ProductBoard pboard) {
		pbService.pupdate(pboard);
		return "success";
	}
	//삭제
	@DeleteMapping("productdelete/{productCode}")
	@ResponseBody //문자열
	public String productdelete(@PathVariable Long productCode) {
		pbService.delete(productCode); 
		return "success";
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


	
	// 관리자 사이트 통계 페이지
	@GetMapping("/admin/charts")
	public String charts() {
		return "/admin/charts";
	}

}
