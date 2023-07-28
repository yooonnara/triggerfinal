package com.tr.join.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig{
	
	private MyAuthenticationProvider provider;
	
	public SecurityConfig(MyAuthenticationProvider provider) {
		this.provider=provider;
	}
	
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
				.logout()
					.logoutUrl("/logout")
				.and()
				.authenticationProvider(provider)
				.build();
	}
	
	
	@Bean
	public BCryptPasswordEncoder bcryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
}
