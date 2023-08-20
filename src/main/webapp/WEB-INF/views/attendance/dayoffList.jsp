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
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			<link href="${pageContext.request.contextPath }/resources/css/yelin.css" rel="stylesheet">
		</div>

		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- 상단바 시작 Topbar -->
				<div id="topbar">
					<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
				</div>

				<!-- 수정할 컨테이너 Begin Page Content -->
				 <div class="container-fluid">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 ml-4">연차 현황</h1>

                    <div class="dayOffCounting-container"> 
                        <!-- 오늘 날짜 -->
                        <h3 class="dfDate row justify-content-center text-dark font-weight-bold mb-5" id="DF_date"></h3>
                        
                        <script>
					        $(function(){
					            var today = new Date();
					            var year = today.getFullYear();
					            var month = ('0' + (today.getMonth() + 1)).slice(-2);
					            var day = ('0' + today.getDate()).slice(-2);
					            var week = new Array('일', '월', '화', '수', '목', '금', '토');
					
					            var mainDate = year + "-" + month + "-" + day
					            $("#DF_date").text(mainDate);
					        })
					    </script>
                        
                        <!-- 사용 내역 테이블 -->
                        <div class="row justify-content-center" id="mineCountingTable">
                            <table class="border col-5 text-center bg-white">
                                    <tr>
                                        <td rowspan="2" class="font-weight-bold border-right bg-primary text-white">
                                        	${dayoff.get(0).emp.name} ${dayoff.get(0).emp.jobTitle}
                                        </td>
                                        <td class="border-right ">발생 연차</td> 
                                        <td class="border-right">사용 연차</td>
                                        <td class="border-right">잔여 연차</td>
                                    </tr>
                                    <tr>
                                        <td class="border-right" id="df-num">${dayoff.get(0).totalDoCount }</td>
                                        <td class="border-right" id="df-num">${dayoff.get(0).usedDoCount }</td>
                                        <td class="border-right" id="df-num">
                                        	<c:if test="${dayoff.get(0).remainDoCount < 0}">*</c:if>
                                        	<c:if test="${dayoff.get(0).remainDoCount > 0}">${dayoff.get(0).remainDoCount}</c:if>
                                        </td>
                                    </tr>
                            </table>
                        </div>
                        <div class="DayOff_search float-right mt-2 mb-3" id="big-search">
                            <select>
                                <option>년도</option>
                                <option value="2021">2021 년</option>
                                <option value="2022">2022 년</option>
                                <option value="2023">2023 년</option>
                            </select>
                            <button class="btn btn-primary btn-sm">검색</button>
                        </div>
                      
                        <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center">
                            <colgroup>
                                <col style="width:85px">
                                <col style="width:85px">
                                <col style="width:85px">
                                <col style="width:120px">
                                 <col style="width:85px">
                                <col style="width:100px">
                            </colgroup>
                            <thead class="bg-primary  text-white">
                                <tr>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>종류</th>
                                    <th>연차 기간</th>
                                    <th>사용 연차</th>
                                    <th>결재 현황</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white">
                            <c:if test="${not empty dayoff }">
                            <c:forEach var="d" items="${dayoff }">
                                <tr>
                                    <td>${d.emp.name }</td>
                                    <td>${d.emp.deptTitle}</td>
                                    <td>${d.edms.detailType}</td>
                                    <td>${d.edms.startDate } ~ ${d.edms.endDate }</td>
                                    <td>${d.usingDate }</td>
                                    <td>
                                    	<c:if test="${d.edms.appStatus == '0'}">결재 대기</c:if>
                                    	<c:if test="${d.edms.appStatus == '1'}">승인</c:if>
                                    	<c:if test="${d.edms.appStatus == '2'}">반려</c:if>
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
                    </div>
                </div>
				<!-- 수정할 컨테이너 종료 End of Main Content -->
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

	<!-- 부트스트랩 스크립트 -->
	<div id="bootstrap">
		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
	</div>

</body>

</html>