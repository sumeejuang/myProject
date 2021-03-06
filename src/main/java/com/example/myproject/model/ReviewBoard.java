package com.example.myproject.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity(name="rBoard")
public class ReviewBoard {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long reviewCode;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date reviewRegdate;
	private Long reviewStar;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usercode") 
	private User user;
	
	@PrePersist 
	public void prePersist() {
		this.reviewStar=this.reviewStar==null? 0: this.reviewStar;
	}
}
