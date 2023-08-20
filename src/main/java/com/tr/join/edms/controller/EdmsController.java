package com.tr.join.edms.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tr.join.common.PageFactory;
import com.tr.join.common.PageFactoryEdms;
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
		        int result = service.insertbsn(e); // Assume service.insertbsn(e) returns the result
		        if (result > 0) {
		            model.addAttribute("msg", "출장신청이 완료되었습니다.");
		            model.addAttribute("loc", "/edms/bsnList");
		        } else {
		            for (Attachment a : e.getFile()) {
		                File delFile = new File(path + a.getRenamedFilename());
		                delFile.delete();
		            }

		            model.addAttribute("msg", "출장신청이 완료되었습니다.");
		            model.addAttribute("loc", "/edms/bsnRequest");
		        }

		        return "common/msg";
		    } catch (RuntimeException e1) {
		        e1.printStackTrace();
		        for (Attachment a : e.getFile()) {
		            File delFile = new File(path + a.getRenamedFilename());
		            delFile.delete();
		        }

		        model.addAttribute("msg", "출장신청이 실패되었습니다.");
		        model.addAttribute("loc", "/edms/bsnRequest");

		        return "common/msg";
		    }
		}
		
	
	
	
	
	
	
	//파일 다운로드 하는 메소드 
	@RequestMapping("/filedownload")
	public void fileDown(String oriname, String rename, OutputStream out,
			@RequestHeader(value="user-agent") String header,
			HttpSession session,
			HttpServletResponse res) {
		
		String path=session.getServletContext().getRealPath("/resources/upload/edms/");
		File downloadFile=new File(path+rename);
		try(FileInputStream fis=new FileInputStream(downloadFile);
				BufferedInputStream bis=new BufferedInputStream(fis);
				BufferedOutputStream bos=new BufferedOutputStream(out)) {
			
			boolean isMS=header.contains("Trident")||header.contains("MSIE");
			String ecodeRename="";
			if(isMS) {
				ecodeRename=URLEncoder.encode(oriname,"UTF-8");
				ecodeRename=ecodeRename.replaceAll("\\+","%20");
			}else {
				ecodeRename=new String(oriname.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/octet-stream;charset=utf-8");
			res.setHeader("Content-Disposition","attachment;filename=\""+ecodeRename+"\"");
			
			int read=-1;
			while((read=bis.read())!=-1) {
				bos.write(read);
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
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
			Map<String,Object> param=Map.of("empNo",loginEmp.getNo(),"loginEmp",loginEmp.getName(),"cPage",cPage,"numPerpage",numPerpage);
			List<Edms> list=service.selectBsnAll(param);
			//int totalData=service.selectSearchCount(param);
			int totalData=service.selectCount(param);
			
			//페이징처리 
			m.addAttribute("pageBar",PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/bsnList",param));
			m.addAttribute("totalData",totalData);
			m.addAttribute("edms",list);
			int pageStartRowNum = totalData - (cPage-1)*numPerpage;
			m.addAttribute("pageStartRowNum", pageStartRowNum);
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
	
	
		
		//어드민 출장 체크리스트 삭제하기 
		
		@RequestMapping("/ajax/deleteEdms")
		@ResponseBody
		public int deleteEdms(Edms e, @RequestParam(value="edmsList[]") ArrayList<Integer> edmsList) {
			System.out.println(edmsList);
			int result=0;
			for(int i=0; i<edmsList.size(); i++) {
				e.setNo(edmsList.get(i));
				result +=service.deleteEdms(e);
			}
			return result ;
		}
		
		//어드민 연차 체크리스트 삭제하기
		@RequestMapping("/ajax/deleteVcBtn")
		@ResponseBody
		public int deleteVcBtn(Edms e, @RequestParam(value="edmsVcList[]") ArrayList<Integer> edmsVcList) {
			System.out.println(edmsVcList);
			int result=0;
			for(int i=0; i<edmsVcList.size(); i++) {
				e.setNo(edmsVcList.get(i));
				result +=service.deleteVcBtn(e);
			}
			return result ;
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
	
	//어드민 연차 출력하기 
			@GetMapping("/adminVc")
			public String adminVcSelect(@RequestParam(value="cPage", defaultValue="1") int cPage,
					@RequestParam(value="numPerpage", defaultValue="5")int numPerpage,Model m) {
				
				
				Map<String,Object> param=Map.of("cPage",cPage,"numPerpage",numPerpage);
				List<Edms> edms=service.adminVcSelect(param);
					int totalData=service.selectAdminCount(param);
					m.addAttribute("pageBar", PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/adminVc", param));
					m.addAttribute("totalData",totalData);
					m.addAttribute("edms",edms);
				
					edms.forEach(System.out::println);
					return "admin/adminVc";
				}
	
	//ajax 버튼 상태 검색 
	@GetMapping("adminVc/btn")
	@ResponseBody 
	public List<Edms> vcEdmsByStatus(int searchNum){
		Map<String,Object> param= new HashMap();
		param.put("searchNum", searchNum);
		List<Edms> list=service.vcEdmsByStatus(param);
		return list;
	}
	
	/*
	 * //ajax 결재 상태 검색
	 * 
	 * @GetMapping("/adminBsn/select")
	 * 
	 * @ResponseBody public List<Edms> searchEdmsByStatus(int searchNum){
	 * Map<String,Object> ajaxParam= new HashMap(); 
	 * ajaxParam.put("searchNum",
	 * searchNum); List<Edms> list= service.searchEdmsByStatus(ajaxParam);
	 * 
	 * return list; }
	 */
	
	//어드민 출장 전체출력하기 
	
			@GetMapping("/adminBsn")
			public String adminBsnSelect(@RequestParam(value="cPage", defaultValue="1") int cPage,
					@RequestParam(value="numPerpage", defaultValue="5")int numPerpage,Model m) {
				Map<String,Object> param=Map.of("cPage",cPage,"numPerpage",numPerpage);
				
				List<Edms> edms=service.adminBsnSelect(param);
				int totalData=service.selectAdminCount(param);
				m.addAttribute("pageBar", PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/adminBsn", param));
				m.addAttribute("totalData",totalData);
				m.addAttribute("edms",edms);
				int pageStartRowNum = totalData - (cPage-1)*numPerpage;
				m.addAttribute("pageStartRowNum", pageStartRowNum);
				edms.forEach(System.out::println);
				//System.out.println(m);
				return "admin/adminBsn";
			}
	

	
	//ajax 결재상태 버튼 검색 페이징 처리 
	@GetMapping("/adminBsn/select")
	@ResponseBody
	public Map<String,Object> searchEdmsByStatus(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage,
			@RequestParam int searchNum,Model m)throws Exception{
		
		
	Map<String,Object> ajaxParam =new HashMap<>();
	
	
	Map<String,Integer> page=Map.of("cPage",cPage,"numPerpage",numPerpage);
	List<Edms> searchEdmsByStatus=service.searchEdmsByStatus(ajaxParam,page);
		
	ajaxParam.put("cPage",cPage);
	ajaxParam.put("numPerpage",numPerpage);
	ajaxParam.put("searchNum", searchNum);
	int totalData=service.selectajCount(ajaxParam);
	m.addAttribute("totalData", totalData);
	m.addAttribute("ajaxParam", searchEdmsByStatus);
	int pageStartRowNum = totalData - (cPage-1)*numPerpage;
	m.addAttribute("pageStartRowNum", pageStartRowNum);
	String pageBar=PageFactoryEdms.getAjaxPaging(cPage, numPerpage, totalData, "/adminBsn",ajaxParam);
	
	//페이지 바도 처리해줘야함 
	searchEdmsByStatus.forEach(System.out::println);
	

	
	return Map.of("ajaxParam",searchEdmsByStatus,"pageBar",pageBar);
	
	
	}

	
	//에이젝스 검색 기능 구현 
	
	@GetMapping("/adminBsn/search")
	@ResponseBody
	public Map<String,Object> search(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage,
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword, Model m) throws Exception{
		
		Edms edms= new Edms();
		edms.setCategory(category);
		edms.setKeyword(keyword);
		
		Map<String,Integer> page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Edms> search =service.search(edms,page);
		Map<String,Object> param=new HashMap();
		
		param.put("cPage",cPage);
		param.put("numPerpage", numPerpage);
		param.put("category", category);
		param.put("keyword", keyword);
		int totalData=service.selectajaxCount(param);
		//m.addAttribute("pageBar",PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/bsnList/eSearch",param));
		m.addAttribute("totalData",totalData);
		m.addAttribute("edms",search);
		int pageStartRowNum = totalData - (cPage-1)*numPerpage;
		m.addAttribute("pageStartRowNum", pageStartRowNum);
		String pageBar=PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/adminBsn",param);
		
		//페이지 바도 처리해줘야함 
		search.forEach(System.out::println);
		
	
		
		return Map.of("edms",search,"pageBar",pageBar);
	}
	
		
	
	
	//에이젝스 이용자 검색 기능 
	
	@GetMapping("/bsnList/eSearch")
	@ResponseBody
	public Map<String,Object> eSearch(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5")int numPerpage,
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword, Model m) throws Exception{
		Employee loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		m.addAttribute("loginEmp",loginEmp);
		
	
		Edms edms = new Edms();
		edms.setCategory(category);
		edms.setKeyword(keyword);
		edms.setEmpNo(loginEmp.getNo());
		
		Map<String,Integer> page=Map.of("cPage",cPage,"numPerpage",numPerpage);
		List<Edms> eSearch =service.eSearch(edms,page);
		Map<String,Object> param=new HashMap();
		
		param.put("cPage",cPage);
		param.put("numPerpage",numPerpage);
		param.put("category",category);
		param.put("keyword",keyword);
		param.put("empNo",loginEmp.getNo());
		int totalData=service.selectSearchCount(param);
		//m.addAttribute("pageBar",PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/bsnList/eSearch",param));
		m.addAttribute("totalData",totalData);
		m.addAttribute("edms",eSearch);
		String pageBar=PageFactoryEdms.getAjaxPageNo(cPage, numPerpage, totalData, "/bsnList/eSearch",param);
		
		//페이지 바도 처리해줘야함 
		eSearch.forEach(System.out::println);
		
	
		
		return Map.of("edms",eSearch,"pageBar",pageBar);
	}
	
	
	
	//@RequestMapping("/paging")
	//public String paging(@RequestParam(value="cPage",defaultValue="1")int cPage,
	//		@RequestParam(value="numPerpage",defaultValue="5")int numPerpage) {
	//	List<Edms> list=service.selectPage(cPage,numPerpage);
	//	return "";
	//}
	
	
	
	
	
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


