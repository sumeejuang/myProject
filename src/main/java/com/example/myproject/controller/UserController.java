package com.example.myproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.myproject.model.User;
import com.example.myproject.repository.UserRepository;
import com.example.myproject.service.UserService;

@Controller
public class UserController { //회원
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private UserRepository userrepository; //회원가입 아이디 중복확인위함
		

	//가입폼
	@GetMapping("joinForm")
	public String join() {
		return "/user/joinForm";
	}	
	
	//아이디체크
	@GetMapping("idck")
	@ResponseBody //문자열
	public String idck(@RequestParam(required=false) String username) {
		if(userrepository.findByUsername(username)!=null) {
		return "fail";
		} else {
			return "success";
		}
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
	@GetMapping("mypage/{usercode}")
	public String mypage(@PathVariable Long usercode, Model model) {	
		model.addAttribute("list",userservice.findById(usercode)); 
		return "/user/mypage";
	}
	
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
	
	//로그인실패시
	 @GetMapping("/loginck")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "exception", required = false) String exception,
                        Model model){
        model.addAttribute("error",error);
        model.addAttribute("exception",exception);
        return "/user/loginForm";
    }
}
