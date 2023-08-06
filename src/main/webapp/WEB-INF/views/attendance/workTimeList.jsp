<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />	
<!-- 헤드 태그 -->
<div id="headTag">
	<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
</div>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 시작 Sidebar -->
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			<link href="${page }/resources/css/yelin.css" rel="stylesheet">
		</div>
		<!-- 사이드바 종료 End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- 상단바 시작 Topbar -->
				<div id="topbar">
					<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
				</div>
				<!-- 상단바 종료 End of Topbar -->

				<!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">

                <!-- 타이틀 Page Heading -->
                <h1 class="h3 text-dark mt-5 mb-5">근태 현황
                	<p class="mt-2 text-secondary" style="font-size:17px">일자별 조회</p>
                </h1>

                    <div class="adminWorkingTimeList-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                    <!-- 근무상태 검색 & 시작및종료일 검색 버튼 영역 -->
                    <div class="row" id="big-search">
                        <!-- 근무상태 검색 버튼 -->
                        <div class="btn-group-toggle mb-3 col-4" data-toggle="buttons">근무 상태
                            <label class="btn btn-outline-primary active ml-2">
                              <input type="radio" name="options" id="option1" value="-1" checked>전체
                            </label>
                            <label class="btn btn-outline-primary">
                              <input type="radio" name="options" id="option2" value="0" >정상
                            </label>
                            <label class="btn btn-outline-primary">
                              <input type="radio" name="options" id="option3" value="3">조퇴
                            </label>
                            <label class="btn btn-outline-primary">
                                <input type="radio" name="options" id="option4" value="4">결근
                              </label>
                        </div>
                        
                        <!-- 버튼으로 상태 검색 -->
						<script>
						$("#big-search input[type=radio]").click(e=>{
							$.ajax({
								url: "/ajaxworkTime",
								data: {"searchNum":e.target.value}, 
								success:function(d){
									$("#wk-tbody").html("");
									console.log(e.target.value);
									console.log(d);
									//const $tbody = $("<tbody>")
									for(let i=0; i<d.length;i++){
										const $tr = $("<tr>");
										const $attDate = $("<td>").text(d[i]["attDate"]);
					                    let status="";
					                     switch(d[i]["status"]){
					                        case 0 : status="정상 출근";break; 
					                        case 2 : status="지각";break;
					                        case 3 : status="조퇴";break;
					                        case 4 : status="결근";break;
					                    }
					                    const $status = $("<td>").text(status);
										const $startTime = $("<td>").text(d[i]["startTime"]);
										const $endTime = $("<td>").text(d[i]["endTime"]);
										const $attTime = $("<td>").text(d[i]["attTime"]);
										
										$tr.append($attDate).append($status).append($startTime).append($endTime).append($attTime);
										
										$("#wk-tbody").append($tr);
									}
								},
								error:function(){
									console.log("ajax 통신 실패");
								}
							})
						})
						</script>
                        
                        
                        
		  				<!-- datepicker -->
						<script>	
			                $(function(){
			                    
			                    $("#datepicker1").datepicker({
			                        changeMonth: true, 
			                        changeYear: true,
			                        nextText: '다음 달',
			                        prevText: '이전 달',
			                        dateFormat: "yy-mm-dd",
			                        yearRange: 'c-50:c+20',
			                        showButtonPanel: true, 
			                        currentText: '오늘 날짜',
			                        closeText: '닫기',
			                        showAnim: "slide",
			                        showMonthAfterYear: true, 
			                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			                        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
			                        onSelect: function(selected){
			                            $("#datepicker2").datepicker("option", "minDate", selected);
			                        }
			                    });	
			                    
			                    $("#datepicker2").datepicker({
			                        changeMonth: true, 
			                        changeYear: true,
			                        minDate: '0',
			                        nextText: '다음 달',
			                        prevText: '이전 달',
			                        dateFormat: "yy-mm-dd",
			                        yearRange: 'c-50:c+20',
			                        showButtonPanel: true, 
			                        currentText: '오늘 날짜',
			                        closeText: '닫기',
			                        showAnim: "slide",
			                        showMonthAfterYear: true, 
			                        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			                        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
			                        onSelect: function(selected){
			                            $("#datepicker1").datepicker("option", "maxDate", selected);
			                        }
			                    });	
			                    
			                });
               			</script> 

				

                        <!-- 근태 시작~종료일 검색 버튼 -->
                        <div class="float-right dateSearch-search mb-3 col-8" id="DateSearch">
                            <button class="float-right btn btn-primary btn-sm">검색</button>
                            <input type="text"  placeholder="종료일" name="endDate" class="float-right mr-1 endDate" id="datepicker2">
                            <input type="text"  placeholder="시작일" name="startDate" class="float-right mr-1 startDate" id="datepicker1">
                        </div>
                        <!-- 기간 검색 - 리스트 조회 -->
					<script>
					$("#DateSearch button").click(e=>{
						$.ajax({
							url:"/ajaxworkTimeSearch",
							data: {
								startDate:$("#DateSearch input[name=startDate]").val(),
								endDate:$("#DateSearch input[name=endDate]").val()
								},
							success:function(dt){
								//console.log(dt[0].no );
								$("#wk-tbody").html("");
								//리스트 새로고침 할 것
								for(let i=0;i<dt.length;i++){
									//const $tr = $("<tr>");
									const $tr = $("<tr>")
									const $attDate = $("<td >").text(dt[i]["attDate"]);
									let status="";
				                     switch(dt[i]["status"]){
				                        case 0 : status= "정상 출근" ; break; 
				                        case 2 : status= "지각" ; break;
				                        case 3 : status= "조퇴" ; break;
				                        case 4 : status= "결근" ; break;
				                    }
									const $status = $("<td>").text(status);
									const $startTime = $("<td>").text(dt[i]["startTime"]);
									const $endTime = $("<td>").text(dt[i]["endTime"]);
									const $attTime = $("<td>").text(dt[i]["attTime"]);
									$tr.append($attDate).append($status).append($startTime).append($endTime).append($attTime);
									
									$("#wk-tbody").append($tr);
								}
							},
							error:function(){
								console.log("ajax 통신 실패");
							}
						})
					})
					</script>
					
                    </div>
                    <!-- 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center" id="wk-table">
                            <colgroup>
                                <col style="width:130px">
                                <col style="width:100px">
                                <col style="width:130px">
                                <col style="width:130px">
                                <col style="width:130px">
                            </colgroup>
                            <!-- table-active -->
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>날짜</th>
                                    <th>근무 상태</th>
                                    <th>출근시간</th>
                                    <th>퇴근 시간</th>
                                    <th>총 근무시간</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white" id="wk-tbody">
                            <c:if test="${not empty wt }">
                            	<c:forEach var="w" items="${wt }">
                             	<tr onclick="workDetail(${w.no});">
                                    <td>${w.attDate }</td>
                                    <td>
                                   		<c:if test="${w.status == '0'}">정상 출근</c:if>
                                    	<c:if test="${w.status == '1'}">출근</c:if>
                                    	<c:if test="${w.status == '2'}">지각</c:if>
                                    	<c:if test="${w.status == '3'}">조퇴</c:if>
                                    	<c:if test="${w.status == '4'}">결근</c:if>
                                    </td>
                                    <td>${w.startTime }</td>
                                    <td>${w.endTime }</td>
                                    <td>${w.attTime }</td>
                                </tr> 
                                </c:forEach>
                              </c:if>
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- 페이징 -->
		            <div class="pasing-area">
		            	<c:out value="${pageBar }" escapeXml="false"/>
		            </div>
		            <script>
						function workDetail(no){
							console.log(no);
							$.ajax({
								url:"workTimeDetail",
								data:{
									attNo:no
								},
							success:function(a){
								console.log(a); 
								const input = $("#workTimeTable td>input[type=text]");
								
								$("#workTimeTable td>input[type=hidden]").val(a[0].no);
								$(input[0]).val(a[0].attDate);
								$(input[1]).val(a[0].startTime);
								$(input[2]).val(a[0].endTime);
								$("#workTimeModify").modal("show");
							},
							error:function(){
								console.log("근태 ajax 통신실패");
							}
						})
						}
					</script>
					
					
		
		            <!-- The Modal -->
        			<div id="workTime">
                    <div class="modal fade text-center" id="workTimeModify" tabindex="-1" role="dialog"
                        aria-activedescendant="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-dark text-white">
                                    <h5 class="modal-title" id="exampleModalLabel">출퇴근 시간 변경</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <form action="${path }/workTimeModify" class="dayOff"  onsubmit="return confirm('변경?')" method="post">
                                <!-- Modal body -->        
                                <div class="modal-body">
                                    <table id="workTimeTable" class="table table-borderless text-dark">
                                            <colgroup>
                                                <col style="width:30%">
                                                <col style="width:70%">
                                            </colgroup>
                                            <tr>
                                                <th class="align-middle"></th>
                                                <td class="font-weight-bold">
                                                	<input type="hidden" class="form-control inputSize" name="att_no">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">수정할 날짜</th>
                                                <td class="font-weight-bold">
                                                	<input type="text" class="form-control inputSize" name="workDate" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">지정 출근 시간</th>
                                                <td class="font-weight-bold">
                                                	<input type="text" class="form-control inputSize" name="workStart" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">지정 퇴근 시간</th>
                                                <td>
                                                    <input type="text" class="form-control inputSize" name="workDate" readonly>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <th class="align-middle">수정할 출근 시간</th>
                                                <td>
                                                    <input type="time" class="form-control form-control-sm" name="re_start_time">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">수정할 퇴근 시간</th>
                                                <td>
                                                    <input type="time" class="form-control form-control-sm" name="re_end_time">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">신청 사유</th>
                                                <td>
                                                    <textarea class="form-control" name="re_content" placeholder="사유를 입력하세요." rows="3" maxlength="99" style="resize: none;"></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary"">수정</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                </div>
                              </form>
                            </div>
                        </div>        
                    </div>
                </div>
		            
		            
                        
                    </div>
                </div>
				<!-- 수정할 컨테이너 종료 End of Main Content -->
			</div>
			
			
			
			
			
 			


			<!-- Footer -->
			<div id="footer">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- 부트스트랩 스크립트 -->
	<div id="bootstrap">
		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
	</div>
<!-- datepicker -->
 <!--  <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>

</html>