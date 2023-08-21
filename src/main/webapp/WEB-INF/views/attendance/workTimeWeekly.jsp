<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<link href="${pageContext.request.contextPath }/resources/css/yelin.css" rel="stylesheet">
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
				<!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 ml-2">근태현황
                    	<p class="mt-2 text-secondary" style="font-size:17px">주차별 조회</p>
                    </h1>
                    <div class="workingTimeWeekly-container ">
                        <!-- 오늘 날짜 -->
                        <h3 class="dfDate row justify-content-center text-dark font-weight-bold mb-5" id="Weekly_date"></h3>
                        <script>
					        $(function(){
					            var today = new Date();
					            var year = today.getFullYear();
					            var month = ('0' + (today.getMonth() + 1)).slice(-2);
					            var day = ('0' + today.getDate()).slice(-2);
					            var week = new Array('일', '월', '화', '수', '목', '금', '토');
					
					            var mainDate = year + "-" + month + "-" + day
					            $("#Weekly_date").text(mainDate);
					        })
					    </script>
					    
					    
					    
					    <script>
						    function weekcheckTest(weekworkList){
						    	
						        const today=new Date();
						        const cMonth=today.getMonth();
						        const cYear=today.getFullYear();
	
						        let i=1;
						        let weekCount=1;
						        $("#accordion").html("");
						        while(true){
						          const todayStart=new Date(cYear,cMonth,i++);
						          const week=todayStart.getDay(); 
						          if(todayStart.getMonth()!=cMonth){ 
						            break;
						          }     
						          if(weekCount==1||(week==6 && (i!=30&&i!=31))){ 
						        	const card=$("#targetcard").clone().show();
						          	card.removeAttr("id");
						          	card.find("div.bbtn>button").text((weekCount)+'주차').attr({
						          		"data-target":"#collapse"+weekCount,
						          		"aria-controls":"collapse"+weekCount
						          	});
						          	card.children("div").last().attr("id","collapse"+weekCount)
						          	$("#accordion").append(card);
						            weekCount++;
						          }
						          addWeekDay(week,todayStart);
						        }
						        //해당 주차 날짜출력
						        function addWeekDay(weekNo,targetDay){
						          const week=$("#container .week");
						          const weekname=["일","월","화","수","목","금","토"];
						          let tbody=""
						          switch(weekNo){
						          	case 6 : tbody=$("#accordion>.card").last().prev().find("table>tbody");break;
						          	default : tbody=$("#accordion>.card").last().find("table>tbody");break;
						          }
						          const tr=$("<tr>");
						          const day=$("<td>").text(targetDay.getFullYear()+"-"+(targetDay.getMonth()<10?"0":"")+(targetDay.getMonth()+1)+"-"
						        		  +(targetDay.getDate()<10?"0":"")+targetDay.getDate()+" "+weekname[weekNo]);
						          tr.append(day);
						          
						          weekworkList.filter(e=>{
						        	  if(new Date(e.attDate.replaceAll(".","-")).getDate()==targetDay.getDate()){
						        		  const start=$("<td>").text(e.startTime);
						        		  const end=$("<td>").text(e.endTime);
						        		  const total=$("<td>").text(e.attTime);
						        		  tr.append(start).append(end).append(total);
						        	  };
						          }); 
						          tbody.append(tr);
						        }
							}
						    </script>
						    
						    <script> 
					    	$.ajax({
					    		url:"${pageContext.request.contextPath }/workTimeWeeklyData",
					    		success:function(w){
					    			weekcheckTest(w);
					    		}
							 })
						    </script>
						    
                        <!-- 주차별 아코디언 -->
                        <div id="accordion">
                    	</div>
                </div>
				<!-- 수정할 컨테이너 종료 End of Main Content -->
			</div>
			</div>
							<div id="targetcard" class="card" style="display:none">
                              <div class="card-header bg-white" id="headingOne">
                                <h5 class="mb-0">
                                <div class="bbtn">
                                    <button  id="container" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    1주차
                                    </button>
                                </div> 
                               <!--  <div id="timetxt">누적 근무 시간<strong>8h 30m 00s</strong></div> -->
                                </h5>
                              </div>
                          
                              <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <table class="table table-sm" id="accordionTable">
                                        <thead>
                                            <tr>
                                                <th>일자</th>
                                                <th>업무시작</th>
                                                <th>업무종료</th>
                                                <th>총 근무시간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                              </div>
                            </div>

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