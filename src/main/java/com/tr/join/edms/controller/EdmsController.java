package com.tr.join.edms.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.common.PageFactory;
import com.tr.join.edms.model.service.EdmsService;
import com.tr.join.edms.model.vo.Attachment;
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
	
	

	
	@PostMapping("/insertbsn")
	public String insertbsn(Edms e, MultipartFile[] upFile ,HttpSession session, Model model) {
		
		log.info("{}",e);
		log.info("{}",upFile);
		
		//절대 경로 가져오기 
		String path =session.getServletContext().getRealPath("/resources/upload/edms/");
		if(upFile!=null) {				
			for(MultipartFile mf:upFile) {
				if(!mf.isEmpty()) {
					String oriName=mf.getOriginalFilename();
					String ext=oriName.substring(oriName.lastIndexOf("."));
					Date today=new Date(System.currentTimeMillis());
					SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rdn=(int)(Math.random()*10000)+1;
					String rename=sdf.format(today)+"_"+rdn+ext;
					
					try {
						mf.transferTo(new File(path+rename));
					}catch(IOException e1) {
						e1.printStackTrace();
					}
					
					Attachment file=Attachment.builder()
							.originalFilename(oriName)
							.renamedFilename(rename)
							.build();
					
					e.getFile().add(file);
		
				}
			}
		}
		try {
			service.insertbsn(e);
		}catch(RuntimeException e1) {
			e1.printStackTrace();
			for(Attachment a : e.getFile()) {
				File delFile=new File(path+a.getRenamedFilename());
				delFile.delete();
			}
			
			model.addAttribute("msg","출장신청이 실패되었습니다.");
			model.addAttribute("loc","/edms/bsnRequest");
			
			return "common/msg";
		
		}
		return "redirect:/edms/bsnList";
	
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
	//map<string,object>로 바꿈
	//return map.of("",,"",);
		@GetMapping("/bsnList")
		public String selectBsnAll(@RequestParam(value="cPage", defaultValue="1") int cPage,
					@RequestParam(value="numPerpage", defaultValue="5")int numPerpage,Model m){
			Employee loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			List<Edms> list=service.selectBsnAll(Map.of("loginEmp",loginEmp.getName(),"cPage",cPage,"numPerpage",numPerpage));
			int totalData=service.selectEdmsCount();
			//페이징처리 
			m.addAttribute("pageBar",PageFactory.getPage(cPage, numPerpage, totalData, "/bsnList"));
			m.addAttribute("totalData",totalData);
			m.addAttribute("edms",list);
			//페이지 바도 처리해줘야함 
			list.forEach(System.out::println);
			//System.out.println(m);
			return "edms/bsnList" ;
			
		}
	
		
	//전체 화면창 보여주기 
	
	@GetMapping("/edmsView")
	public String selectByNo(Model m , int no) {
		m.addAttribute("edms", service.selectByNo(no));
				//System.out.println(m);
				
				return "edms/bsnView";
}
	
	//어드민 출장 출력하기 
	
		@GetMapping("/adminBsn")
		public String adminBsnSelect(Model m) {
			List<Edms> edms=service.adminBsnSelect();
			m.addAttribute("edms",edms);
			edms.forEach(System.out::println);
			//System.out.println(m);
			return "admin/adminBsn";
		}
		
		//어드민 연차 출력하기 
		@GetMapping("/adminVc")
		public String adminVcSelect(Model m) {
			List<Edms> edms=service.adminVcSelect();
				m.addAttribute("edms",edms);
				edms.forEach(System.out::println);
				return "admin/adminVc";
			}
		
		
	
		//ajax 결재 상태 검색 
		@GetMapping("/adminBsn/select")
		@ResponseBody
		public List<Edms> searchEdmsByStatus(int searchNum){
			Map<String,Object> ajaxParam= new HashMap();
			ajaxParam.put("searchNum", searchNum);
			List<Edms> list= service.searchEdmsByStatus(ajaxParam);
			
			return list;
		}
		
	
	@GetMapping("/adminBnsView")
	public String selectByBsnNo(Model m , int no) {
		m.addAttribute("edms",service.selectByBsnNo(no));
		System.out.println(m);
		System.out.println(no);
		return ("admin/adminBnsView");
	}
	
	
	@GetMapping("/adminVcView")
	public String selectByVcNo(Model m, int no) {
		m.addAttribute("edms",service.selectByVcNo(no));
		System.out.println(m);
		System.out.println(no);
		return("admin/adminVcView");
	}
	
	//에이젝스 검색 기능 구현 
	
	@GetMapping("/adminBsn/search")
	@ResponseBody
	public List<Edms> search(@RequestParam("category") String category, 
			@RequestParam("keyword") String keyword, Model m)throws Exception{
		Edms edms= new Edms();
		edms.setCategory(category);
		edms.setKeyword(keyword);
		List<Edms> search =service.search(edms);
		return search;
	}
	
	//연차 에이젝스 검색 기능 
	@GetMapping("/adminVc/searchVc")
	@ResponseBody
	public List<Edms>searchVc(@RequestParam("category") String category,
			@RequestParam("keyword") String keyword, Model m) throws Exception{
		Edms edms= new Edms();
		edms.setCategory(category);
		edms.setKeyword(keyword);
		List<Edms> searchVc=service.searchVc(edms);
		return searchVc;
		
	}
	
	
	//에이젝스 버튼 클릭 기능 
	@GetMapping("/adminBsnView/statuschange")
	public String updateAppStatus(int no, int appStatus,Model m){
	int result=service.updateAppStatus(Map.of("no",no,"appStatus",appStatus));
	String msg,loc;
	if(result>0) {
		msg="승인 완료되었습니다.";
	loc="/edms/adminBsn";
	}else {
	msg="승인이 반려되었습니다.";
	loc=
	"/admin";
}
m.addAttribute("msg",msg);
m.addAttribute("loc",loc);

	return "common/msg";
	
	}
	
	
	//어드민 계정 상세 view 구현
//	@GetMapping("/adminEdmsView")
	//public String adminByNo(Model m, int no) {
	//	m.addAttribute("edms",service.adminByNo(no));
	//	System.out.println(m);
		
		
	//	return "edms/adminEdmsView";
		
	//}
	
	
	
	
	
	
	
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

	
	//어드민 페이지 구현 
	
	

		
		
		@GetMapping("/adminEdmsView")
		public String adminEdmsViewPg() {
			return "edms/adminEdmsView";
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


