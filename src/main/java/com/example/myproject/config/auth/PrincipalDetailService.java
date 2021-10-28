package com.example.myproject.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.myproject.model.User;
import com.example.myproject.repository.UserRepository;

@Service
public class PrincipalDetailService implements UserDetailsService { 
	//로그인관련 UserDetailsService 상속받아 시큐리티적용설정 :기존 시큐리티프로젝트 참조
	@Autowired
	private UserRepository userRepository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername");
		User user = userRepository.findByUsername(username);
		System.out.println("username : " + user);
		if(user==null)  return null ;
		PrincipalDetails puser = new PrincipalDetails(user);
		return puser;
	}

}
