<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤드 태그 -->
<div id="headTag">
	<!-- 풀캘린더 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
    <!-- 풀캘린더 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</div>
<body id="page-top">
	<div id="wrapper">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			<link href="${path }/resources/css/yelin.css" rel="stylesheet">
		</div>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- 상단바 시작 -->
				<div id="topbar">
					<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
				</div>


				<!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid">
					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark ml-5"></h1>
					
					<div class="workingTimeMain-container"> 
						<div class="full-div row">
							<div class="left-div mt-2">
								<!-- 현재시간과 출퇴근 버튼창 -->
								<div class="button-div border border-secondary ml-3 "
									id="wtm-button">
									<p id="wk-title">근태 관리</p>
									<p id="wk-date"></p>
									<p id="wk-todate"></p>
									
									<div class="startendTable">
										<table id="startTimes">
											<tr>
												<td>출근 시간</td>
												<td id="startResult"></td>
											</tr>
											<tr>
												<td>퇴근 시간</td>
												<td id="endResult"></td>
												<!-- 끝나는 시간이 비어있지 않을 떄, 출력 
													아닐 때, 끝나는 시간 출력
												 -->
												
											</tr>
										</table>
									</div>
									<div class="startendBtn mt-4">
										<button class="btn btn-primary btn-sm mr-2" id="startBtn" 
											onclick="startResult();">출근</button>
										<button class="btn btn-primary btn-sm" id="endBtn" 
											onclick="endResult();">퇴근</button>
									</div>
								</div>
								<!-- 사이드바 페이지 -->
								<div class="sidebar-div border border-secondary ml-3"
									id="sidebar-div">
									<a href="${path }/workTimeMain"><p id="fP">근태 현황</p></a>
									<p id="sP">내 근태 현황</p>
									<a href="${path }/workTimeWeekly"><p id="tP">주차별 근태 조회</p></a>
									<a href="${path }/workTimeList"><p id="fiP">일자별 근태 조회</p></a>
									<a href="${path }/dayoffList"><p id="siP">내 연차 현황</p></a>
									
								</div>
							</div>
							<div class="right-div mt-2" id="rightDiv">
								<!-- 오늘 날짜 -->
								<h3 class="row justify-content-center text-dark font-weight-bold mb-4" id="main-date"></h3>
								<!-- 누적 시간 테이블 -->
								<div class="row justify-content-center mb-5" id="timeTable">
									<table id="timeMain">
										<tr>
											<td class="border-dark border-right" id="weekWork">이번주 누적</td>
											<td class="border-dark border-right">이번주 초과</td>
											<td class="border-dark border-right">이번주 잔여</td>
											<td class="border-dark ">이번달 누적</td>
										</tr>
										<tr>
											<td class="border-dark border-right" id="df-num">${week.weekTime}</td>
											<td class="border-dark border-right" id="df-num">${overWeek.overTime}</td>
											<td class="border-dark border-right" id="df-num">${remainWeek.remainTime}</td>
											<td class="border-dark" id="df-num">${month.monthTime}</td>
										</tr>
									</table>
								</div>
								<div class="wt-calender border border-secondary" id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
 			<!-- 캘린더  -->
		  	<script>
		    	document.addEventListener('DOMContentLoaded', function() {
		    	  var calendarEl = document.getElementById('calendar');
		    	  var calendar = new FullCalendar.Calendar(calendarEl, {
		    	    initialView: 'dayGridMonth',
		    	    height:'580px', //calendar 높이 설정
			    	headerToolbar: {
			    		left: '',
			    		center: 'prev title next',
			    		right:'',
			    	},
			    	locale: 'ko', //한국어
			    	/* eventLimit: true, */ //달력 셀 크기보다 이벤트가 많이 등록되어 있는 경우 'more'로 표기 
			    	events: 
			    	[
			    		
			    	/* 	 { //정상 출근 시 회색
			    			title: '①출근' + ' ' + '08:55:00',
			    			start: '2023-07-27',
			    			color:'rgb(224, 224, 224)',
		                    textColor:'rgb(51,51,51)',
			    		}, */
			    		 /*
			    		{
			    			title: '②퇴근' + ' ' + '18:20:00',
			    			start: '2023-07-27',
			    			color:'rgb(224, 224, 224)',
		                    textColor:'rgb(51,51,51)',
			    		},
			    		{ //지각 시 초록색 
			    			title: '②퇴근' + ' ' + '18:20:00',
			    			start: '2023-07-26',
			    			color:'rgba(28, 148, 64, 0.72)',
		                    textColor:'rgb(50,50,50)',
			    		} */
			    		
			    		
			    		$(function(){
			    			$.ajax({
			    				url:"/att/workCalendar",
			    				success:function(model){
			    					console.log(model.attInfo[0].status);
			    					console.log(model.attInfo[1].attDate.replace(".","-")); //2023.07.29
			    					
			    					for(i=0; i<model.attInfo.length; i++){
			    						if(model.attInfo[i].status == 4) {
				    						calendar.addEvent({
				    						title: "결근 ",
				    						start: model.attInfo[i].attDate.replaceAll(".","-"),//형태를 맞춰줘야 한다 !!!!
				    						color:'rgba(192, 57, 43, 0.79)',
				                            textColor:'rgb(255, 255, 255)'
				    						}) 
			    						}else if(model.attInfo[i].status == 1 || model.attInfo[i].status == 2){ //출근 상태일 때
			    								calendar.addEvent({
					    						title: "①출근 " + model.attInfo[i].startTime,
					    						start: model.attInfo[i].attDate.replaceAll(".","-"),
					    						color:'rgba(241, 196, 15, 0.72)',
			                                    textColor:'rgb(51, 51, 51)'
			    								})
			    								if(model.attInfo[i].endTime == null){ //퇴근 시간 누락 시
				    								calendar.addEvent({
							    					title: "②퇴근 " ,
							    					start: model.attInfo[i].attDate.replaceAll(".","-"),
							    					color:'rgba(241, 196, 15, 0.72)',
					                                textColor:'rgb(51, 51, 51)'
			    									})
			    							}else{ //퇴근시간 기입 시
				    							calendar.addEvent({
							    				title: "②퇴근 " + model.attInfo[i].endTime, 
							    				start: model.attInfo[i].attDate.replaceAll(".","-"),
							    				color:'rgba(241, 196, 15, 0.72)',
					                            textColor:'rgb(51, 51, 51)'
				    							})
			    						}
			    						}else if(model.attInfo[i].status == 3){ //출근 후 조퇴 할 때
			    								calendar.addEvent({
					    						title: "①출근 " + model.attInfo[i].startTime,
					    						start: model.attInfo[i].attDate.replaceAll(".","-"),
					    						color:'rgba(241, 196, 15, 0.72)',
			                                    textColor:'rgb(51, 51, 51)'
			    								})
			    								if(model.attInfo[i].endTime == null){ //퇴근 시간 누락 시
				    								calendar.addEvent({
							    					title: "조퇴 " ,
							    					start: model.attInfo[i].attDate.replaceAll(".","-"),
							    					color:'rgba(29, 150, 65, 0.79)',
						                            textColor:'rgb(255, 255, 255)'
			    									})
			    							}else{ //퇴근시간 기입 시
				    							calendar.addEvent({
							    				title: "조퇴 " + model.attInfo[i].endTime, 
							    				start: model.attInfo[i].attDate.replaceAll(".","-"),
							    				color:'rgba(29, 150, 65, 0.79)',
					                            textColor:'rgb(255, 255, 255)'
				    							})
			    							}
			    								
			    						}else if(model.attInfo[i].status == 0){ //정상 출근일 경우
			    								calendar.addEvent({
					    						title: "①출근 " + model.attInfo[i].startTime,
					    						start: model.attInfo[i].attDate.replaceAll(".","-"),
					    						color:'rgba(241, 196, 15, 0.72)',
			                                    textColor:'rgb(51, 51, 51)'
			    								})
			    								if(model.attInfo[i].endTime == null){
			    										calendar.addEvent({
								    					title: "②퇴근 " ,
								    					start: model.attInfo[i].attDate.replaceAll(".","-"),
								    					color:'rgba(241, 196, 15, 0.72)',
						                                textColor:'rgb(51, 51, 51)'
				    									})
			    								}else{
			    										calendar.addEvent({
									    				title: "②퇴근 " + model.attInfo[i].endTime, 
									    				start: model.attInfo[i].attDate.replaceAll(".","-"),
									    				color:'rgba(241, 196, 15, 0.72)',
							                            textColor:'rgb(51, 51, 51)'
						    							})
			    								}
			    						}
			    					}//for문 끝
		    				}, //success 닫기
			    				error:function(){
									console.log("근태캘린더 ajax통신 실패");
								}
			    			})
			    		})
			    		
			    	]
		    	  });
		     	 calendar.render();
		   	 });
		  	</script>
		  	
		   <!-- 오늘 날짜와 시간 출력 -->
		   <script>
		        $(function(){
		            var today = new Date();
		            var year = today.getFullYear();
		            var month = ('0' + (today.getMonth() + 1)).slice(-2);
		            var day = ('0' + today.getDate()).slice(-2);
		            var week = new Array('일', '월', '화', '수', '목', '금', '토');
		
		            var dateString = year + '년 ' + month  + '월 ' + day + '일' + '(' + week[today.getDay()] + ')';
		            $("#wk-date").text(dateString);
		            
		            var mainDate = year + "-" + month + "-" + day
		            $("#main-date").text(mainDate);
		        })
		    </script>
			<script>
					setInterval(()=>{
						const date = new Date();
						$("#wk-todate").text(changeDouble(date.getHours())+":"
								+changeDouble(date.getMinutes())+":"
								+changeDouble(date.getSeconds()));
					}),1000	 
					function changeDouble(number){
						if(number<10){
							return "0"+number;
						}
						return number;
					}
			</script>
			
			<!-- 근태 출퇴근 버튼 -->
			<script>
			<!-- 출근 버튼 -->
			function startResult(){
				$.ajax({
					url:"${path}/att/startInsert",
					data:{"startTime":$("#wk-todate").text()}, //화면에 출력되는 시간 startTime으로 전달 
					success:function(start){ //attendanceResult에 담긴 값이 start로 들어온다 
						//console.log(start);
						const $td =$("<td>");
						$td.text(start.startTime); 
						$("#startResult").append($td);
						//시작시간이 비어있지 않으면 시작 버튼을 누를 수 없도록
						$("#startBtn").attr("disabled", true); 
					},
					error:function(){
						console.log("출근시간입력 ajax통신 실패");
					}
				})
			}
			</script>
			<!-- 퇴근 버튼 -->
			<script>
			function endResult(){
				$.ajax({
					url:"${path}/att/endInsert",
					data:{"endTime":$("#wk-todate").text()},
					success:function(end){
						//console.log(end);
						const $td = $("<td>");
						$td.text(end.endTime);
						$("#endResult").append($td);
						//퇴근시간이 비어있지 않으면 버튼버튼을 누를 수 없다
						$("#endBtn").attr("disabled", true);
					},
					error:function(){
						console.log("퇴근시간입력 ajax통신 실패");
						
						
					}
				})
			}
			
		</script>



			<!-- Footer -->
			<div id="footer">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			</div>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>



</body>

=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤드 태그 -->
<div id="headTag">
	<!-- 풀캘린더 -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
    <!-- 풀캘린더 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</div>
<body id="page-top">
	<div id="wrapper">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			<link href="${path }/resources/css/yelin.css" rel="stylesheet">
		</div>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- 상단바 시작 -->
				<div id="topbar">
					<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
				</div>


				<!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid">
					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark ml-5"></h1>
					
					<div class="workingTimeMain-container"> 
						<div class="full-div row">
							<div class="left-div mt-2">
								<!-- 현재시간과 출퇴근 버튼창 -->
								<div class="button-div border border-secondary ml-3 "
									id="wtm-button">
									<p id="wk-title">근태 관리</p>
									<p id="wk-date"></p>
									<p id="wk-todate"></p>
									
									<div class="startendTable">
										<table id="startTimes">
											<tr>
												<td>출근 시간</td>
												<td id="startResult"></td>
											</tr>
											<tr>
												<td>퇴근 시간</td>
												<td id="endResult"></td>
												<!-- 끝나는 시간이 비어있지 않을 떄, 출력 
													아닐 때, 끝나는 시간 출력
												 -->
												
											</tr>
										</table>
									</div>
									<div class="startendBtn mt-4">
										<button class="btn btn-primary btn-sm mr-2" id="startBtn" 
											onclick="startResult();">출근</button>
										<button class="btn btn-primary btn-sm" id="endBtn" 
											onclick="endResult();">퇴근</button>
									</div>
								</div>
								<!-- 사이드바 페이지 -->
								<div class="sidebar-div border border-secondary ml-3"
									id="sidebar-div">
									<p id="fP">근태 현황</p>
									<p id="sP">내 근태 현황</p>
									<p id="tP">주차별 근태 조회</p>
									<p id="fiP">일자별 근태 조회</p>
									<p id="siP">내 연차 현황</p>
								</div>
							</div>
							<div class="right-div mt-2" id="rightDiv">
								<!-- 오늘 날짜 -->
								<h3 class="row justify-content-center text-dark font-weight-bold mb-4" id="main-date"></h3>
								<!-- 누적 시간 테이블 -->
								<div class="row justify-content-center mb-5" id="timeTable">
									<table id="timeMain">
										<tr>
											<td class="border-dark border-right" id="weekWork">이번주 누적</td>
											<td class="border-dark border-right">이번주 초과</td>
											<td class="border-dark border-right">이번주 잔여</td>
											<td class="border-dark ">이번달 누적</td>
										</tr>
										<tr>
											<td class="border-dark border-right" id="df-num">${week.weekTime}</td>
											<td class="border-dark border-right" id="df-num">${overWeek.overTime}</td>
											<td class="border-dark border-right" id="df-num">${remainWeek.remainTime}</td>
											<td class="border-dark" id="df-num">${month.monthTime}</td>
										</tr>
									</table>
								</div>
								<!-- 캘린더 -->
								<div class="wt-calender border border-secondary" id="calendar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
 			<!-- 캘린더  -->
		  	<script>
		    	document.addEventListener('DOMContentLoaded', function() {
		    	  var calendarEl = document.getElementById('calendar');
		    	  var calendar = new FullCalendar.Calendar(calendarEl, {
		    	    initialView: 'dayGridMonth',
		    	    height:'580px', //calendar 높이 설정
			    	headerToolbar: {
			    		left: '',
			    		center: 'prev title next',
			    		right:'',
			    	},
			    	locale: 'ko', //한국어
			    	/* eventLimit: true, */ //달력 셀 크기보다 이벤트가 많이 등록되어 있는 경우 'more'로 표기 
			    	events: 
			    	[
			    		
			    	/* 	 { //정상 출근 시 회색
			    			title: '①출근' + ' ' + '08:55:00',
			    			start: '2023-07-27',
			    			color:'rgb(224, 224, 224)',
		                    textColor:'rgb(51,51,51)',
			    		}, */
			    		 /*
			    		{
			    			title: '②퇴근' + ' ' + '18:20:00',
			    			start: '2023-07-27',
			    			color:'rgb(224, 224, 224)',
		                    textColor:'rgb(51,51,51)',
			    		},
			    		{ //지각 시 초록색 
			    			title: '②퇴근' + ' ' + '18:20:00',
			    			start: '2023-07-26',
			    			color:'rgba(28, 148, 64, 0.72)',
		                    textColor:'rgb(50,50,50)',
			    		} */
			    		
			    		
			    		$(function(){
			    			$.ajax({
			    				url:"/att/workCalendar",
			    				success:function(model){
			    					console.log(model.attInfo[0].status);
			    					console.log(model.attInfo[1].attDate); //2023.07.29
			    					
			    					
			    					for(i=0; i<model.attInfo.length; i++){
				    						calendar.addEvent({
				    						title: "출근 ",
				    						start: '2023-07-28',//model.attInfo[1].attDate,
				    						color:'rgba(192, 57, 43, 0.79)',
				                            textColor:'rgb(255, 255, 255)'
				    						}) 
			    					}		
		    				}, //success 닫기
			    				error:function(){
									console.log("근태캘린더 ajax통신 실패");
								}
			    			})
			    		})
			    		
			    	]
		    	  });
		     	 calendar.render();
		   	 });
		  	</script>
		  	
		   <!-- 오늘 날짜와 시간 출력 -->
		   <script>
		        $(function(){
		            var today = new Date();
		            var year = today.getFullYear();
		            var month = ('0' + (today.getMonth() + 1)).slice(-2);
		            var day = ('0' + today.getDate()).slice(-2);
		            var week = new Array('일', '월', '화', '수', '목', '금', '토');
		
		            var dateString = year + '년 ' + month  + '월 ' + day + '일' + '(' + week[today.getDay()] + ')';
		            $("#wk-date").text(dateString);
		            
		            var mainDate = year + "-" + month + "-" + day
		            $("#main-date").text(mainDate);
		        })
		    </script>
			<script>
					setInterval(()=>{
						const date = new Date();
						$("#wk-todate").text(changeDouble(date.getHours())+":"
								+changeDouble(date.getMinutes())+":"
								+changeDouble(date.getSeconds()));
					}),1000	 
					function changeDouble(number){
						if(number<10){
							return "0"+number;
						}
						return number;
					}
			</script>
			
			<!-- 근태 출퇴근 버튼 -->
			<script>
			<!-- 출근 버튼 -->
			function startResult(){
				$.ajax({
					url:"${path}/att/startInsert",
					data:{"startTime":$("#wk-todate").text()}, //화면에 출력되는 시간 startTime으로 전달 
					success:function(start){ //attendanceResult에 담긴 값이 start로 들어온다 
						//console.log(start);
						const $td =$("<td>");
						$td.text(start.startTime); 
						$("#startResult").append($td);
						//시작시간이 비어있지 않으면 시작 버튼을 누를 수 없도록
						$("#startBtn").attr("disabled", true); 
					},
					error:function(){
						console.log("출근시간입력 ajax통신 실패");
					}
				})
			}
			</script>
			<!-- 퇴근 버튼 -->
			<script>
			function endResult(){
				$.ajax({
					url:"${path}/att/endInsert",
					data:{"endTime":$("#wk-todate").text()},
					success:function(end){
						//console.log(end);
						const $td = $("<td>");
						$td.text(end.endTime);
						$("#endResult").append($td);
						//퇴근시간이 비어있지 않으면 버튼버튼을 누를 수 없다
						$("#endBtn").attr("disabled", true);
					},
					error:function(){
						console.log("퇴근시간입력 ajax통신 실패");
						
						
					}
				})
			}
			
		</script>
	<!-- 	<script>
		$(function(){
           
			
			
            $("#main-date").text(mainDate);
        })
		</script> -->
			


















			<!-- Footer -->
			<div id="footer">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			</div>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>



</body>


</html>