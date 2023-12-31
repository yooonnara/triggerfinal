package com.tr.join.employee.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Employee implements UserDetails{
	
	private int no;
	private String empNum; // 사번
	private String id;
	private String password;
	private String name;
	private String gender;
	private String phone;
	private String email;
	private Date dateCreated; // 등록일
	private Date dateModefied; // 수정일
	private Date enrollDate; // 입사일
	private Date resignDate; // 퇴사일
	private int accStatus; // 계정상태
	private int type; // 관리자 여부
	private int deptNo;
	private String deptTitle;
	private int jobNo;
	private String jobTitle;
	private String empImg;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth=new ArrayList<>();
		auth.add(new SimpleGrantedAuthority("USER"));
		if(type==2) auth.add(new SimpleGrantedAuthority("ADMIN"));
		
		return auth;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
	
	
	

}
