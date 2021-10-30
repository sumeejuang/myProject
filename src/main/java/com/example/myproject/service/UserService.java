package com.example.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.myproject.model.User;
import com.example.myproject.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired //비번암호화 주입
	private BCryptPasswordEncoder encoder; 
	
	
	//회원
	//추가
	@Transactional
	public void register(User user) {
		//비번암호화되어 넣기
		String rawPassword = user.getUserpasswd(); //user에 패스워드를 들고와서
		//String encPassword = encoder.encode(rawPassword); //암호화메서드encode함		
		user.setUserpasswd(encoder.encode(rawPassword)); //암호화된 비번 set
		user.setUserrole("ROLE_USER"); //권한부여 반드시 ROLE_ 포함되어야함
		userRepository.save(user);
	}
	
	//전체보기
	public List<User>findAll(){
		return userRepository.findAll();
	}
	
	//회원수카운팅
	public Long count() {
		return userRepository.count(); 
	}
	
	//수정폼,마이페이지폼
	public User findById(Long usercode) { 
		return userRepository.findById(usercode).get(); 
	}
	
	//권한수정
	@Transactional 
	public void updateRole(User data) { 	
		User user = userRepository.findById(data.getUsercode()).get();
		user.setUserrole("ROLE_ADMIN");
	}
	
	//수정
	@Transactional 
	public void update(User data) { 	
		User user = userRepository.findById(data.getUsercode()).get();
		user.setUserpasswd(encoder.encode(data.getUserpasswd()));
		user.setUserphone(data.getUserphone());
		user.setPostcode(data.getPostcode());
		user.setAddress(data.getAddress());
		user.setDetailaddress(data.getDetailaddress());
		user.setExtraaddress(data.getExtraaddress());
	}
	
	//삭제
	@Transactional
	public void delete(Long usercode) {
		userRepository.deleteById(usercode); //id->기본키
	}

}
