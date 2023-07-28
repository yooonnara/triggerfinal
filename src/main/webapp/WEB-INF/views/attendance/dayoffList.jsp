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
                    <h1 class="h3 text-dark mt-5 ml-4">연차 현황</h1>

                    <div class="dayOffCounting-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                        <!-- 오늘 날짜 -->
                        <h3 class="row justify-content-center text-dark font-weight-bold mb-5">2023-07-21</h3>
                        <!-- 사용 내역 테이블 -->
                        <div class="row justify-content-center" id="mineCountingTable">
                            <table class="border border-dark col-5 text-center bg-white">
                                    <tr>
                                        <td rowspan="2" class="font-weight-bold border-dark border-right">김땅땅대리</td>
                                        <td class="border-dark border-right ">발생 연차</td> 
                                        <td class="border-dark border-right">사용 연차</td>
                                        <td class="border-dark border-right">잔여 연차</td>
                                    </tr>
                                    <tr>
                                        <td class="border-dark border-right" id="df-num">3</td>
                                        <td class="border-dark border-right" id="df-num">2</td>
                                        <td class="border-dark border-right" id="df-num">1</td>
                                    </tr>
                            </table>
                        </div>
                        <div class="DayOff_search float-right mt-2 mb-3" id="big-search">
                            <select>
                                <option>년도</option>
                                <option value="2021">2021 년</option>
                                <option value="2022">2022 년</option>
                                <option value="2023">2023 년</option>
                            </select>
                            <button class="btn btn-primary btn-sm">검색</button>
                        </div>
                      
                        <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center">
                            <colgroup>
                                <col style="width:85px">
                                <col style="width:85px">
                                <col style="width:85px">
                                <col style="width:220px">
                                <col style="width:85px">
                                <col style="width:200px">
                            </colgroup>
                            <thead class="bg-primary  text-white">
                                <tr>
                                    <th>이름</th>
                                    <th>부서명</th>
                                    <th>휴가 종류</th>
                                    <th>연차 사용 기간</th>
                                    <th>사용 연차</th>
                                    <th>결재 현황</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white">
                                <tr>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>결혼</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>2</td>
                                    <td>승인</td>
                                </tr>
                                <tr>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>결혼</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>2</td>
                                    <td>승인</td>
                                </tr>
                                <tr>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>결혼</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>2</td>
                                    <td>대기</td>
                                </tr>
                                <tr>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>결혼</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>2</td>
                                    <td>대기</td>
                                </tr>
                                <tr>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>결혼</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>2</td>
                                    <td>대기</td>
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