package com.tr.join.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping("/admin")
	public String adminPage() {
		return "admin/adminMain";
	}
	
	// 멤버 통합관리
	@GetMapping("/adminEmployee")
	public String adminEmployeePage(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
									@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, 
									Model md) {
		List<Employee> employees = service.selectEmployeeAll(Map.of("cPage", cPage, "numPerpage", numPerpage));
		int totalData = service.selectEmployeeCount(); // 전체사원수
		
		md.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "adminEmployee"));
		md.addAttribute("employees",employees);
		
		md.addAttribute("totalData", totalData);
		int pageStartRowNum = totalData - (cPage-1)*numPerpage;
		md.addAttribute("pageStartRowNum", pageStartRowNum);
		
		return "admin/adminEmployee";
	}
	
	// 멤버 생성하기
	@RequestMapping("/admin/insertEmployee") // @Validated 추가하기
	public String insertEmployee(@RequestParam Map param) { 
		//패스워드를 암호화해서 처리하자.
		String oriPassword = (String)param.get("pwd1");
		String encodePassword = passwordEncoder.encode(oriPassword);
		param.put("password", encodePassword);

		int result = service.insertEmployee(param);
		return "redirect:/adminEmployee";
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
	
	
	// 마지막 값을 가져오고.
	// 앞에 있는 J 를 날려
	// 그리고 남은 숫자를 INT로 변환
	// 변환된 숫자를 +1 해
	// 100 미만이면 0+숫자를 스트링으로
	// 10 미만이면 00 + 숫자를 스트링으로 0** 형식을 만들고
	// J를 붙여서 RETURN 해줌
	@GetMapping("/admin/ajax/makeEmpNum")
	@ResponseBody
	public String makeEmpNum() {
		String lastEmpNum = service.makeEmpNum(); // 마지막 값 가져오기 => 쿼리를 통해서 가져와라
		lastEmpNum = lastEmpNum.substring(1); // 첫번째값(J) 버려
		String empNum = "";
		try{
            int tmp = Integer.parseInt(lastEmpNum); // 첫번째 값 버린 숫자를 int로 변환
    		tmp += 1; // 마지막 숫자에 +1 을 한다.
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
	
	
	
	
	
	

}
