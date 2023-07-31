<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
              <div class="container-fluid">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 mb-5">전사원 근태 현황</h1>
                    <div class="adminWorkingTimeList-container ">  
                    <!-- 근무상태 검색 & 시작및종료일 검색 버튼 영역 -->
                    <div class="row justify-content-between" id="big-search">
                        <!-- 근무상태 검색 버튼 -->
                        <div class="btn-group-toggle float-left mb-3 col-4" data-toggle="buttons">근무 상태
                            <label class="btn btn-outline-dark active ml-2">
                              <input type="radio" name="options" id="option1" checked>전체
                            </label>
                            <label class="btn btn-outline-dark">
                              <input type="radio" name="options" id="option2">정상
                            </label>
                            <label class="btn btn-outline-dark">
                              <input type="radio" name="options" id="option3">지각
                            </label>
                            <label class="btn btn-outline-dark">
                                <input type="radio" name="options" id="option3">결근
                              </label>
                        </div>
                        <!-- 근태 시작~종료일 검색 버튼 -->
                        <div class="dateSearch-search float-right mb-3 mr-3">
                            <input type="text" id="startDate" placeholder="시작일">
                            <input type="text" id="endDate" placeholder="종료일">
                            <button class="btn btn-dark btn-sm">검색</button>
                        </div>
                    </div>
                    <!-- 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center" >
                            <colgroup>
                                <col style="width:80px">
                                <col style="width:80px">
                                <col style="width:90px">
                                <col style="width:90px">
                                <col style="width:100px">
                                <col style="width:110px">
                                <col style="width:110px">
                                <col style="width:110px">
                                <col style="width:130px">
                                <col style="width:80px">
                            </colgroup>
                            <!-- table-active -->
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th>번호</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>이름</th>
                                    <th>근무일자</th>
                                    <th>출근시간</th>
                                    <th>퇴근 시간</th>
                                    <th>총 근무시간</th>
                                    <th>근무 상태</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                            <c:if test="${not empty att }">
                            	<c:forEach var="a" items="${att }">
                                <tr>
                                    <td>${a.empNo }</td>
                                    <td>${a.emp.empNum }</td>
                                    <td>${a.emp.deptTitle}</td>
                                    <td>${a.emp.jobTitle }</td>
                                    <td>${a.emp.name }</td>
                                    <td>${a.attDate }</td>
                                    <td>${a.startTime}</td>
                                    <td>${a.endTime}</td>
                                    <td>9시간 50분 00초</td>
                                    <td>
                                    	<c:if test="${a.status == '0'}">-</c:if>
                                    	<c:if test="${a.status == '1'}">출근</c:if>
                                    	<c:if test="${a.status == '2'}">지각</c:if>
                                    	<c:if test="${a.status == '3'}">조퇴</c:if>
                                    	<c:if test="${a.status == '4'}">결근</c:if>
                                    </td>
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
                        <!--     <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center mt-4">
                                    <li class="page-item">
                                        <a class="page-link text-muted" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">5</a></li>
                                    <li class="page-item">
                                    <li class="page-item">
                                    <li class="page-item">
                                        <a class="page-link text-muted" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav> -->
                       
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