package com.example.myproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController { //상품

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
}
