package com.example.myproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration //2.환경설정파일
@EnableWebSecurity //3.웹시큐리티 관련된것 활성화 시킴 (알려주는 역할 override처럼)
public class SecurityConfig extends WebSecurityConfigurerAdapter{ //1.상속(환경설정파일)  //config시큐리티설정
	//5.버전업되면서 시큐리티암호화관련 객체 줘야함
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder(); //6.익명겍체만들어줌
	}
	
	@Override //4.ctrl+space -> httpconfig
	protected void configure(HttpSecurity http) throws Exception {
		//7.http나열
		http.csrf().disable(); //포스트맵핑자동적용위함 토큰값설정필요없음
		http.authorizeRequests() //권한요구(권한찾기)
			.antMatchers("/updateForm/*").authenticated() 
			.antMatchers("/mypage/*").authenticated() 
			.antMatchers("/admin").authenticated() 
			.antMatchers("/admin/*").authenticated() //유형찾아서 요구 (user를 타고오는 패턴)빼고는 
			.anyRequest() //나머지는
			.permitAll() //모두 허용(시큐리티 로그인창에 걸리지않고 컨트롤러getmapping한 home으로)
			.and()
				.formLogin() //폼로그인
				.loginPage("/loginForm") //로그인페이지 설정
				.loginProcessingUrl("/loginProc")  //action이름 설정
				.defaultSuccessUrl("/main") //성공하면 가는 루트
			.and()
				.logout()
				.logoutUrl("/logout") //로그아웃페이지 설정
				.logoutSuccessUrl("/main") //로그아웃 성공시 가는 루트
				.invalidateHttpSession(true); //섹션값을 없애기
	}
}
