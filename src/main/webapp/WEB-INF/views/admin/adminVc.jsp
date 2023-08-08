<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${path }/resources/css/nara.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 시작 Sidebar -->
        <div id="sidebar">
           <jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>
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
                    <h1 class="h3 text-dark mt-5 mb-5">전자결재관리</h1>
                    
                     <div class="edsmVc-container">

                       <!-- 검색창 & 작성하기 영역 -->
                    <div class="search-write-area row mb-3">
                        <!-- 검색창 -->
                        <div class="search-area float-start col-8">
                            <form name="vc-form">
                                <div class="search-area d-flex" >
                                    <select name="category" aria-label="Default select example" class="mr-1">
                                        <option selected value="all">전체</option>
                                        <option value="name">이름</option>
                                        <option value="title">부서</option>
                                        <option value="job">직급</option>
                                    </select>
                                    <input type="text" name="keyword" value="" placeholder="검색어를 입력해 주세요" class="mr-1"></input>
                                  <input type="button" onclick="searchVc()" class="btn btn-dark btn-sm "  value="검색"></input>                              </div>
                            </form>
                        </div>
                        
                     <!--    <script> 
                        function searchVc(){
                        	$.ajax({
                        		url : "${pageContext.request.contextPath}/edms/adminVc/searchVc",
                        		data : $("form[name=vc-form]").serialize(),
                        		success:function(n){
                        			
                        			console.log(n);
                        			for
                        		}	
                        	
                        	
                        	}
                        	})
                        }
                        
                        </script> -->
                        
                      
                                <div class="btn-member col-4" id="vcAll">
                                    <button type="button" class="btn btn-dark btn-sm  ml-1 float-right">반려</button>
                                     <button type="button" class="btn btn-outline-dark btn-sm ml-1 float-right">승인</button>
                                      <button type="button" class="btn btn-outline-dark btn-sm ml-1 float-right">대기</button>
                                      <button type="button" class="btn btn-outline-dark btn-sm ml-1 float-right">전체</button>
                                      
                                </div>
                            </div>
                       
                            <!-- 검색하기 버튼 -->
                            
                            
                            
                          <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                   <col width="10%" />
                                    <col width="15%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="15%" />
                                    <col width="10%" />
                                    <col width="25%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-dark text-white">
                       				 <th>문서번호</th>
                                    <th>기안일</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>이름</th>
                                    <th>제목</th>
                                    <th>구분</th>
                                    <th>결재상태</th>
                                    </tr>
                                </thead>
                                <tbody id="edms-vc">
                                <c:if test="${not empty edms}">
                                <c:forEach var="e" items="${edms}">
                                  <tr>
                                	<td>${e.no }</td>
                                    <td>${e.createDate }</td> 
                                    <td>${e.emp.deptTitle }</td>
                                    <td>${e.emp.jobTitle }</td>
                                    <td>${e.emp.name }</td>
                                    <td>${e.title }</td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${e.type==0 }">연차</c:when>
                                    	<c:when test="${e.type==1 }">출장</c:when>
                                    	<c:otherwise>미정</c:otherwise>
                                    </c:choose>
                                    </td>
                                  <td >
                                  <a href="/edms/adminVcView?no=${e.no}" > 
                                  	<c:if test="${e.appStatus==0 }">결재대기</c:if>
                                  	<c:if test="${e.appStatus==1 }">승인</c:if>
                                  	<c:if test="${e.appStatus==2 }">반려</c:if>
                                  </a>
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
<!-- datepicker -->
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>

</html>