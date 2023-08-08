package com.tr.join.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig{
	
	private MyAuthenticationProvider provider;
	
	@Autowired
	public SecurityConfig(MyAuthenticationProvider provider) {
		this.provider=provider;
	}
	
	@Autowired
	@Qualifier("dataSource")
	private DataSource dataSource;
	
	
	@Bean
	public SecurityFilterChain securityFileterChain(HttpSecurity http) throws Exception{
		return http.csrf().disable()
				.formLogin()
					.loginPage("/")
					.usernameParameter("userId")
					.passwordParameter("password")
					.loginProcessingUrl("/login")
					.defaultSuccessUrl("/main")
				.and()
				.authorizeHttpRequests()
					.antMatchers("/resources/**").permitAll()
					.antMatchers("/").permitAll()
					.antMatchers("/**").hasAnyAuthority("ADMIN","USER")
				.and()
				.rememberMe()  // 자동 로그인 설정
					//.key("hayden") //쿠키에 사용되는 값을 암호화하기 위한 키(key)값
					.rememberMeParameter("remember-me")
					.userDetailsService(provider) //DataSource 추가
					.tokenValiditySeconds(604800) //토큰 유지 시간(초단위) - 일주일
					.alwaysRemember(false)
				.and()
				.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/")
					.invalidateHttpSession(true) //세션 삭제
					.deleteCookies("remember-me", "JSESSIONID")
				.and()
					.authenticationProvider(provider)
				.build();
	}
	
	
	@Bean
	public BCryptPasswordEncoder bcryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	
}
