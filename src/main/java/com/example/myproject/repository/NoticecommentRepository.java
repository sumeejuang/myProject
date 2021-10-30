package com.example.myproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.myproject.model.NoticeComment;

public interface NoticecommentRepository extends JpaRepository<NoticeComment, Long>{
	@Query("select sc from nComment sc join fetch sc.nBoard where notice_code=?1")  
	public List<NoticeComment> findByBnum(Long noticeCode);

}
