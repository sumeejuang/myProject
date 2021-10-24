package com.example.myproject.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageControllerTest {
	
	@GetMapping("/")
	public String home(){
		return "home";
	}

}
