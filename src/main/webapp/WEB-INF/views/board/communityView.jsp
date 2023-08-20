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
						<a href="${pageContext.request.contextPath }/board/communityModify.do?no=${board.no}"  class="btn btn-primary ml-2 mt-3 mr-3 float-right btn-sm mb-3">수정하기</a>
						<a href="${pageContext.request.contextPath }/board/communityDelete.do?no=${board.no}" class="btn btn-secondary mt-3 btn-sm mb-3">삭제하기</a>
						</div>
					</c:if>	
						<a href="${pageContext.request.contextPath }/community" class="btn btn-secondary float-right mt-3 btn-sm mb-3">목록</a>


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
										<c:if test="${not empty board.file and board.file[0].boardNo!=0}">
										<c:forEach var="f" items="${board.file }">
											<%-- <img src="${path }/upload/board/${board.file[0].saveFileName}"  --%>
											<button type="button" class="btn" 
											onclick="fileDownload('${f.fileName}','${f.saveFileName}');">
											${f.fileName }</button>
										</c:forEach>
										</c:if>	
										</td>
									</tr>
									<tr>
										<td class="text-center" id="cwTd" colspan="2">
											<textarea name="contents" id="contents" class="bg-light mt-3" style="width:800px; border:none; resize:none;" readonly>${board.content }</textarea>
											<c:if test="${not empty board.file and board.file[0].boardNo!=0}">
											<img src="${pageContext.request.contextPath }/resources/upload/board/${board.file[0].saveFileName}"/>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<script>
							function fileDownload(oriName, reName){
								location.assign("${pageContext.request.contextPath }/board/fileDownload?oriname="+oriName+"&rename="+reName);
							};
						</script>
						
						
						
						
						
						<!-- 댓글 부분 -->
						<div class="board-container">
							<table id="commTable" class="table table-sm shadow table-hover text-center">
								<colgroup>
									<col width="30%" />
									<col width="20%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<th class="text-left">댓글 작성</th>
								<form name="comment-form" action="${pageContext.request.contextPath }/board/commentWrite" method="post">	
									<tbody>
									<c:if test="${not empty comment }">
									<c:forEach var="c" items="${comment }">
										<tr>
											<td class="float-left" style="width:980px">${c.content }</td>
											<td>${c.writer }</td>
											<td><button class="btn btn-primary ml-2 mr-1 btn-sm">수정</button></td>
											<td><button class="btn btn-secondary btn-sm">삭제</button></td>
										</tr>
									</c:forEach>
									</c:if>	
										<tr>
											<td>
												<input name="name" value="${emp.name}" type="hidden">
												<input name="boardNo" value="${board.no}" type="hidden">
												<input name="empNo" value="${board.empNo}" type="hidden">
												<input name="comment" id="comment" class="bg-light mt-2 ml-5 bg-white" style="width:900px;height:60px; border:none; ">
											</td>
											<td colspan="3">
											<button type="submit" class="btn btn-secondary float-left mt-3 ml-5 btn-sm mb-3">댓글 작성</button>
											</td>
										</tr>
									</tbody>	
								 </form> 
							</table>
						</div>
					</div>
				</div>
				
                <!-- 수정할 컨테이너 종료 End of Main Content -->
			</div>

			<script>
				$("#comment-form").on('submit',function(e){
				   		var name = $("#name").val();
				    var boardNo = $("#boardNo").val();
				    var empNo = $("#empNo").val();
				    var comment = $("#comment").val();
				    
				    /* $.ajax({
				    	url:"/board/commentWrite",
				    	data: {"name":name, "boardNo":boardNo,"empNo":empNo,"comment":comment
				    	}
				    	success:function(c){
				    		console.log(c);
				    		
				    	}
				    }) */
			   });
			</script>	
			
		<!-- 	<script>
				
				function submitComm(){
					$.ajax({
						url:"/board/commentWrite",
						data:{
							name : $('input[name=name]').val(),
							boardNo : $('input[name=boardNo]').val(),
							empNo : $('input[name=empNo]').val(),
							comment : $('input[name=comment]').val()
						},
						success:function(c){
							console.log(c[0]["content"]);
							
							for(let i=0;i<c.length;i++){
								const $tr = $("<tr>");
								const $td = $("<td class='float-left ml-5'>");
								const $comment = $("<td>").text(c[i]["content"]);
								
								$td.append($comment);
								
								$("#commTable").append($td);
							}
						},
						error:function(){
    						console.log("ajax 통신 실패");
    					}
         
					})
				} 
				
			
					
			</script> -->












				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		</div>
	</div>
	<!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>
<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
</body>
</html>