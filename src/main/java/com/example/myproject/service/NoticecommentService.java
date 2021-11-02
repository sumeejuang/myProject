package com.example.myproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.NoticeBoard;
import com.example.myproject.model.NoticeComment;
import com.example.myproject.repository.NoticeboardRepository;
import com.example.myproject.repository.NoticecommentRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NoticecommentService {
	
	private final NoticecommentRepository ncRepository; 
	private final NoticeboardRepository nbRepository;
	
	//댓글추가
	@Transactional 	
	public void ncinsert(NoticeComment nccomment) { 
		NoticeBoard nb = nbRepository.findById(nccomment.getNBoard().getNoticeCode()).get();
		nb.setNoticeReplycnt(nb.getNoticeReplycnt()+1);
		ncRepository.save(nccomment);
	}
	
	//댓글출력리스트
	public List<NoticeComment> nclist(Long noticeCode) {
		List<NoticeComment> nc= ncRepository.findByBnum(noticeCode); 
		//System.out.println("nc"+nc.size());
		return 	nc;
	}
	
	//댓글삭제
	@Transactional
	public void ncdelete(Long nCnum, NoticeComment nccomment ) {
		NoticeBoard nb = nbRepository.findById(nccomment.getNBoard().getNoticeCode()).get();
		nb.setNoticeReplycnt(nb.getNoticeReplycnt()-1);
		ncRepository.deleteById(nCnum);
	}


}
