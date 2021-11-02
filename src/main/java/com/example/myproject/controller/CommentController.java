package com.example.myproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.example.myproject.model.ProductBoard;
import com.example.myproject.model.ProductComment;
import com.example.myproject.service.NoticecommentService;
import com.example.myproject.service.ProductcommentService;

@RestController
//@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class CommentController {
	
	@Autowired
	private NoticecommentService ncService;
	@Autowired
	private ProductcommentService pcService;
	
	
	
	
	//상품
	//댓글추가
	@PostMapping("pcinsert/{pBnum}") 
	public String pcinsert(@PathVariable Long pBnum, 
							@RequestBody ProductComment pccomment,
							@AuthenticationPrincipal PrincipalDetails principal) { 
		ProductBoard pb = new ProductBoard();
		pb.setProductCode(pBnum); 
		pccomment.setPBoard(pb); 	
		//pccomment.setUser(principal.getUser());
		pcService.pcinsert(pccomment);
		return "success"; 
	}
	//댓글출력리스트
		@GetMapping("pclist/{productCode}")
		public List<ProductComment> pclist(@PathVariable Long productCode){
			return pcService.pclist(productCode);
		}
			
		//댓글삭제
		@DeleteMapping("pcdelete/{pCnum}")
		public Long pcdelete(@PathVariable Long pCnum, ProductComment pccomment) {
			pcService.pcdelete(pCnum, pccomment);
			return pCnum;
				
			}

	
	
	//공지
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
