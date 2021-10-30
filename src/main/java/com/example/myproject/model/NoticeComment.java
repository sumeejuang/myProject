package com.example.myproject.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Entity(name = "nComment") 
public class NoticeComment {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long nCnum;
	private String ncContent;
	private String ncWriter;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape= Shape.STRING,
	pattern ="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date nRegdate;
	
	//@JsonBackReference
	@ManyToOne  
	@JoinColumn(name = "nBnum") 
	private NoticeBoard nBoard;  
	//board형에 담아서 가져옴 -->Comment에서 bnum가져다쓰기
	
	//Comment입장에서 User만 참조
	@ManyToOne
	@JoinColumn(name="usercode")
	private User user;
}
