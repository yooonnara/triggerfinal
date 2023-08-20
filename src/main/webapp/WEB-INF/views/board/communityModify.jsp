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
					<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>		
				</div>
				<!-- 상단바 종료 End of Topbar -->


				<!-- 수정할 컨테이너 Begin Page Content -->
                <div class="container-fluid pl-5 pr-5" >

                    <!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark mt-5 mb-5">자유게시판 수정</h1>

					<div class="notice-container">


						


						<div class="board-container"  style="width:1200px;margin:auto">
							<table class="table table-sm shadow table-hover text-center">

								<!-- 테이블 칸 크기 -->
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<form id="cmmForm" name="cmmForm" action="${pageContext.request.contextPath }/board/communityModifySubmit" method="post">
								<tbody>
									<tr>
										<input name="no" value="${board.no }" hidden>
										<td class="text-center align-middle">작성자</td>
										<td><input name="writer" value="${board.writer }" readonly class="bg-light" style="border:none;width:500px"></td>
									</tr>
									<tr>
										<td class="text-center align-middle">제목</td>
										<td><input id="title" name="title" type="text" value="${board.title }" class="bg-light" style="width:500px"></td>
									</tr>
									<tr>
										<td class="text-center align-middle"><span>첨부파일</span></td>
										<td>
											<div class="td-con">
												<div class="fileBox addfile">
													<span class="inputOuter bTp"> 
														<div class="file-area" id="file-area">
															<input type="file" name="uploadFiles1" id="uploadFiles1" class="uploadBtn" style="width:500px" accept="image/*"  >
														</div>
													</span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center align-middle" id="cwTd" colspan="2">
											<div id="smarteditor" class="editor-area">
												<!--에디터가 들어가는 영역입니다.-->
												<textarea name="contents" id="contents" rows="20" cols="10" style="width:1300px">${board.content }</textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<button type="submit" id="submit_cmm" class="btn btn-primary ml-2 mt-3 mr-3 float-right btn-sm mb-3">수정하기</button>
							<a href="javascript:history.back()" class="btn btn-secondary mt-3 float-right btn-sm mb-3">취소</a>
						</div>
						</form>
					</div>
				</div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->
			</div>

			<!-- smartEditor -->
			<script>
				let oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "contents",
				sSkinURI: "${pageContext.request.contextPath }/resources/smarteditor2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
				})
					
				$("#cmmForm").on('submit',function(e){
					oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
				      
				    if ($("#title").val().length < 1) {
				    	alert('제목을 입력해 주세요.');
				        $('#title').focus();
				        return false;
				    } 
				    var contents = $("#contents").val();
				    if( contents.length < 1 || contents == null || contents == '&nbsp;')  {
					    alert('내용을 입력해 주세요.');
					    oEditors.getById["contents"].exec("FOCUS"); 
					    return false;
				    }
			   });
			</script>


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

