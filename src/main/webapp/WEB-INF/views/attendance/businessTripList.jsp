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
                    <h1 class="h3 text-dark mt-5 ml-1 mb-5">출장 현황</h1>

                    <div class="businessTripList-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                        <!-- 출장신청 개수 -->
                        <p class="ml-2">출장신청  
                        	<strong style="color:blue">10</strong>
                        </p>
                    </div>
                        <!-- 사용 내역 테이블 -->
                        <table class="table text-center shadow table-sm">
                            <colgroup>
                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:80px">
                                <col style="width:90px">
                                <col style="width:120px">
                                <col style="width:80px">
                                <col style="width:80px">
                                <col style="width:100px">
                            </colgroup>
                            <thead class="bg-primary">
                                <tr>
                                    <th>NO.</th>
                                    <th>이름</th>
                                    <th>소속</th>
                                    <th>등록일</th>
                                    <th>휴가 사용 기간</th>
                                    <th>제목</th>
                                    <th>진행상황</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="bg-white">
                                <tr>
                                    <td>25</td>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>2023-07-02</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>출장 신청</td>
                                    <td>대기</td>
                                    <td>
                                    <a href="#" data-toggle="modal" data-target="#cancelModal" class="btn btn-sm border-warning" id="ccbtn"> 취소 </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>25</td>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>2023-07-02</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>출장 신청</td>
                                    <td>대기</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#cancelModal" class="btn btn-sm border-warning" id="ccbtn"> 취소 </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>25</td>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>2023-07-02</td>
                                    <td>2023-07-19 ~ 2023-07-20</td>
                                    <td>출장 신청</td>
                                    <td>대기</td>
                                    <td>
                                        <a href="#" data-toggle="modal" data-target="#cancelModal" class="btn btn-sm border-warning" id="ccbtn"> 취소 </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
				<!-- 수정할 컨테이너 종료 End of Main Content -->
				<!-- 출장신청 삭제 모달-->
                <div id="cancel-businessTrip">
                    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <p><br>출장신청을 삭제하시겠습니까?<br></p>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-primary" href="#">확인</a>
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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