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
                    <h1 class="h3 text-dark my-5 ml-2">전사 출장 현황</h1>
                    <div class="adminBusinessTrip-container" > 
                    <!-- 검색 & 조회 버튼 -->
                    <div class="row justify-content-between" id="big-search" >
                    
                    	<!-- 사원명 부서명 검색 버튼 -->
                        <div class="float-left mb-3 col-5" id="BtSearch">
                            <label class="text-dark">사원명</label>
                                <input type="text" class=" mr-1" name="searchEmp" id="searchEmp">
                            <label class="text-dark">부서명</label>
                                <input type="text" name="searchDep" id="searchDep">
                            <button class="btn btn-dark btn-sm">검색</button>
                        </div>      
                        
                        <!--조회 버튼 -->
                        <div class="float-right mb-4 mr-3 btn-member" id="abtSearch">
                            <a href="#" class="btn btn-dark btn-sm mr-2 ml-5" value="">전체</a>
                            <a href="#" class="btn btn-dark btn-sm mr-2">결제 대기</a>
                            <a href="#" class="btn btn-dark btn-sm">승인</a>
                        </div>
                        
                   	<script>
                   		$("#BtSearch button").click(e=>{
                   			$.ajax({
                   				url:"/ajaxBtSearch",
                   				data:{
                   					searchEmp:$("#BtSearch input[name=searchEmp]").val(),
                   					searchDep:$("#BtSearch input[name=searchDep]").val()
                   				},
                   				success:function(bt){
                   					console.log(bt[0]["empNo"]);
                   					$("#btTable").html("");
                   					for(let i=0;i<bt.length;i++){
                   						const $tr = $("<tr>");
                   						const $no = $("<td>").text(bt[i]["no"]);
                   						const $empNo = $("<td>").text(bt[i]["emp"]["empNum"]);
                   						const $deptTitle = $("<td>").text(bt[i]["emp"]["deptTitle"]);
                   						const $jobTitle = $("<td>").text(bt[i]["emp"]["jobTitle"]);
                   						const $name = $("<td>").text(bt[i]["emp"]["name"]);
                   						const $startDate = $("<td>").text(bt[i]["startDate"]).text("~").text(bt[i]["endDate"]);
                   						const $title = $("<td>").text(bt[i]["title"]);
                   						const $appStatus = $("<td>").text(bt[i]["appStatus"]);
                   						$tr.append($no).append($empNo).append($deptTitle).append($jobTitle).append($name)
                   						.append($startDate).append($title).append($appStatus);
                   						
                   						$("#btTable").append($tr);
                   					}
                   				},
                   				error:function(){
            						console.log("출장 리스트 통신 실패");
            					}
                   			})
                   		})
                   	</script>               
                    </div>   
                    <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center">
                            <colgroup>
                               <col style="width:50px">
                                <col style="width:50px">
                                <col style="width:50px">
                                <col style="width:50px">
                                <col style="width:80px">
                                <col style="width:130px">
                                <col style="width:80px">
                                <col style="width:80px">
                            </colgroup>
                            <thead class="bg-dark text-white" >
                                <tr>
                                    <th>문서번호</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>직위</th>
                                    <th>이름</th>
                                    <th>휴가 사용 기간</th>
                                    <th>제목</th>
                                    <th>진행상황</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white"  id="btTable">
                            <c:if test="${not empty edms }">
                            <c:forEach var="ed" items="${edms }">
                                <tr>
                                    <td>${ed.no }</td>
                                    <td>${ed.emp.empNum }</td>
                                    <td>${ed.emp.deptTitle }</td>
                                    <td>${ed.emp.jobTitle }</td>
                                    <td>${ed.emp.name }</td>
                                    <td>${ed.startDate } ~ ${ed.endDate }</td>
                                    <td>${ed.title }</td>
                                    <td>
                                    	<c:if test="${ed.appStatus == '0'}">결대대기</c:if>
                                    	<c:if test="${ed.appStatus == '1'}">승인</c:if>
                                    	<c:if test="${ed.appStatus == '2'}">반려</c:if>
                                    	<c:if test="${ed.appStatus == '3'}">취소</c:if>
                                    </td>
                                </tr>
                           	</c:forEach>
                     		</c:if>
                            </tbody>
                        </table>
                    </div>                    
                </div>
               
                </div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->

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