package com.example.myproject.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.myproject.model.User;
import com.example.myproject.repository.UserRepository;
import com.example.myproject.service.UserService;

@Controller
public class PageControllerTest {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private UserRepository userrepository; //회원가입 아이디 중복확인위함
	
	//메인
	@GetMapping("main")
	public String main(){
		return "main";
	}
	
	//회원
	//가입폼
	@GetMapping("joinForm")
	public String join() {
		return "/user/joinForm";
	}
	
	//가입
	@PostMapping("register")
	@ResponseBody //문자열
	public String register(@RequestBody User user) {
		if(userrepository.findByUsername(user.getUsername())!=null) { //쿼리메서드 아이디 중복확인
			return "fail";
		}
		userservice.register(user);
		return "success";
	}
	//정보보기(마이페이지)
	
	
	//수정폼(로그인한회원,관리자)
	@GetMapping("updateForm/{usercode}")
	public String updateform(@PathVariable Long usercode, Model model) {
		model.addAttribute("list",userservice.findById(usercode));
		return "/user/updateForm";
	}
	//수정
	@PutMapping("updateForm")
	@ResponseBody //문자열
	public String update(@RequestBody User data) { //제이슨
		userservice.update(data);
		return "success";
	}
	//삭제
	@DeleteMapping("delete/{usercode}")
	@ResponseBody 
	public String delete(@PathVariable Long usercode) {
		userservice.delete(usercode); 
		return "success";
	}
	
	
	
	//로그인폼
	@GetMapping("loginForm")
	public String login() {
		return "/user/loginForm";
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
	@GetMapping("subsinsert")
	public String subsinsert() {
		return "/board/notice/subs/subsinsert";
	}
	@GetMapping("subsupdate")
	public String subsupdate() {
		return "/board/notice/subs/subsupdate";
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
	@GetMapping("beddinginsert")
	public String beddinginsert() {
		return "/board/notice/subs/beddinginsert";
	}
	@GetMapping("beddingupdate")
	public String beddingupdate() {
		return "/board/notice/subs/beddingupdate";
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
	@GetMapping("noticeupdate")
	public String noticeupdate() {
		return "/board/notice/noticeupdate";
	}
	@GetMapping("noticeview")
	public String noticeview() {
		return "/board/notice/noticeview";
	}
	
	//리뷰게시판
	@GetMapping("reviewlist")
	public String reviewlist() {
		return "/board/review/reviewlist";
	}
	@GetMapping("reviewinsert")
	public String reviewinsert() {
		return "/board/notice/reviewinsert";
	}
	@GetMapping("reviewupdate")
	public String reviewupdate() {
		return "/board/notice/reviewupdate";
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
	@GetMapping("bloginsert")
	public String bloginsert() {
		return "/board/blog/bloginsert";
	}
	@GetMapping("blogupdate")
	public String blogupdate() {
		return "/board/blog/blogupdate";
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
	@GetMapping("eventinsert")
	public String eventinsert() {
		return "/board/event/eventinsert";
	}
	@GetMapping("eventupdate")
	public String eventupdate() {
		return "/board/event/eventupdate";
	}
	
	
	
	
	
	//카트
	@GetMapping("cart")
	public String cart() {
		return "cart";
	}
	//주문
	
	
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
	
	


}
