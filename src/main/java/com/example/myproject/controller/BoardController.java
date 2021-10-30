package com.example.myproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.myproject.model.NoticeBoard;
import com.example.myproject.service.NoticeboardService;

@Controller
public class BoardController { //게시판
	
	@Autowired
	private NoticeboardService nbService; //공지사항
	
	
   //공지사항
	//전체보기(웹)
	@GetMapping("noticelist")
	public String noticelist(
		Model model,
		@PageableDefault(size=8,sort="noticeCode",//(한페이지당 7개)
					direction=Sort.Direction.DESC) Pageable pageable) {
	Page<NoticeBoard> lists = nbService.findAll(pageable);
	model.addAttribute("lists",lists); //jsp뿌려지는 값lists
	model.addAttribute("count",nbService.count());
	model.addAttribute("rowNo",nbService.count()-(lists.getNumber()*8)); 
							//게시글수-현재페이지getNumber 1 *7 만큼 뺌 // 7-7 =0
		return "/board/notice/noticelist";
	}
	
	//상세보기
	@GetMapping("noticeview/{noticeCode}")
	public String noticeview(@PathVariable Long noticeCode, Model model) {
		model.addAttribute("nboard",nbService.findById(noticeCode));
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
	

}
