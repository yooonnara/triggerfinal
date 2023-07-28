package com.tr.join.config;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.tr.join.employee.model.dao.EmployeeDao;
import com.tr.join.employee.model.vo.Employee;

@Component
public class MyAuthenticationProvider implements AuthenticationProvider{
	
	private BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
	private EmployeeDao dao;
	private SqlSessionTemplate session;

	
	public MyAuthenticationProvider(EmployeeDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id=authentication.getName();
		String password=(String)authentication.getCredentials();
		Employee loginEmp=dao.selectEmployeeById(session,id);
		if(loginEmp==null || !encoder.matches(password, loginEmp.getPassword())) {
			throw new BadCredentialsException("로그인실패");
		}
		return new UsernamePasswordAuthenticationToken(loginEmp, loginEmp.getPassword(),loginEmp.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

	
	
}
