package com.tr.join.edms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tr.join.edms.model.service.EdmsService;
import com.tr.join.edms.model.vo.Edms;
import com.tr.join.employee.model.service.EmployeeService;
import com.tr.join.employee.model.vo.Employee;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("/edsm")
@Controller
@Slf4j
public class EdmsController {
	
	private EmployeeService empService;
	private EdmsService service;
	
	@Autowired
	public EdmsController(EmployeeService empService, EdmsService service) {
		this.empService=empService;
		this.service=service;
	}
	
	@RequestMapping("/bsnRequest")
	public String requestform() {
		//페이지 전환용
		return "bsnRequest";
	}
	
	@PostMapping("/insertbsn")
	public String insertbsn(Edms e, Model model) {
		int result = service.insertbsn(e);
	String msg,loc;
	if(result>0) {
	msg="연차/출장 신청이 완료되었습니다.";
	loc="/";
	}else {
		msg="연차/충장신청이 실패되었습니다.";
		loc="/edms/bsnRequest";
	}
	model.addAttribute("msg",msg);
	model.addAttribute("loc",loc);
	return "common/msg";
	
		//System.out.println(result);
		//출장 insertform
		
	}
	
	@RequestMapping("/selectBsnAll()")
	public String selectBsnAll(Model m) {
		List<Edms> list=service.selectBsnAll();
		m.addAttribute("bsn",list);
		return "edms/edmsView" ;
		
	}
	
	/*
	 * @RequestMapping("/bsnRequest") public String selectEmployeeByNo(Model m) {
	 * Employee
	 * loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().
	 * getPrincipal();
	 * m.addAttribute("empInfo",service.selectEmployeeByNo(loginEmp.getNo()));
	 * return "edms/bsnRequest"; }
	 * 
	 * 
	 */
	
	/*
	 * @RequestMapping("/bsnList") public String selectEdmsAll() { return ""; }
	 */
	
	/*
	 * @RequestMapping("/bsnRequest") public String insertEdsm(Employee e) {
	 * Employee
	 * loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().
	 * getPrincipal();
	 * e.addAttribute("empInfo",service.insertEdsm(loginEmp.getNo())); int result =
	 * service.insertEmployee(e); if(result==0) { return "common/msg"; } return
	 * "redirect:/edsm/bsnView"; }
	 */
	/*
	 * @RequestMapping("/bsnView") public List<Edsm>
	 * selectEdsmAll(Map<String,Object>param){ retu }
	 */

		@GetMapping("/adminVc")
		public String adminVcPage() {
			return "admin/adminVc";
		}
		@GetMapping("/vcRequest")
		public String edmsVcPage() {
			return "edms/vcRequest";
		}
		@GetMapping("/bsnRequest")
		public String bsnRequestPage() {
			return "edms/bsnRequest";
		}
		
	
		
		
}


