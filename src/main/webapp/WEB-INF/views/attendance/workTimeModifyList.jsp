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
				<!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">
                <!-- 타이틀 Page Heading -->
                <h1 class="h3 text-dark mt-5 mb-5">근태 현황
                	<p class="mt-2 text-secondary" style="font-size:17px">출퇴근 변경 목록 조회</p>
                </h1>
                    <div class="adminWorkingTimeList-container "> 
                    <!-- 근무상태 검색 & 시작및종료일 검색 버튼 영역 -->
                    <div class="row" id="big-search">
                        <!-- 근무상태 검색 버튼 -->
                        <div class="btn-group-toggle mb-3 col-4" data-toggle="buttons">근무 상태
                            <label class="btn btn-outline-primary active ml-2">
                              <input type="radio" name="options" id="option1" value="-1" checked>전체
                            </label>
                            <label class="btn btn-outline-primary">
                              <input type="radio" name="options" id="option2" value="0" >결재대기
                            </label>
                            <label class="btn btn-outline-primary">
                              <input type="radio" name="options" id="option3" value="3">승인
                            </label>
                            <label class="btn btn-outline-primary">
                                <input type="radio" name="options" id="option4" value="4">반려
                              </label>
                        </div>
					
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
                                    <th>No.</th>
                                    <th>이름</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>요청일</th>
                                    <th>조정일</th>
                                    <th>내용</th>
                                    <th>진행상황</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white" id="wk-tbody">
                            <c:if test="${not empty worktime }">
                            	<c:forEach var="w" items="${worktime }">
                             	<tr>
                                    <td>${w.wtNo }</td>
                                    <td>${w.emp.name }</td>
                                    <td>${w.emp.empNum }</td>
                                    <td>${w.emp.deptTitle }</td>
                                    <td>${w.emp.jobTitle }</td>
                                    <td>${w.wtDate }</td>
                                    <td>${w.att.attDate }</td>
                                    <td>${w.reContent }</td>
                                    <td>${w.appStatus }</td>
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