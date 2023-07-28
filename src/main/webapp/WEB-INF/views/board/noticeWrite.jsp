<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
					<h1 class="h3 text-dark mt-5 mb-5">공지사항 작성</h1>

					<div class="notice-container">


						<!-- 등록 버튼 -->
						<div class="board-btn">
							<button class="btn btn-primary btn-sm float-right">등록</button>
						</div>


						<div class="board-container">
							<table class="table table-sm shadow table-hover text-center">

								<!-- 테이블 칸 크기 -->
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>

								<tbody>
									<tr>
										<th class="text-center align-middle">작성자</th>
										<td>윤나라</td>
									</tr>
									<tr>
										<th class="text-center align-middle">제목</th>
										<td>공지사항 제목입니다.</td>
									</tr>
									<tr>
										<th class="text-center align-middle">내용</th>
										<td>
											<div class="td-con">
												<div class="editor-wrap">
													<div id="smarteditor" class="editor-area">
														<!--에디터가 들어가는 영역입니다.-->
													</div>
												</div>
											</div>
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