<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />

<body id="page-top">

   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- 사이드바 시작 Sidebar -->
      <div id="sidebar">
         <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
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
                    <h1 class="h3 text-dark mt-5 mb-5">자유게시판</h1>

                    <div class="notice-container">

                        <!-- 검색창 & 작성하기 영역 -->
                        <div class="search-write-area row mb-3">
                            <!-- 검색창 -->
                            <div class="search-area float-start col-8">
                                <form action="" method="get" id="searchForm">
                                    <div class="search-area d-flex">
                                        <select name="keyfield" aria-label="Default select example" class="mr-1">
                                            <option <c:if test="${keyfield == 'title' }">selected</c:if> value="title">제목</option>
                                            <option <c:if test="${keyfield == 'content' }">selected</c:if> value="content">내용</option>
                                            <option <c:if test="${keyfield == 'writer' }">selected</c:if> value="writer">작성자</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1" value="${keyword}">
                                        <button type="submit" class="btn btn-primary btn-sm">검색</button>
                                    </div>
                                </form>
                            </div>
                            
                            <script>
                            	function dropdownSearch(searchId,value){
                            		$('#'+searchId).val(value);
                            		$('#searchForm').submit();
                            	}
                            </script>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            <!-- 작성하기 버튼 -->
                            <div class="wirte-area col-4">
                                <a href="${pageContext.request.contextPath }/communityWrite" class="btn btn-primary btn-sm float-right">글쓰기</a>
                            </div>
                        </div>

                        <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="10%" />
                                    <col width="40%" />
                                    <col width="15%" />
                                    <col width="15%" />
                                   <%--  <col width="10%" /> --%>
                                    <col width="20%" />
                                </colgroup>

                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>첨부파일</th>
                                        <th>작성일</th>
                                    <!--     <th>조회수</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${not empty board }">
                                	<c:forEach var="b" items="${board }">
                                    <tr>
                                        <td>${b.no }</td>
                                        <td><a href="${pageContext.request.contextPath }/board/communityView.do?no=${b.no}">${b.title }</a></td>
                                        <td>${b.writer }</td>
                                        <td>
                                        	<c:if test="${not empty b.file and b.file[0].boardNo!=0}">
                                        		<img src="${pageContext.request.contextPath }/resources/img/file_icon.png" width="30" height="30" alt="첨부파일사진">
                                        	</c:if>
                                        </td>
                                        <td>${b.emp.dateCreated }</td>
                                        <%-- <td>${b.views }</td> --%>
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
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
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