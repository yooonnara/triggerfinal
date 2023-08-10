<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

	

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
					<!-- smartEditor -->
					<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>		
				</div>
				<!-- 상단바 종료 End of Topbar -->


				<!-- 수정할 컨테이너 Begin Page Content -->
                <div class="container-fluid pl-5 pr-5" >

                    <!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark mt-5">자유게시판 상세페이지</h1>

					<div class="notice-container" style="width:1200px;margin:auto">
					
					<!-- 삭제/수정 버튼 -->
					<c:if test="${loginNo == board.empNo}">
						<div class="float-left">
						<a href="${path }/board/communityModify.do?no=${board.no}"  class="btn btn-primary ml-2 mt-3 mr-3 float-right btn-sm mb-3">수정하기</a>
						<a href="javascript:history.back()" class="btn btn-secondary mt-3 btn-sm mb-3">삭제하기</a>
						</div>
					</c:if>	
						<a href="${path }/community" class="btn btn-secondary float-right mt-3 btn-sm mb-3">목록</a>


						<div class="board-container">
							<table class="table table-sm shadow table-hover text-center" >
								<!-- 테이블 칸 크기 -->
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<td class="text-center align-middle">작성자</td>
										<td>${board.writer }</td>
									</tr>
									<tr>
										<td class="text-center align-middle">제목</td>
										<td>${board.title }</td>
									</tr>
									<tr>
										<td class="text-center align-middle"><span>첨부파일</span></td>
										<td>
											<c:forEach var="f" items="${board.file }">
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td class="text-center" id="cwTd" colspan="2">
											<textarea name="contents" id="contents" class="bg-light mt-3"  style="width:800px; border:none; resize:none;">${board.content }</textarea>
										</td>
										
									</tr>
								</tbody>
							</table>
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
	
<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />

</body>

</html>

