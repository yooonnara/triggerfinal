package com.tr.join.employee.model.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.employee.model.service.EmployeeService;
import com.tr.join.employee.model.vo.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	// 메소드로
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@GetMapping("/")
	public String loginPage() {
		return "login/login";
	}
	
	@GetMapping("/main")
	public String main() {
		return "mainpage";
	}
	
	// 로그인 - 아이디 저장
	@PostMapping("/successLogin")
	public String cookieResolve(String userId, @RequestParam(name = "saveId", required = false) String saveId,
			HttpServletResponse response) {

		if ("on".equals(saveId)) { // 아이디 저장 버튼을 체크했을 때
			Cookie cookie = new Cookie("userId", userId);
			cookie.setMaxAge(7 * 24 * 60 * 60); // 일주일
			response.addCookie(cookie);
		} else { // 체크하지 않았을 때
			Cookie cookie = new Cookie("userId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:/main";
	}
	
	// 마이페이지 정보 불러오기
	@GetMapping("/mypage")
	public String mypage(Model m){
		// 로그인한 현재 유저 session 정보 
		Employee loginEmp =(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// session에 있는 ID로 user의 DB정보 select
		Employee emp = service.selectEmployeeById(loginEmp.getId()); // 현재 정보로 DB에서 select
	    m.addAttribute("empInfo",emp);
	    
		return "mypage/mypage";
	}
	
	// 마이페이지 수정하기 (이전 프로필 사진 삭제하기)
	@PostMapping("/updateEmployee")
	public String updateEmployee(@RequestParam Map param, MultipartFile upFile, HttpSession session, Model m) { 
		// 파일업로드
		// 절대경로 가져오기
		String path = session.getServletContext().getRealPath("/resources/upload/employee/");
		if (upFile != null && !upFile.isEmpty()) {
			String oriName = upFile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date today = new Date(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdn = (int) (Math.random() * 10000) + 1;
			String rename = sdf.format(today) + "_" + rdn + ext;
			try {
				upFile.transferTo(new File(path, rename));
				param.put("empImg", rename);
				
				File oldFile = new File(path + (String)param.get("oldImg"));
				if(oldFile != null) {
					boolean result = oldFile.delete();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			param.put("empImg", param.get("oldImg"));
		}
		System.out.println(param);
		int result = service.updateEmployee(param);
		
		String msg,loc;
		if(result>0) {
		msg="기본정보가 수정되었습니다.";
		loc="/mypage";
			Employee loginEmp =(Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			loginEmp.setEmpImg((String)param.get("empImg"));
		}else {
			msg="수정에 실패했습니다. 다시 시도해 주세요.";
			loc="/mypage";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/mypagePassword")
	public String mypagePassword(){
	    
		return "mypage/updatePassword";
	}
	
	// 비밀번호 수정하기
	@PostMapping("/updatePassword")
	public String updatePassword(@RequestParam Map param, Model m) { 
		// 로그인한 현재 유저 정보 (세션에 저장된 정보)
		Employee sessionEmp = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.put("emp_id", sessionEmp.getId());

		String newPassword = (String) param.get("pwd1");
		newPassword = passwordEncoder.encode(newPassword);

		param.put("password", newPassword);

		int result = service.updatePassword(param);

		String msg, loc;
		if (result > 0) {
			msg = "비밀번호가 수정되었습니다. 다시 로그인해 주세요.";
			loc = "/";
		} else {
			msg = "수정에 실패했습니다. 다시 시도해 주세요.";
			loc = "/mypagePassword";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);

		return "common/msg";
		
	}
	
	// 현재 비밀번호와 입력한 비밀번호의 일치여부 확인
	@PostMapping("/ajax/checkPassword")
	@ResponseBody
	public int checkPassword(@RequestParam Map param) {
//		로그인한 현재 유저 정보 (세션에 저장된 정보)
		Employee sessionEmp = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// session에 있는 ID로 user의 DB정보 select
		Employee dbEmp = service.selectEmployeeById(sessionEmp.getId());
		
		// form input 현재 패스워드 => ajax로 전달된 패스워드
		String password = (String)param.get("password");
		
//		System.out.println("파라미터 입력해서 전달 받은 비밀번호는 " + password);
//		System.out.println("현재 세션에 저장된 비밀번호는 " + sessionEmp.getPassword());
//		System.out.println("디비에 저장된 비밀번호는 " + dbEmp.getPassword());
		
		if(password != null && passwordEncoder.matches(password, dbEmp.getPassword()) == true) {
			return 1;
		} else {
			return 0;
		}
	}
	
	
	@GetMapping("/logout")
	public String logOut() {
		
		return "/";
	}
	
	
	

}
