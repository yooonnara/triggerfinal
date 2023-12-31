package com.tr.join.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.admin.model.service.AdminEmployeeService;
import com.tr.join.common.PageFactory;
import com.tr.join.employee.model.vo.Department;
import com.tr.join.employee.model.vo.Employee;
import com.tr.join.employee.model.vo.Job;

@Controller
public class AdminEmployeeController {
	
	@Autowired
	private AdminEmployeeService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public AdminEmployeeController(AdminEmployeeService service) {
		this.service=service;
	}
	
	// 메인
	@RequestMapping("/admin/adminMain")
	public String adminPage(Model m) {
		Employee sessionEmp = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		m.addAttribute("sessionEmp",sessionEmp);
		return "admin/adminMain";
	}
	
	// 권한 거부 에러페이지
	@RequestMapping("/deniedpage")
	public String deniedPage() {
		return "error/deniedpage";
	}
	
	// 사원통합관리(페이징)
	@GetMapping("/admin/adminEmployee")
	public String adminEmployeePage(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
									@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage, 
									Model m, @RequestParam Map param) {
		String url = "adminEmployee";

		if(param.get("searchAccStatus") != null) {
			url += "?searchAccStatus="+(String)param.get("searchAccStatus");
		}
		if(param.get("searchAccType") != null) {
			url += "&searchAccType="+(String)param.get("searchAccType");
		}
		if(param.get("keyfield") != null ) {
			url += "&keyfield="+(String)param.get("keyfield");
		}
		if(param.get("keyword") != null) {
			url += "&keyword="+(String)param.get("keyword");
		}
//		System.out.println(url);
		
		param.put("cPage", cPage);
		param.put("numPerpage", numPerpage);
//		param.put("accStatus", (String) param.get("searchAccStatus"));
		List<Employee> employees = service.selectEmployeeAll(param);
		int totalData = service.selectEmployeeCount(param); // 전체사원수
		// {searchAccStatus=2, searchAccType=, keyfield=, keyword=}
		
		
		m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, url));
		m.addAttribute("employees",employees);
		m.addAttribute("cPage",cPage);
		
		m.addAttribute("totalData", totalData);
		int pageStartRowNum = totalData - (cPage-1)*numPerpage;
		m.addAttribute("pageStartRowNum", pageStartRowNum);
		
		return "admin/adminEmployee";
	}
	
	// 사원생성
	@RequestMapping("/admin/insertEmployee")
	public String insertEmployee(@RequestParam Map param, MultipartFile upFile, HttpSession session, Model m) { 
		//패스워드를 암호화해서 처리
		String oriPassword = (String)param.get("pwd1");
		String encodePassword = passwordEncoder.encode(oriPassword);
		param.put("password", encodePassword);
		
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
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int result = service.insertEmployee(param);

		String msg,loc;
		if(result>0) {
		msg="사원이 생성되었습니다.";
		loc="/admin/adminEmployee";
		}else {
			msg="생성에 실패했습니다. 다시 시도해 주세요.";
			loc="/admin/adminEmployee";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
	@GetMapping("/admin/ajax/getDept")
	@ResponseBody
	public List<Department> getDept() {
		List<Department> list = service.selectDept();
		return list;
	}
	
	@GetMapping("/admin/ajax/getJob")
	@ResponseBody
	public List<Job> getJob() {
		List<Job> list = service.selectJob();
		return list;
	}
	
	// 아이디 중복검사
	@GetMapping("/admin/ajax/checkDuplicationId")
	@ResponseBody
	public int checkDuplicationId(@RequestParam Map param) {
		String id = (String)param.get("id");
		int result = service.checkDuplicationId(id);
		return result;
	}
	
	
	// 마지막 값을 가져오고
	// 앞에 있는 J 를 지우기
	// 그리고 남은 숫자를 INT로 변환
	// 변환된 숫자를 +1
	// 100 미만이면 0+숫자를 스트링으로
	// 10 미만이면 00 + 숫자를 스트링으로 0** 형식을 만들고
	// J를 붙여서 return 해줌
	@GetMapping("/admin/ajax/makeEmpNum")
	@ResponseBody
	public String makeEmpNum() {
		String lastEmpNum = service.makeEmpNum(); // 마지막 값 가져오기 => 쿼리를 통해서 가져오기
		lastEmpNum = lastEmpNum.substring(1); // 첫번째값(J) 지우기
		String empNum = "";
		try{
            int tmp = Integer.parseInt(lastEmpNum); // 첫번째 값 버린 숫자를 int로 변환
    		tmp += 1; // 마지막 숫자에 +1 하기
    		if(10 > tmp) {
    			empNum = "J00" + tmp; 
    		} else if (100 > tmp) {
    			empNum = "J0" + tmp; 
    		} else {
    			empNum = "J" + tmp; 
    		}
        } catch (NumberFormatException ex){
            ex.printStackTrace();
        }
		return empNum;
	}
	
	// 사원수정
	@PostMapping("/admin/updateEmployees")
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
				File oldFile = new File(path + (String) param.get("oldImg"));
				if (oldFile != null) {
					boolean result = oldFile.delete();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			param.put("empImg", param.get("oldImg"));
		}
		
		int result = service.updateEmployees(param);
		
		String msg,loc;
		if(result>0) {
		msg="사원정보가 수정되었습니다.";
		loc="/admin/adminEmployee";
		}else {
			msg="수정에 실패했습니다. 다시 시도해 주세요.";
			loc="/admin/adminEmployee";
		}
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	// 사원삭제
	@RequestMapping("/admin/ajax/deleteEmployee")
	@ResponseBody
	public int deleteEmployee(Employee e, @RequestParam(value = "empList[]") ArrayList<Integer> empList) {
		System.out.println(empList);
		int result = 0;
		for (int i = 0; i < empList.size(); i++) {
			e.setNo(empList.get(i));
			result += service.deleteEmployee(e);
		}

		return result ;
	}
	
	
	
}
