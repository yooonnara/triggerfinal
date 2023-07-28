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
				<div class="container-fluid pl-5 pr-5">

                <!-- 타이틀 Page Heading -->
                <h1 class="h3 text-dark mt-5 mb-5">근태 현황
                	<p class="mt-2 text-secondary" style="font-size:17px">일자별 조회</p>
                </h1>

                    <div class="adminWorkingTimeList-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                    <!-- 근무상태 검색 & 시작및종료일 검색 버튼 영역 -->
                    <div class="row" id="big-search">
                        <!-- 근무상태 검색 버튼 -->
                        <div class="btn-group-toggle mb-3 col-4" data-toggle="buttons">근무 상태
                            <label class="btn btn-outline-primary active ml-2">
                              <input type="radio" name="options" id="option1" checked>전체
                            </label>
                            <label class="btn btn-outline-primary">
                              <input type="radio" name="options" id="option2">정상
                            </label>
                            <label class="btn btn-outline-primary">
                              <input type="radio" name="options" id="option3">지각
                            </label>
                            <label class="btn btn-outline-primary">
                                <input type="radio" name="options" id="option3">결근
                              </label>
                        </div>

                        <!-- 근태 시작~종료일 검색 버튼 -->
                        <div class="float-right dateSearch-search mb-3 col-8">
                            <button class="float-right btn btn-primary btn-sm">검색</button>
                            <input type="text" id="endDate" placeholder="종료일" class="float-right mr-1">
                            <input type="text"  id="startDate" placeholder="시작일" class="float-right mr-1">
                        </div>
                        

                    </div>
                    <!-- 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center" >
                            <colgroup>
                                <col style="width:130px">
                                <col style="width:100px">
                                <col style="width:130px">
                                <col style="width:130px">
                                <col style="width:130px">
                            </colgroup>
                            <!-- table-active -->
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th>날짜</th>
                                    <th>근무 상태</th>
                                    <th>출근시간</th>
                                    <th>퇴근 시간</th>
                                    <th>총 근무시간</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white">
                                <tr>
                                    <td>2023.05.15</td>
                                    <td>정상</td>
                                    <td>08:55:00</td>
                                    <td>18:40:00</td>
                                    <td>9시간 50분 00초</td>
                                </tr>
                                <tr>
                                    <td>2023.05.15</td>
                                    <td>정상</td>
                                    <td>08:55:00</td>
                                    <td>18:40:00</td>
                                    <td>9시간 50분 00초</td>
                                </tr>
                                <tr>
                                    <td>2023.05.15</td>
                                    <td>정상</td>
                                    <td>08:55:00</td>
                                    <td>18:40:00</td>
                                    <td>9시간 50분 00초</td>
                                </tr>
                                <tr>
                                    <td>2023.05.15</td>
                                    <td>정상</td>
                                    <td>08:55:00</td>
                                    <td>18:40:00</td>
                                    <td>9시간 50분 00초</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                        <!-- 페이징 -->
                        <div class="pasing-area">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center mt-4">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                    <li class="page-item">
                                    <li class="page-item">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
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