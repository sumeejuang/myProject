package com.example.myproject.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.myproject.model.User;

import lombok.Data;
@Data
public class PrincipalDetails implements UserDetails{ //로그인관련 UserDetails 상속받아 시큐리티적용설정 :기존 시큐리티프로젝트 참조
	private User user; //인증받은 회원 DTO
	
	//생성자
	public PrincipalDetails(User user) {
		this.user= user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() { //권한정의
		Collection<GrantedAuthority> collect = new ArrayList<>();
		collect.add(()->{return user.getUserrole();}); //람다식
		return collect;
	}

	@Override
	public String getPassword() {
		return user.getUserpasswd();
	}

	@Override
	public String getUsername() { 
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
