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
           <jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>
           <link href="${page }/resources/css/yelin.css" rel="stylesheet">
        </div>
        <!-- 사이드바 종료 End of Sidebar -->


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- 상단바 시작 Topbar -->
                <div id="topbar">
                    <jsp:include page="/WEB-INF/views/admin/common/admin_topbar.jsp"/>
                </div>
                <!-- 상단바 종료 End of Topbar -->


              <!-- 수정할 컨테이너 Begin Page Content -->
                <div class="container-fluid">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark my-5 ml-2">전사 출장 현황</h1>
                    <div class="adminBusinessTrip-container "> 
                    <!-- 검색 & 조회 버튼 -->
                    <div class="row justify-content-between" id="big-search" >
                    	<!-- 사원명 부서명 검색 버튼 -->
                        <div class="float-left mb-3 col-5" id="dayOffSearch ">
                            <label class="text-dark">사원명</label>
                                <input type="text" class=" mr-1" id="searchEmp">
                            <label class="text-dark">부서명</label>
                                <input type="text" id="searchDep">
                                <button class="btn btn-dark btn-sm">검색</button>
                        </div>      
                        <!--조회 버튼 -->
                        <div class="float-right mb-4 mr-3 btn-member">
                            <a href="#" class="btn btn-dark btn-sm mr-2 ml-5">전체</a>
                            <a href="#" class="btn btn-dark btn-sm mr-2">결제 대기</a>
                            <a href="#" class="btn btn-dark btn-sm">승인</a>
                        </div>
                                  
                    </div>   
                    <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table table-sm shadow table-hover text-center">
                            <colgroup>
                                <col style="width:70px">
                                <col style="width:90px">
                                <col style="width:90px">
                                <col style="width:100px">
                                <col style="width:80px">
                                <col style="width:130px">
                                <col style="width:130px">
                                <col style="width:80px">
                            </colgroup>
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th>문서번호</th>
                                    <th>사번</th>
                                    <th>소속</th>
                                    <th>직위</th>
                                    <th>이름</th>
                                    <th>휴가 사용 기간</th>
                                    <th>제목</th>
                                    <th>진행상황</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white">
                                <tr>
                                    <td>10</td>
                                    <td>121421</td>
                                    <td>홍보 2팀</td>
                                    <td>대리</td>
                                    <td>김땅땅</td>
                                    <td>2023-07-19 ~ 2023-7-21</td>
                                    <td>출장 신청</td>
                                    <td>승인</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>121421</td>
                                    <td>홍보 2팀</td>
                                    <td>대리</td>
                                    <td>김땅땅</td>
                                    <td>2023-07-19 ~ 2023-7-21</td>
                                    <td>출장 신청</td>
                                    <td>승인</td>
                                </tr>
                                <tr>                         
                                    <td>10</td>
                                    <td>121421</td>
                                    <td>홍보 2팀</td>
                                    <td>대리</td>
                                    <td>김땅땅</td>
                                    <td>2023-07-19 ~ 2023-7-21</td>
                                    <td>출장 신청</td>
                                    <td>승인</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>                    
                </div>
                <!-- 페이징 -->
                <div class="pasing-area">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center mt-4">
                            <li class="page-item">
                                <a class="page-link text-muted" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link text-muted" href="#">1</a></li>
                            <li class="page-item"><a class="page-link text-muted" href="#">2</a></li>
                            <li class="page-item"><a class="page-link text-muted" href="#">3</a></li>
                            <li class="page-item"><a class="page-link text-muted" href="#">4</a></li>
                            <li class="page-item"><a class="page-link text-muted" href="#">5</a></li>
                            <li class="page-item">
                            <li class="page-item">
                            <li class="page-item">
                                <a class="page-link text-muted" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                </div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->

            </div>
            <!-- Footer -->
            <div id="footer">
                <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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