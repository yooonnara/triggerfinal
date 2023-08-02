package com.tr.join.edms.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.common.PageFactory;
import com.tr.join.edms.model.service.EdmsService;
import com.tr.join.edms.model.vo.Edms;
import com.tr.join.employee.model.service.EmployeeService;
import com.tr.join.employee.model.vo.Employee;

import lombok.extern.slf4j.Slf4j;
@RequestMapping("/edms")
@Controller
@Slf4j
public class EdmsController {
	
	private EmployeeService empService;
	private EdmsService service;
	
	
	public EdmsController(EmployeeService empService, EdmsService service) {
		this.empService=empService;
		this.service=service;
	}

	//출장 폼 제출
	
	@PostMapping("/insertbsn")
	public String insertbsn(Edms e, MultipartFile[] upFile ,Model model) {
		int result = service.insertbsn(e);
		//파일 업로드 하기 
		for(MultipartFile f :upFile) {
			log.debug(f.getOriginalFilename());
		}
		/*
		 * log.debug(upFile.getOriginalFilename()); log.debug("()",upFile.getSize());
		 */
		
		
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
	
 //연차 신청하는 폼 작성하기 
		//@RequestMapping(value="/insertVc ", method=RequestMethod.POST)
	@PostMapping("/insertVc")
		public String insertVc(Edms d, Model m ) {
		int result=service.insertVc(d);
		
		
		String msg,loc;
		if (result>0){
				msg="연차신정완료";
				loc="/main";
			}else {
				msg="연차신청실패";
				loc="/edms/vcRequest";
			}
			m.addAttribute("msg",msg);
			m.addAttribute("loc",loc);
	
			return "common/msg";
	}
	

	
	//연차 조회하는 폼 신청하기 
	@RequestMapping("/selectVc")
	public String selectVc(Model m) {
		List<Edms> list=service.selectVc();
		m.addAttribute("vc",list);
		list.forEach(System.out::println);
		
		return "edms/bsnView";
		
	}
	
	
	//전체 출력하기
	
		@GetMapping("/bsnList")
		public String selectBsnAll(@RequestParam(value="cPage", defaultValue="1") int cPage,
									@RequestParam(value="numPerpage", defaultValue="5")int numPerpage,Model m){
			List<Edms> list=service.selectBsnAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
			int totalData=service.selectEdmsCount();
			
			m.addAttribute("pageBar",PageFactory.getPage(cPage, numPerpage, totalData, "/bsnList"));
			m.addAttribute("edms",list);
			list.forEach(System.out::println);
			System.out.println(m);
			return "edms/bsnList" ;
			
		}
	
		
	//전체 화면창 보여주기 
	
	@GetMapping("/edmsView")
	public String selectByNo(Model m , int no) {
		m.addAttribute("edms", service.selectByNo(no));
				System.out.println(m);
				
				return "edms/bsnView";
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
		
		
		@GetMapping("/bsnRequest")
		public String bsnRequestPage(Model m) {
			Employee loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			m.addAttribute("loginEmp",loginEmp);
			return "edms/bsnRequest";
		}
		
		@GetMapping("/vcRequest")
		public String edmsVcPage(Model m) {
			Employee loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			m.addAttribute("loginEmp",loginEmp);
			return "edms/vcRequest";
		}
		
		
}


