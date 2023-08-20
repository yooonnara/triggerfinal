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
           <link href="${pageContext.request.contextPath }/resources/css/yelin.css" rel="stylesheet">
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
                    <h1 class="h3 text-dark mt-5 mb-5">전사원 근태 현황</h1>
                    <div class="adminWorkingTimeList-container" style="width:1100px">  
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
                        <div class="dateSearch-search float-right mb-3 mr-3">
	              			<!-- <button class="float-right btn btn-dark btn-sm">검색</button>
	              			<input type="text"  placeholder="종료일" class="float-right mr-1 endDate" id="datepicker2">
	              			<input type="text"  placeholder="시작일" class="float-right mr-1 startDate" id="datepicker1"> -->
	              			 <!-- 검색창 -->
                           
                                <form action="" method="get" id="searchForm">
                                    <div class="search-area d-flex">
                                        <select name="keyfield" aria-label="Default select example" class="mr-1">
                                        	<option <c:if test="${keyfield == 'name' }">selected</c:if> value="name">이름</option>
                                            <option <c:if test="${keyfield == 'empno' }">selected</c:if> value="empno">사번</option>
                                            <option <c:if test="${keyfield == 'dept' }">selected</c:if> value="dept">부서</option>
                                            
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1" value="${keyword}">
                                        <button type="submit" class="btn btn-dark btn-sm">검색</button>
                                    </div>
                                </form>
                      
                          
                        </div>
                    </div>
                      
                            <script>
                            	function dropdownSearch(searchId,value){
                            		$('#'+searchId).val(value);
                            		$('#searchForm').submit();
                            	}
                            </script>
                    
                    
                    <!-- 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center" >
                            <colgroup>
                                <col style="width:80px">
                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:100px">
                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:100px">
                                <col style="width:80px">
                            </colgroup>
                            <!-- table-active -->
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th>근무일자</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>이름</th>
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
                                	<td>${a.attDate }</td>
                                    <td>${a.emp.empNum }</td>
                                    <td>${a.emp.deptTitle}</td>
                                    <td>${a.emp.jobTitle }</td>
                                    <td>${a.emp.name }</td>
                                    <td>${a.startTime}</td>
                                    <td>${a.endTime}</td>
                                    <td>${a.attTime }</td>
                                    <td>
                                    	<c:if test="${a.status == '0'}">정상 출근</c:if>
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
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>

</html>