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

import com.example.myproject.model.ProductBoard;
import com.example.myproject.model.ReviewBoard;
import com.example.myproject.service.ProductboardService;

@Controller
public class ProductController { //삼품
	
	@Autowired
	private ProductboardService pService; 


//	
//	//카테고리별 전체보기(웹)
//	@GetMapping("productlist/subslist")
//	public String subslistview( 
//			@PageableDefault(size=9,sort="categorycode",
//			direction=Sort.Direction.DESC) Pageable pageable,
//			Model model) {
//		Page<ProductBoard> lists = pService.findByCategory(pageable)
//		model.addAttribute("sproduct",pService.findByCategory(categorycode));
//		model.addAttribute("sproduct",pService.findByCategory(categorycode));
//		model.addAttribute("lists",lists); //jsp뿌려지는 값lists
//		model.addAttribute("count",pService.countByCategory(categorycode));
//		model.addAttribute("rowNo",pService.countByCategory(categorycode)-(lists.getNumber()*8)); 
//		return "/board/product/subslist";
//	}
	
	@GetMapping("productlist/{categoryCode}")
	public String pclist(@PathVariable Long categoryCode,
			Model model){
		Page<Category> lists = pService.pclist(categoryCode);
		model.addAttribute("lists",lists);
	
		return "/board/product/subslist";
	}
	
	//상세보기
	@GetMapping("productview/{productCode}")
	public String subsview(@PathVariable Long productCode, 
			Model model) {
		model.addAttribute("pboard",pService.findById(productCode));
		return "/board/product/productview";
	}

	
	//침구
	
	
}
