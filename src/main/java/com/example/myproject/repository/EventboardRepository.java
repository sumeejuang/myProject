package com.example.myproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myproject.model.EventBoard;

public interface EventboardRepository  extends JpaRepository<EventBoard, Long>{

}
