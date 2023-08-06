package com.tr.join.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tr.join.attendance.model.service.AttendanceService;
import com.tr.join.attendance.model.vo.Attendance;
import com.tr.join.attendance.model.vo.DayOff;
import com.tr.join.attendance.model.vo.WorkTime;
import com.tr.join.common.PageFactory;
import com.tr.join.edms.model.vo.Edms;
import com.tr.join.employee.model.vo.Employee;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class AttendanceController {
	
	private AttendanceService service;
	public AttendanceController(AttendanceService service) {
		this.service=service;
	}
	
//	@GetMapping("/workTimeMain")
//	public String workTimeMain() {
//		return "attendance/workTimeMain";
//	}

	@RequestMapping("/att/startInsert")
	@ResponseBody
	//버튼을 누르면 현재 시각이 찍힌다. -> 입력과 출력을 동시에
	//출근 버튼
	public Attendance startInsertAttendance(String startTime) {  // - ajax의 data가 넘긴 값 

		Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //security 로그인 정보
		Map<String,Object> startTimeParam=new HashMap(); //Map 생성
		startTimeParam.put("startTime", startTime); 
		startTimeParam.put("loginNo",loginNo.getNo()); //사원번호 -int형 
		Attendance attendanceResult = service.startInsertAttendance(startTimeParam);
		//System.out.println(attendanceResult);
		//저장이 되면 객체가 반환되고, 저장실패하면 null값반환.
		return attendanceResult;
	}
	
	 //퇴근 버튼
	 @RequestMapping("/att/endInsert")
	 @ResponseBody 
	 public Attendance endInsertAttendance(String endTime) {
		 Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 Map<String,Object> endTimeParam = new HashMap();
		 endTimeParam.put("endTime", endTime);
		 endTimeParam.put("loginNo", loginNo.getNo());
		 Attendance attendanceEndResult = service.endInsertAttendance(endTimeParam);
		 return attendanceEndResult;
	 }
	
	 
	 
	
	//근태 캘린더
	//전체 근태 정보 받아오기. 
	//전체 연차 정보 받아오기. 
	//전체 출장 정보 받아오기. 
	 @RequestMapping("/att/workCalendar")
	 @ResponseBody
	 public Map<String, Object> workCalendar() {
		 Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 
		 List<Attendance> attendanceInfo = service.workCalendarAttendance(loginNo.getNo());
		 //List<Edms> dayoffInfo = service.workCalendarDayoff(loginNo.getNo());
		 List<Edms> tripInfo = service.workCalendarTrip(loginNo.getNo());
			
		 
		 Map<String,Object> calendarParam=new HashMap(); 
		 calendarParam.put("attInfo",attendanceInfo);
		 //calendarParam.put("dayoffInfo",dayoffInfo);
		 calendarParam.put("tripInfo",tripInfo);
			
		 
		 System.out.println(tripInfo);
		 return calendarParam;
	 }
	 
	  //근태 누적/초과/잔여 시간
	  @GetMapping("/workTimeMain")
	  public String workingTime(Model m) { 
		 Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		 Attendance week = service.selectWeekWorkTime(loginNo.getNo()); //이번주 누적 근무 시간
		 Attendance overWeek = service.selectOverWorkTime(loginNo.getNo()); //이번주 초과 근무 시간
		 Attendance remainWeek = service.selectRemainTime(loginNo.getNo()); //이번주 잔여 근무 시간
		 Attendance month = service.selectMonthTime(loginNo.getNo()); //이번달 누적 근무 시간
		 
		 m.addAttribute("week",week);
		 m.addAttribute("overWeek",overWeek);
		 m.addAttribute("remainWeek",remainWeek);
		 m.addAttribute("month",month);
		 System.out.println(month); 
		  
		 return "attendance/workTimeMain";
		
		 }
		
	  //근태 리스트 
	  @GetMapping("/workTimeList")
	  public String selectWorkTimeAll(@RequestParam(value="cPage",defaultValue="1") int cPage, 
										@RequestParam(value="numPerpage", defaultValue="5") int numPerpage, 
										Model m) {
		  
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		  List<Attendance> wt=service.selectWorkTimeAll(Map.of("loginNo",loginNo.getNo(),"cPage",cPage,"numPerpage",numPerpage));
		  
		  int totalData=service.selectWorkTimeCount();  //전체 자료수
		  
		  m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "/WorkTimeList"));
		  m.addAttribute("wt",wt);
		  m.addAttribute("totalData",totalData);
		  
		  System.out.println(wt);
		  //System.out.println(totalData);
		  return "attendance/workTimeList";
		  
	  }
	  
	  
	  //ajax 근태 상태 검색
	  @GetMapping("/ajaxworkTime")
	  @ResponseBody 
	  public List<Attendance> searchWorkTimeByStatus(int searchNum) {
		  
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		  Map<String,Object> ajaxParam=new HashMap(); 
		  ajaxParam.put("searchNum",searchNum); 
		  ajaxParam.put("loginNo",loginNo.getNo()); 
		  List<Attendance> wtajax = service.searchWorkTimeByStatus(ajaxParam);
		  
		  System.out.println(wtajax);
		  
		  return wtajax;
	  }
	  
	  //ajax 근태 (시작일~종료일)기간 검색
	  @GetMapping("/ajaxworkTimeSearch")
	  @ResponseBody
	  public List<Attendance> ajaxworkTimeByDate(String startDate, String endDate){
		 Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 List<Attendance> wkDate = service.ajaxworkTimeByDate(Map.of("startDate",startDate,"endDate",endDate,"loginNo",loginNo.getNo()));
		 
		 System.out.println(wkDate);
		 
		 return wkDate;
	  }
	  
	  //근태 상세 정보
	  @RequestMapping("workTimeDetail")
	  @ResponseBody
	  public List<Attendance> workTimeDetail(int attNo) {
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  Map<String,Object> wkParam=new HashMap(); 
		  wkParam.put("loginNo",loginNo.getNo()); 
		  wkParam.put("attNo",attNo);
		  List<Attendance> at = service.workTimeDetail(wkParam);
		  System.out.println(at);
		  return at;
	  }
	  
	  //근태 출퇴근 수정
	  @RequestMapping("/workTimeModify")
	  public ModelAndView workTimeModify(@RequestParam Map param, ModelAndView mv, HttpSession session) {
		  System.out.println(param);
		  int result = service.insertModifyStartTime(param);
		  
		  if(result>0) {
			  session.setAttribute("alertMsg","와우");
			  mv.setViewName("redirect:/wtModifyList");
		  }
		  return mv;
	  }
	  
	  
	  //근태 출퇴근 수정 리스트
	  @RequestMapping("/wtModifyList")
	  public String selectWorkTimeModify(Model m) {
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		 List<WorkTime> worktime = service.selectWorkTimeModify(Map.of("loginNo",loginNo.getNo()));
		  m.addAttribute("worktime",worktime);
		  System.out.println(m);
		  return "attendance/workTimeModifyList";
	  }


	  //관리자 페이지
	  @GetMapping("/adminWorkTime")
	  public String selectAttendanceAll(@RequestParam(value="cPage",defaultValue="1") int cPage, 
										@RequestParam(value="numPerpage", defaultValue="10") int numPerpage, 
										Model m) {
		  
		  List<Attendance> att=service.selectAttendanceAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
		  int totalData=service.selectAttendanceCount();  //전체 자료수
		  
		  m.addAttribute("pageBar", PageFactory.getPage(cPage, numPerpage, totalData, "/adminWorkTime"));
		  m.addAttribute("att",att);
		  m.addAttribute("totalData",totalData);
		  //System.out.println(m);
		  
		  return "admin/adminWorkTime";
	  }
	  
	  
	  //관리자 : 근태 출퇴근 수정 리스트 
	  @RequestMapping("/adminWorkTimeModify")
	  public String adminWorkTimeModify(Model m) {
		 List<WorkTime> adminWk = service.adminWorkTimeModify();
		 m.addAttribute("adminWk",adminWk);
		 //System.out.println(m);
		  return "admin/adminWorkTimeModify";
	  }
	  
	  //관리자 : 근태 출퇴근 수정 상세 정보
	  @RequestMapping("/adminWkDetail")
	  @ResponseBody
	  public List<WorkTime> adminWkDetail(int wtNo) {
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  Map<String,Object> param=new HashMap(); 
		  param.put("wtNo",wtNo);
		  List<WorkTime> at = service.adminWkDetail(param);
		  //System.out.println(at);
		  return at;
	  }
	  
	  
	  //관리자 : 근태 출퇴근 수정 승인
	  @RequestMapping("/wtModifySubmit")
	  public ModelAndView wtModifySubmit(WorkTime w, ModelAndView mv) {
		  System.out.println(w);
		  //승인 
		  int result = service.updateWtModify(w);
		  int result1 = service.adminModifyWorktimeSubmit(w);
		  if(result>0) {
			  mv.setViewName("redirect:/adminWorkTimeModify");
		  }
		  
		  return mv;
	  }
	  
	  
	  
	  
	  
	  
//-----------------------연차 관리-------------------------------
	  
	  
	  
	  @GetMapping("/dayoffList")
	  public String selectDayoffAll(Model m) {
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		  List<DayOff> dayoff = service.selectDayoffAll(loginNo.getNo());
		  
		  m.addAttribute("dayoff",dayoff);
		  System.out.println(m);
		  
		 return "attendance/dayoffList";
	  }
	  
	  //연차 관리자
	  @GetMapping("/adminDayoff")
	  public String selectAdminDayoffAll(Model m) {

		  List<DayOff> dayoff = service.selectAdminDayoffAll();
		  m.addAttribute("adminDayoff",dayoff);
		  //System.out.println(m);
		  
		  return "admin/adminDayoff";
	  }
	  
	  //연차 전체 사원 리셋
	  @RequestMapping("/amdin/adminResetAll")
	  public ModelAndView adminResetAll(ModelAndView mv) {
		  
		  int result = service.adminResetAll();
		  System.out.println(result);
		  mv.setViewName("redirect:/adminDayoff");
		  
		  return mv;
	  }
	  
	  //연차 선택 사원 리셋
	  @RequestMapping("/admin/checkReset")
	  @ResponseBody
	  public String adminCheckReset(DayOff d, @RequestParam(value="dfList[]") ArrayList<Integer> dfList) {
		  System.out.println(dfList);
		  int result = 1;
		  for(int i=0; i<dfList.size(); i++){
			  d.setNo(dfList.get(i));
			  result = result * service.adminCheckReset(d);
		  }
		  
		  return result> 0 ? "success" : "fail";
	  }
	  
	  //연차 부여
	  @RequestMapping("/admin/insertDayoff")
	  public String insertDayoff(@RequestParam Map param) {
		  System.out.println(param);
		  int result = service.insertDayoff(param);
		  
		  return "redirect:/adminDayoff";
	  }
	  
	  //ajax 연차 사원명&부서명 검색
	  @GetMapping("/ajaxDfSearch")
	  @ResponseBody
	  public List<DayOff> ajaxDfSearch(String searchEmp, String searchDep){
		  System.out.println(searchEmp);
		  System.out.println(searchDep);
		  
		  List<DayOff> dfSearch = service.ajaxDfSearch(Map.of("searchEmp",searchEmp,"searchDep",searchDep));
		  
		  System.out.println(dfSearch);
		  
		  return dfSearch;
	  }
	  
	  //전사 연차 일정 캘린더
//	  @RequestMapping("/att/dayoffCalendar")
//      @ResponseBody
//      public Map<String, Object> dayoffCalendar() {
//         List<Edms> dayoffInfo = service.workCalendarDayoff();
//           
//         Map<String,Object> cParam=new HashMap(); 
//         cParam.put("dayoffInfo",dayoffInfo);
//           
//         System.out.println(dayoffInfo);
//         return cParam;
//      }
	  
	  
	     @RequestMapping("/admin/adminDayoffCalendar")
	       @ResponseBody
	       public ModelAndView pageCalendar(ModelAndView m) {
	          
	          
	         //m.addAttribute("dayoffData",cParam); //내가 받아온 값을 화면으로 출력하고 싶으면 model을 써야 한다. 
	          m.setViewName("/admin/adminDayoffCalendar");
	          
	          return m;
	       }
	     
	  
	  @RequestMapping("/att/dayoffCalendar")
	  @ResponseBody
      public Map<String, Object> dayoffCalendar() {
         List<Edms> dayoffInfo = service.workCalendarDayoff();
           
         Map<String,Object> cParam=new HashMap(); 
         cParam.put("dayoffInfo",dayoffInfo);
         System.out.println(cParam);
         
        //내가 받아온 값을 화면으로 출력하고 싶으면 model을 써야 한다. 
         
         return cParam;
      }
	  
	  
//----------출장-----------------
	  
	  @GetMapping("/businessTripList")
	  public String selectBusinessTrip(Model m) {
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		  List<Edms> edms = service.selectBusinessTrip(loginNo.getNo());
		  int count = service.BusinessTripCount(loginNo.getNo());
				
		  m.addAttribute("edms",edms);
		  m.addAttribute("count",count);
		  System.out.println(m);
		  
		 return "attendance/businessTripList";
	  }
	  
	  @RequestMapping("/deleteBT")
	  public String deleteBusinessTrip(int btNo) {
		  int result = service.deleteBusinessTrip(btNo);
		  System.out.println(result);
		  return "redirect:/businessTripList";
	  }
	  
	  //ajax 출장 취소 내역 확인하기 
	  @GetMapping("/checkCancelList")
	  @ResponseBody //화면에다가 정보를 보내주려면 필요 json 자동 실행
	  public List<Edms> checkCancelList() {
		  Employee loginNo=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		  
		  Map<String, Object> cancelParam = new HashMap();
		  cancelParam.put("loginNo",loginNo.getNo());
		  List<Edms> edms = service.checkCancelList(cancelParam);
		  System.out.println(edms);
		  
		  return edms;
		  
	  }
		
	  //관리자
	  @GetMapping("/adminBusinessTrip")
	  public String adminBusinessTrip(Model m){
		  List<Edms> edms = service.adminBusinessTrip();
		  System.out.println(edms);
		  m.addAttribute("edms",edms);
		  return "admin/adminBusinessTrip";
	  }


	  
	  
	  //ajax 출장 사원명&부서명 검색
	  @GetMapping("/ajaxBtSearch")
	  @ResponseBody
	  public List<Edms> ajaxBtSearch(String searchEmp, String searchDep){
		  System.out.println(searchEmp);
		  System.out.println(searchDep);
		  
		  List<Edms> btSearch = service.ajaxBtSearch(Map.of("searchEmp",searchEmp,"searchDep",searchDep));
		  
		  System.out.println(btSearch);
		  
		  return btSearch;
	  }
	  

	  


	
		@GetMapping("/adminDayoffCalendar")
		public String adminDayoffCalendar() {
			return "admin/adminDayoffCalendar";
	}
	
	
	
	
	@GetMapping("/workTimeWeekly")
		public String workTimeWeekly() {
			return "attendance/workTimeWeekly";
	}
	
	//@GetMapping("/workTimeList")
	public String workTimeList() {
		return "attendance/workTimeList";
}
	

//	@GetMapping("/businessTripList")
//	public String businessTripList() {
//		return "attendance/businessTripList";
//}
	
//	//@GetMapping("/dayoffList")
//	public String dayoffList() {
//		return "attendance/dayoffList";
//}
	
	
/*----------------------관리자 페이지----------------------*/
	
//	@GetMapping("/adminWorkTime")
	public String adminWorkTime() {
		return "admin/adminWorkTime";
}

	
//	@GetMapping("/adminBusinessTrip")
//	public String adminBusinessTrip() {
//		return "admin/adminBusinessTrip";
//}
	
	
	
	
/*----------------------근태 출퇴근 관리 버튼----------------------*/
//	@Autowired
//	private EssService eService; 
//1. 서비스 정의 
//2. json 라이브러리 추가
//3. 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
