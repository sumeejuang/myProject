package com.example.myproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration 
@EnableWebSecurity 
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	private final AuthenticationFailureHandler customFailureHandler;
	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder(); 
	}
	
	@Override 
	protected void configure(HttpSecurity http) throws Exception {	
		
		http.csrf().disable(); //포스트맵핑자동적용 토큰값설정필요없음
		http.authorizeRequests() //권한찾기
			.antMatchers("/updateForm/*", "/mypage/*").hasAnyAuthority("ROLE_ADMIN", "ROLE_USER")
			.antMatchers("/noticeinsert","/noticeupdate","/eventinsert","/eventupdate",
					"/productinsert","/productupdate","/bloginsert","/blogupdate","/noticeinsert",
					"/noticeupdate","/admin","/admin/*").hasAnyAuthority("ROLE_ADMIN") 
			.antMatchers("/cart").authenticated()
			//.antMatchers("/checkout").hasAnyAuthority("ADMIN", "USER") 		
			.anyRequest() //나머지
			.permitAll() //모두 허용
			.and()
				.formLogin() //폼로그인
				.loginPage("/loginForm") //로그인페이지 
				.loginProcessingUrl("/loginProc")  //action
				.defaultSuccessUrl("/main") //성공
				.failureHandler(customFailureHandler)	// 실패핸들러
			.and()
				.logout()
				.logoutUrl("/logout") //로그아웃페이지 
				.logoutSuccessUrl("/loginForm") //로그아웃 성공
				.invalidateHttpSession(true); //섹션값 없애기			
	}
}
