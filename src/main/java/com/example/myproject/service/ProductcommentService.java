package com.example.myproject.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.ProductBoard;
import com.example.myproject.model.ProductComment;
import com.example.myproject.repository.ProductboardRepository;
import com.example.myproject.repository.ProductcommentRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ProductcommentService {
	
	private final ProductcommentRepository pcRepository; 
	private final ProductboardRepository pbRepository;
	
	//댓글추가
	@Transactional 	
	public void pcinsert(ProductComment pccomment) { 
		ProductBoard pb = pbRepository.findById(pccomment.getPBoard().getProductCode()).get();
		pb.setProductReplycnt(pb.getProductReplycnt()+1);
		pcRepository.save(pccomment);
	}
	
	//댓글출력리스트
	public List<ProductComment> pclist(Long productCode) {
		List<ProductComment> pc= pcRepository.findBypBnum(productCode); 
		//System.out.println("nc"+nc.size());
		return pc;
	}
	
	//댓글삭제
	@Transactional
	public void pcdelete(Long pCnum, ProductComment pccomment ) {
		ProductBoard pb = pbRepository.findById(pccomment.getPBoard().getProductCode()).get();
		pb.setProductReplycnt(pb.getProductReplycnt()-1);
		pcRepository.deleteById(pCnum);
	}


}
