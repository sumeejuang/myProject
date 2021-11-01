package com.example.myproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.myproject.config.auth.PrincipalDetails;
import com.example.myproject.model.NoticeBoard;
import com.example.myproject.model.NoticeComment;
import com.example.myproject.service.NoticecommentService;

@RestController
//@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class CommentController {
	
	@Autowired
	private NoticecommentService ncService;
	
	//댓글추가
	@PostMapping("ncinsert/{nBnum}") 
	public String ncinsert(@PathVariable Long nBnum, 
							@RequestBody NoticeComment nccomment,
							@AuthenticationPrincipal PrincipalDetails principal) { 
		NoticeBoard nb = new NoticeBoard();
		nb.setNoticeCode(nBnum); 
		nccomment.setNBoard(nb); 	
		//nccomment.setUser(principal.getUser());
		ncService.ncinsert(nccomment);
		return "success"; 
	}
		
	//댓글출력리스트
	@GetMapping("nclist/{noticeCode}")
	public List<NoticeComment> nclist(@PathVariable Long noticeCode){
		return ncService.nclist(noticeCode);
	}
		
	//댓글삭제
	@DeleteMapping("ncdelete/{nCnum}")
	public Long ncdelete(@PathVariable Long nCnum, NoticeComment nccomment) {
		ncService.ncdelete(nCnum, nccomment);
		return nCnum;
			
		}

}
