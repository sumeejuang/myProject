package com.example.myproject.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor 
@Data
@Entity
public class User {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long usercode;
	@Column(nullable=false) //컬럼선언 후 null값이면 안됨 (Not Null) =기본값true null허용
	private String useremail;
	private String username;
	private String userpasswd;
	private String userphone;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	@CreationTimestamp 
	@Temporal(TemporalType.TIMESTAMP) 
	@Column(name="userregdate") 
	private Date userregdate;
	private String userrole;

}
