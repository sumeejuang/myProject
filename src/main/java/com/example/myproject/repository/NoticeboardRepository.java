package com.example.myproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myproject.model.NoticeBoard;

public interface NoticeboardRepository extends JpaRepository<NoticeBoard, Long>{

}
