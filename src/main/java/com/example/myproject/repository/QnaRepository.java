package com.example.myproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myproject.model.Qna;

public interface QnaRepository extends JpaRepository<Qna, Long> {

}
