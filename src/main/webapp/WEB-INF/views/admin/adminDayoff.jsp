<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤드 태그 -->
<div id="headTag">
	<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
</div>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 시작 Sidebar -->
        <div id="sidebar">
           <jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>
           <link href="${page }/resources/css/yelin.css" rel="stylesheet">
        </div>
        <!-- 사이드바 종료 End of Sidebar -->


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- 상단바 시작 Topbar -->
                <div id="topbar">
                    <jsp:include page="/WEB-INF/views/admin/common/admin_topbar.jsp"/>
                </div>
                <!-- 상단바 종료 End of Topbar -->


              <!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 mb-5">전사원 연차 현황</h1>
                    <div class="adminDayOff-container" > 
                    <!-- 검색 & 부여 버튼 -->
                    <div class="row justify-content-between" id="big-search" >
                    
                        <!-- 사원명 부서명 검색 버튼 -->
                        <div class="float-left mb-3 col-5" id="dayOffSearch">
                        	<input type="text" placeholder="사원명" id="searchEmp" name="name">
                            <input type="text" id="searchDep" placeholder="부서명" name="dept">    
                            <button class="btn btn-dark btn-sm searchDF">검색</button>
                    	</div>                
                        <script>
                        	$("#dayOffSearch button").click(e=>{
                        		$.ajax({
                       				url:"/ajaxDfSearch",
                       				data:{
                       					searchEmp:$("#dayOffSearch input[id=searchEmp]").val(),
                       					searchDep:$("#dayOffSearch input[id=searchDep]").val()
                       				},
                       				success:function(df){
                       					console.log(df[0]);
                       					$("#dftable").html("");
                       					for(let i=0;i<df.length;i++){
                       						const $tr = $("<tr>");
                       						const $td = $("<td>");
                       						const $name = $("<td>").text(df[i]["emp"]["name"]);
                       						const $deptTitle = $("<td>").text(df[i]["emp"]["deptTitle"]);
                       						const $enrollDate = $("<td>").text(df[i]["emp"]["enrollDate"]);
                       						const $resignDate = $("<td>").text(df[i]["emp"]["resignDate"]);
                       						const $total =  $("<td>").text(df[i]["totalDoCount"]);
                       						const $used =  $("<td>").text(df[i]["usedDoCount"]);
                       						const $remain =  $("<td>").text(df[i]["remainDoCount"]);
                       						
                       						
                       						$tr.append($tr).append($td).append($name).append($deptTitle).append($enrollDate).append($resignDate).append($total).append($used).append($remain);
                       						
                       						$("#dftable").append($tr);
                       					}
                       				},
                       				error:function(){
                						console.log("ajax 통신 실패");
                					}
                        	})
                        })
                        	
                        </script>
                        
                         <!-- 연차부여 버튼 -->
                        <div class="btn-member float-right mb-4 mr-3">
                        <button class="btn btn-dark btn-sm mr-2" onclick="updateResetAll();">전체 연차 리셋</button>
                        <button class="btn btn-dark btn-sm mr-2" onclick="updateReset();">연차 리셋</button>
                            <a href="#" data-toggle="modal" onclick="dayoffUpdate();"
                                class="btn btn-dark btn-sm">연차 조정</a>
                        </div>
                   </div>    
                   
                   <script>
                   		function openCalendar(){
                   			var url = "${path}/admin/adminDayoffCalendar"
                   			var name = "adminDayoffCalendar"
                   			var option = "width=1000, height=730, top=10, location=no"
                   			window.open(url,name,option);
                   		};
                   </script>
                   
                    
                    <script>
                    	
                    	function updateResetAll(){
                    		if(confirm("전사원 연차 리셋하시겠습니까?")){
                    			location.href='/amdin/adminResetAll';
                    		}
                    	};
                    
                    	function updateReset(){
                    		if(confirm("선택 사원의 연차를 리셋하시겠습니까?")){
                    			var dfList = [];
                    			$("td>input[type=checkbox]:checked").each(function(){
                    				var ck = $(this).val(); //사용자가 선택한 버튼의 no값이 ck에 담기도록 반복문을 돌린다. 
                    				dfList.push(ck); //배열에 추가해주고 값을 넘긴다.
                    			})
                    			
                    			$.ajax({
                    				url:"/admin/checkReset",
                    				data:{
                    					dfList:dfList
                    				},
                    				success:function(result){
                    					console.log(result);
                    					if(result == "success"){
                    						alert("연차 리셋되었습니다.");
                    						location.replace("/adminDayoff");
                    					}
                    				},
                    				
                    				error:function(){
                    					 console.log("ajax 연차 리셋 통신실패");
                    				}
                    			})
                    			
                    		}
                    	}
                    </script>
                    
                    
                    
                    
                  
                    <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table text-center table-sm">
                            <colgroup>
                                <col style="width:70px">
                                <col style="width:90px">
                                <col style="width:90px">
                                <col style="width:100px">
                                <col style="width:80px">
                                <col style="width:80px">
                                <col style="width:80px">
                                <col style="width:80px">
                            </colgroup>
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>입사일</th>
                                    <th>퇴사일</th>
                                    <th>발생 연차</th>
                                    <th>사용 연차</th>
                                    <th>잔여 연차</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white" id="dftable">
	                            <c:if test="${not empty adminDayoff }">
	                            <c:forEach var="ad" items="${adminDayoff }">
                                <tr>
                                    <td><input type="checkbox" name="ck" value="${ad.no }"></td>
                                    <td>${ad.emp.name }</td>
                                    <td>${ad.emp.deptTitle}</td>
                                    <td>${ad.emp.enrollDate }</td>
                                    <td>
                                    	<c:if test="${ad.emp.resignDate == null}">-</c:if>
                                    	<c:if test="${ad.emp.resignDate != null}">${ad.emp.resignDate }</c:if>
                                    </td>
                                    <td>${ad.totalDoCount }</td>
                                    <td>${ad.usedDoCount }</td>
                                    <td>
                                    	<c:if test="${ad.remainDoCount <= 0}">*</c:if>
                                    	<c:if test="${ad.remainDoCount > 0}">${ad.remainDoCount }</c:if>
                                    </td>
                                </tr>
	                            </c:forEach>
	                          	</c:if>
                            </tbody>
                        </table>
                    </div>
                    <button class="btn btn-secondary btn-sm mr-2" type="button" onclick="openCalendar();">캘린더 보기</button>
                        <!-- 페이징 -->
	                       <div class="pasing-area">
					        	<c:out value="${pageBar }" escapeXml="false"/>
					        </div>   
                    </div>
                </div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->
                
                <!-- 선택 사원 연차 부여 -->
                <script>
	                function dayoffUpdate (){
	            		const inputData = $("td>input[type=checkbox]:checked").parents("tr").find("td")
	            		const data = $("#dayOffTable td");
	            		const input = $("#dayOffTable td>input[type=text]");
	            	
	            		console.log(data);
	            		
	            		//$(data[0]).text($(inputData[1]).text());
	            		//$(data[1]).text($(inputData[2]).text());
	            		//$(data[2]).text($(inputData[3]).text());
	            		//console.log($(inputData[1]).text());
	            		$(input[0]).val($(inputData[1]).text());
	            		$(input[1]).val($(inputData[2]).text());
	            		$(input[2]).val($(inputData[3]).text());
	            		$("#insertDayOffModal").modal("show");
	            	}
	            	function insertDayoff(){
	            		$('#frm').submit();
	            	}
                </script>
                
                
                <!-- 연차 조정 modal창 -->
				<div id="insertDayOff">
                    <div class="modal fade text-center" id="insertDayOffModal" tabindex="-1" role="dialog"
                        aria-activedescendant="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-dark text-white">
                                    <h5 class="modal-title" id="exampleModalLabel">연차 조정</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="frm" name="frm" class="dayOff"  action="${path }/admin/insertDayoff" method="post">
                                        <!--  class="table-bordered" -->
                                        <table id="dayOffTable" class="table table-borderless text-dark">
                                            <colgroup>
                                                <col style="width:20%">
                                                <col style="width:80%">
                                            </colgroup>
                                            <tr>
                                                <th class="align-middle">이름</th>
                                                <td class="font-weight-bold">
                                                	<input type="text" class="form-control inputSize" name="emp_name" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">부서</th>
                                                <td class="font-weight-bold">
                                                	<input type="text" class="form-control inputSize" name="dept_type" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">입사일</th>
                                                <td class="font-weight-bold">
                                                	<input type="text" class="form-control inputSize" name="enroll_date" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">선택</th>
                                                <td>
                                                    <label><input type="radio" name="select" checked>발생 연차</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">연차수</th>
                                                <td>
                                                    <input type="text" class="form-control form-control-sm" name="count_form">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">내용</th>
                                                <td>
                                                    <textarea class="form-control" id="dayOffTextarea" rows="3" style="resize: none;"></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-primary" onclick="insertDayoff()">확인</a>
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>        
                    </div>
                </div>
            </div>
            <!-- Footer -->
            

            <div id="footer">
                <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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

    <!-- 부트스트랩 스크립트 -->
	<div id="bootstrap">
		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
	</div>

</body>

</html>


