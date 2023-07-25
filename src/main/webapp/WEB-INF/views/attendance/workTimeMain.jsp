<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
			<link href="${page }/resources/css/yelin.css" rel="stylesheet">
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
				<div class="container-fluid">
					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark my-5 ml-5"></h1>
					
					<div class="workingTimeMain-container"> 
						<div class="full-div row">
							<div class="left-div mt-2">
								<!-- 현재시간과 출퇴근 버튼창 -->
								<div class="button-div border border-secondary ml-3 "
									id="wtm-button">
									<p id="wk-title">근태 관리</p>
									<p id="wk-date">2023년 07월 24일(일)</p>
									<p id="wk-todate">18:25:30</p>
									<div class="startendTable">
										<table id="startTime">
											<tr>
												<td>출근 시간</td>
												<td>08:57:00</td>
											</tr>
											<tr>
												<td>퇴근 시간</td>
												<td>18:13:00</td>
											</tr>
										</table>
									</div>
									<div class="startendBtn mt-4">
										<button class="btn btn-primary btn-sm mr-2">출근</button>
										<button class="btn btn-primary btn-sm">퇴근</button>
									</div>
								</div>
								<!-- 사이드바 페이지 -->
								<div class="sidebar-div border border-secondary ml-3"
									id="sidebar-div">
									<p id="fP">근태 현황</p>
									<p id="sP">내 근태 현황</p>
									<p id="tP">주차별 근태 조회</p>
									<p id="fiP">일자별 근태 조회</p>
									<p id="siP">내 연차 현황</p>
								</div>
							</div>
							<div class="right-div mt-2" id="rightDiv">
								<!-- 오늘 날짜 -->
								<h3 class="row justify-content-center text-dark font-weight-bold mb-4">2023-07-21</h3>
								<!-- 누적 시간 테이블 -->
								<div class="row justify-content-center mb-4" id="timeTable">
									<table id="timeMain">
										<tr>
											<td class="border-dark border-right">이번주 누적</td>
											<td class="border-dark border-right">이번주 초과</td>
											<td class="border-dark border-right">이번주 잔여</td>
											<td class="border-dark ">이번달 누적</td>
										</tr>
										<tr>
											<td class="border-dark border-right" id="df-num">30시 40분
												00초</td>
											<td class="border-dark border-right" id="df-num">1시 30분
												00초</td>
											<td class="border-dark border-right" id="df-num">7시 40분
												00초</td>
											<td class="border-dark" id="df-num">85시 38분 10초</td>
										</tr>
									</table>
								</div>
								<!-- 캘린더 -->
								<div class="border border-secondary" id="wt-calander"></div>
							</div>
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