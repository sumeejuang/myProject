package com.example.myproject.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

//@NoArgsConstructor 
//@AllArgsConstructor
@Getter
@Setter
@Entity(name="qna")
public class Qna {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long qnaCode;
	@Column(unique=true) 
	private String qnaEmail;
	private String qnaTitle;
	private String qnaMsg;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date qnaRegdate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usercode") 
	private User user;

}
