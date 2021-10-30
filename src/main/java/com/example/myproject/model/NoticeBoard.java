package com.example.myproject.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity(name="nBoard")
public class NoticeBoard {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long noticeCode;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date noticeRegdate;
	private Long noticeHitcount;
	private Long noticeReplycnt;

	@JsonIgnoreProperties("nBoard") 
	//@JsonManagedReference
	@OneToMany(mappedBy="nBoard", 
		fetch = FetchType.LAZY,
		cascade = CascadeType.ALL)
	private List<NoticeComment> nComments; 
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usercode") 
	private User user;
	
	@PrePersist 
	public void prePersist() {
		this.noticeHitcount=this.noticeHitcount==null? 0: this.noticeHitcount;
		this.noticeReplycnt=this.noticeReplycnt==null? 0: this.noticeReplycnt;
	}
}