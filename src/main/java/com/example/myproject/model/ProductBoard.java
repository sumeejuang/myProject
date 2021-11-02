package com.example.myproject.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor 
@AllArgsConstructor
@Getter
@Setter
@Entity(name="pBoard")
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class ProductBoard {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productCode;
	private String productTitle;
	private String productWriter;
	private Long productPrice;
	private Long productAmount;
	private String productDesc;
	private String productContent;
	private String productCategory;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date productRegdate;
	
	private Long productHitcount;
	private Long productReplycnt;

	//@JsonIgnore
	@JsonIgnoreProperties("pBoard") 
	//@JsonBackReference
	//@JsonManagedReference
	@Column(name="pComment") 
	@OneToMany(mappedBy="pBoard", 
		fetch = FetchType.LAZY,
		cascade = CascadeType.ALL)
	private List<ProductComment> pComments; 
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="usercode") 
	private User user;
	
	@PrePersist 
	public void prePersist() {
		this.productHitcount=this.productHitcount==null? 0: this.productHitcount;
		this.productReplycnt=this.productReplycnt==null? 0: this.productReplycnt;
	}

}
