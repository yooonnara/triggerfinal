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
                    <h1 class="h3 text-dark mt-5 ml-2">근태현황
                    	<p class="mt-2 text-secondary" style="font-size:17px">주차별 조회</p>
                    </h1>

                    <div class="workingTimeWeekly-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                        <!-- 오늘 날짜 -->
                        <h3 class="row justify-content-center text-dark font-weight-bold mb-4">2023-07-21</h3>
                        <!-- 주차별 아코디언 -->
                        <div id="accordion">
                            <div class="card">
                              <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                <div class="bbtn">
                                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    1주차
                                    </button>
                                </div> 
                                <div id="timetxt">누적 근무 시간
                                    <strong>8h 30m 00s</strong>
                                </div>
                                </h5>
                              </div>
                          
                              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <table class="table table-sm" id="accordionTable">
                                        <thead>
                                            <tr>
                                                <th>일자</th>
                                                <th>업무시작</th>
                                                <th>업무종료</th>
                                                <th>총 근무시간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>03 월</td>
                                                <td>08:30:00</td>
                                                <td>19:00:00</td>
                                                <td>11:30:00</td>
                                            </tr>
                                            <tr>
                                                <td>04 화</td>
                                                <td>08:30:00</td>
                                                <td>19:00:00</td>
                                                <td>11:30:00</td>
                                            </tr>
                                            <tr>
                                                <td>05 수</td>
                                                <td>08:30:00</td>
                                                <td>19:00:00</td>
                                                <td>11:30:00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                              </div>
                            </div>
                            <div class="card">
                              <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                    <div class="bbtn">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            2주차
                                        </button>
                                    </div>
                                    <div id="timetxt">누적 근무 시간
                                        <strong>8h 30m 00s</strong>
                                    </div>
                                </h5>
                              </div>
                              <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                <div class="card-body">
                                    <table class="table table-sm" id="accordionTable">
                                        <thead>
                                            <tr>
                                                <th>일자</th>
                                                <th>업무시작</th>
                                                <th>업무종료</th>
                                                <th>총 근무시간</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>03 월</td>
                                                <td>08:30:00</td>
                                                <td>19:00:00</td>
                                                <td>11:30:00</td>
                                            </tr>
                                            <tr>
                                                <td>03 월</td>
                                                <td>08:30:00</td>
                                                <td>19:00:00</td>
                                                <td>11:30:00</td>
                                            </tr>
                                            <tr>
                                                <td>03 월</td>
                                                <td>08:30:00</td>
                                                <td>19:00:00</td>
                                                <td>11:30:00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                              </div>
                            </div>
                            <div class="card">
                              <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <div class="bbtn">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            3주차
                                        </button>
                                    </div>
                                    <div id="timetxt">누적 근무 시간
                                        <strong>8h 30m 00s</strong>
                                    </div>
                                </h5>
                              </div>
                              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                <div class="card-body">
                                  
                                </div>
                              </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingFour">
                                  <h5 class="mb-0">
                                    <div class="bbtn">
                                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        4주차
                                        </button>
                                    </div>
                                    <div id="timetxt">누적 근무 시간
                                        <strong>8h 30m 00s</strong>
                                    </div>
                                  </h5>
                                </div>
                                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                                  <div class="card-body">
                                  </div>
                                </div>
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
</body>

</html>