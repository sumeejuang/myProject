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
@Entity(name="eBoard")
public class EventBoard {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long eventCode;
	private String eventTitle;
	private String eventWriter;
	private String eventContent;
	private String imageContent;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date eventRegdate;
	private Long eventHitcount;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usercode") 
	private User user;

//	@OneToMany(mappedBy = "eBoard", 
//			cascade = CascadeType.ALL)
//    Set<EventLike> likes = new HashSet<>();
	
	@PrePersist 
	public void prePersist() {
		this.eventHitcount=this.eventHitcount==null? 0: this.eventHitcount;
	}
}
