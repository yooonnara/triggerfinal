<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<h1 class="h3 text-dark mt-5 mb-5">내 정보 수정</h1>

					<div class="mypage-area row mb-3">
						<div class="mypage-container col-12 d-flex justify-content-center">

							<form class="user" name="employeeUpdate" action="${path }/insertEmployee" method="post">
								<table class="table-sm">
									<tr class="text-center">
                                        <td colspan='2'>
                                        	<div class="box">
												<img src="${path }/resources/img/user_profile.png" 
													class="profile rounded enter-block mb-3" 
													style="width: 80px; height: 80px">	     
											</div>                                       
                                        </td>
                                    </tr>
									<tr>
										<td>사번</td>
										<td><input class="form-control ml-5" type="text" readonly>${empInfo.empNum}</td>
									</tr>
									<tr>
										<td>이름(한글)</td>
										<td><input class="form-control ml-5" type="text"
											value="${empInfo.name}" readonly></td>
									</tr>
									<tr>
										<td>아이디</td>
										<td><input class="form-control ml-5" type="text"
											placeholder="yooonnara" readonly></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type="password" class="form-control ml-5"
											name="userId" id=""></td>
									</tr>
									<tr>
										<td>비밀번호 확인</td>
										<td><input type="password" class="form-control ml-5"
											name="userId" id=""></td>
									</tr>
									<tr>
										<td>입사일</td>
										<td><input class="form-control ml-5" type="date"
											placeholder="" readonly></td>
									</tr>
									<tr>
										<td>부서</td>
										<td><input class="form-control ml-5" type="text"
											placeholder="개발팀" readonly></td>
									</tr>
									<tr>
										<td>직급</td>
										<td><input class="form-control ml-5" type="text"
											placeholder="대리" readonly></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input type="text" class="form-control ml-5"
											name="userId" id=""></td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td><input type="text" class="form-control ml-5"
											name="userId" id="" placeholder="- 없이 입력"></td>
									</tr>

								</table>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary" href="#">저장</a>
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
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