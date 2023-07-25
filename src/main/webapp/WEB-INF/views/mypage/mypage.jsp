<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>JOIN</title>

<!-- Custom fonts for this template-->
<link href="${page }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${page }/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${page }/resources/css/sb-admin-2.css" rel="stylesheet">
<script src="${page }/resources/js/jquery-3.7.0.min.js"></script>

<!--부트스트랩 아이콘-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>

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

							<form class="user">
								<table class="table-sm">
									<tr>
										<td>사번</td>
										<td><input class="form-control ml-5" type="text"
											placeholder="J002" readonly></td>
									</tr>
									<tr>
										<td>이름(한글)</td>
										<td><input class="form-control ml-5" type="text"
											placeholder="윤나라" readonly></td>
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
			<div id="footer">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			</div>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- 로그아웃 확인창 Logout Modal-->
	<div id="logoutCheck">
		<jsp:include page="/WEB-INF/views/login/logoutModal.jsp" />
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="${page }/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${page }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${page }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${page }/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${page }/resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${page }/resources/js/demo/chart-area-demo.js"></script>
	<script src="${page }/resources/js/demo/chart-pie-demo.js"></script>
</body>

</html>