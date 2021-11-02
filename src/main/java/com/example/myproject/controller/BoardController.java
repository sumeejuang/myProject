package com.example.myproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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
import com.example.myproject.model.ReviewBoard;
import com.example.myproject.service.EventboardService;
import com.example.myproject.service.NoticeboardService;
import com.example.myproject.service.ProductboardService;
import com.example.myproject.service.ReviewboardService;

@Controller
public class BoardController { //게시판
	
	@Autowired
	private NoticeboardService nbService; //공지사항
	@Autowired
	private ReviewboardService rbService; //리뷰
	@Autowired
	private EventboardService ebService; //이벤트
	@Autowired
	private ProductboardService pbService; //상품

	
	
   //공지사항
	//전체보기(웹)
	@GetMapping("noticelist")
	public String noticelist(
		Model model,
		@PageableDefault(size=8,sort="noticeCode",
					direction=Sort.Direction.DESC) Pageable pageable) {
	Page<NoticeBoard> lists = nbService.findAll(pageable);
	model.addAttribute("lists",lists); //jsp뿌려지는 값lists
	model.addAttribute("count",nbService.count());
	model.addAttribute("rowNo",nbService.count()-(lists.getNumber()*8)); 
		return "/board/notice/noticelist";
	}
	
	//상세보기
	@GetMapping("noticeview/{noticeCode}")
	public String noticeview(@PathVariable Long noticeCode, Model model) {
		model.addAttribute("nboard",nbService.findById(noticeCode));
		return "/board/notice/noticeview";
	}
	
	
	
	//리뷰게시판
	//전체보기(웹)
	@GetMapping("reviewlist")
	public String reviewlist(Model model,
			@PageableDefault(size=5,sort="reviewCode",
			direction=Sort.Direction.DESC) Pageable pageable) {
		Page<ReviewBoard> lists = rbService.findAll(pageable);
		model.addAttribute("lists",lists); //jsp뿌려지는 값lists
		model.addAttribute("count",rbService.count());
		model.addAttribute("rowNo",rbService.count()-(lists.getNumber()*5)); 
		return "/board/review/reviewlist";
	}
	//추가폼
	@GetMapping("reviewinsert")
	public String reviewForm() {
		return "/board/review/reviewinsert";
	}
	//추가하기
	@PostMapping("reviewinsert")
	public String reviewinsert(ReviewBoard rboard,
			@AuthenticationPrincipal PrincipalDetails principal) {
		rbService.rinsert(rboard, principal.getUser());
		return "redirect:/reviewlist";
	}
	//수정폼
	@GetMapping("reviewupdate/{reviewcode}")
	public String reviewupdateForm(@PathVariable Long reviewcode, 
			Model model) {
		model.addAttribute("rboard",rbService.findById(reviewcode));
		return "/board/review/reviewupdate";
	}
	//수정하기
	@PutMapping("reviewupdate")
	@ResponseBody //문자열
	public String reviewupdate(@RequestBody ReviewBoard rboard) { 
		rbService.rupdate(rboard);
		return "success";
	}
	//삭제하기
	@DeleteMapping("reviewdelete/{reviewCode}")
	@ResponseBody //문자열
	public String delete(@PathVariable Long reviewCode) {
		nbService.delete(reviewCode); 
		return "success";
	}
	
	
	
	
	//이벤트
	//전체보기(웹)
	@GetMapping("eventlist")
	public String eventlist(Model model,
			@PageableDefault(size=6,sort="eventCode",
			direction=Sort.Direction.DESC) Pageable pageable) {
		Page<EventBoard> lists = ebService.findAll(pageable);
		model.addAttribute("lists",lists); //jsp뿌려지는 값lists
		model.addAttribute("count",rbService.count());
		model.addAttribute("rowNo",rbService.count()-(lists.getNumber()*6)); 
		return "/board/event/eventlist";
	}
	//상세보기
	@GetMapping("eventview/{eventcode}")
	public String eventview(@PathVariable Long eventcode, 
			Model model) {
		model.addAttribute("eboard",ebService.findById(eventcode));
		return "/board/event/eventview";
	}
	

	
	
	//제품
	//전체보기(웹)
	@GetMapping("productlist")
	public String productlistsubs(String productCategory,
		Model model,
		@PageableDefault(size=8,sort="productCode",
					direction=Sort.Direction.DESC) Pageable pageable) {
	Page<ProductBoard> lists = pbService.findByProductCategory(productCategory,pageable);
	model.addAttribute("lists",lists); 
	model.addAttribute("count",pbService.count());
	model.addAttribute("rowNo",pbService.count()-(lists.getNumber()*8)); 
		return "/board/product/productlist";
	}
	//상세보기
	@GetMapping("productview/{productCode}")
	public String productview(@PathVariable Long productCode, Model model) {
		model.addAttribute("pboard",pbService.findById(productCode));
		return "/board/product/productview";
	}
	//페이징
	@GetMapping("productview")
	public String productview() {
		return "/board/product/productview";
	}
		
	
	
	
//	
//	//블로그
//	@GetMapping("bloglist")
//	public String bloglist() {
//		return "/board/blog/bloglist";
//	}
//	@GetMapping("blogview")
//	public String blogview() {
//		return "/board/blog/blogview";
//	}
//	@GetMapping("bloginsert")
//	public String bloginsert() {
//		return "/board/blog/bloginsert";
//	}
//	@GetMapping("blogupdate")
//	public String blogupdate() {
//		return "/board/blog/blogupdate";
//	}
	
	
	

}
