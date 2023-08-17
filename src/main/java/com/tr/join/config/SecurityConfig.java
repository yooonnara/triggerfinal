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
					.successForwardUrl("/successLogin")
				.and()
				.authorizeHttpRequests()
					.antMatchers("/resources/**").permitAll()
					.antMatchers("/").permitAll()
					.antMatchers("/admin/*").hasAuthority("ADMIN")
					.antMatchers("/**").hasAnyAuthority("ADMIN","USER") // 넓은 범위가 가장 아래 있어야 함
				.and()
				.exceptionHandling().accessDeniedPage("/deniedpage")
				.and()
				.logout()
					.logoutUrl("/logout")
					.logoutSuccessUrl("/")
					//.invalidateHttpSession(true) //세션 삭제
					//.deleteCookies("JSESSIONID")
				.and()
				.authenticationProvider(provider)
				.headers().frameOptions().disable()
				.and()
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
