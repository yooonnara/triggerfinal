vv<%@ page language="java" contentType="text/html; charset=UTF-8"
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
                    <h1 class="h3 text-dark my-5 ml-5">전사원 연차 현황</h1>
                    <div class="adminDayOff-container "> 
                    <!-- 검색 & 부여 버튼 -->
                    <div class="row justify-content-between" id="big-search" >
                        <!-- 사원명 부서명 검색 버튼 -->
                        <div class="float-left mb-3 col-5" id="dayOffSearch ">
                            <label class="text-dark">사원명</label>
                                <input type="text" class=" mr-2" id="searchEmp">
                            <label class="text-dark">부서명</label>
                                <input type="text" id="searchDep">
                                <button class="btn btn-dark btn-sm">검색</button>
                        </div>                
                         <!-- 연차부여 버튼 -->
                        <div class="btn-member float-right mb-4 mr-3">
                            <a href="#" class="btn btn-dark btn-sm mr-2">연차 리셋</a>
                            <a href="#" data-toggle="modal" data-target="#insertDayOffModal"
                                class="btn btn-dark btn-sm">연차 조정</a>
                        </div>
                    </div>    
                    <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table text-center table-sm">
                            <colgroup>
                                <col style="width:70px">
                                <col style="width:90px">
                                <col style="width:90px">
                                <col style="width:100px">
                                <col style="width:80px">
                                <col style="width:80px">
                                <col style="width:80px">
                                <col style="width:80px">
                            </colgroup>
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th><input type="checkbox"></th>
                                    <th>이름</th>
                                    <th>부서명</th>
                                    <th>입사일</th>
                                    <th>퇴사일</th>
                                    <th>발생 연차</th>
                                    <th>사용 연차</th>
                                    <th>잔여 연차</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white">
                                <tr>
                                    <td><input type="checkbox" name="" value="1"></td>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>2022-01-03</td>
                                    <td>-</td>
                                    <td>15</td>
                                    <td>5</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" value="1"></td>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>2022-01-03</td>
                                    <td>-</td>
                                    <td>15</td>
                                    <td>5</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" name="" value="1"></td>
                                    <td>김땅땅</td>
                                    <td>홍보 2팀</td>
                                    <td>2022-01-03</td>
                                    <td>-</td>
                                    <td>15</td>
                                    <td>5</td>
                                    <td>10</td>
                                </tr>   

                            </tbody>
                        </table>
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
                </div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->
                <!-- 연차 조정 modal창 -->
				<div id="insertDayOff">
                    <div class="modal fade text-center" id="insertDayOffModal" tabindex="-1" role="dialog"
                        aria-activedescendant="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">연차 조정</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form class="dayOff">
                                        <!--  class="table-bordered" -->
                                        <table id="dayOffTable">
                                            <colgroup>
                                                <col style="width:120px">
                                                <col style="width:150px">

                                            </colgroup>
                                            <tr>
                                                <th>이름</th>
                                                <td class="font-weight-bold ml-3 mb-5">김땅땅 홍보 2팀</td>
                                            </tr>
                                            <tr>
                                                <th>입사일</th>
                                                <td class="font-weight-bold ml-3 mb-5">2022-07-21</td>
                                            </tr>
                                            <tr>
                                                <th>선택</th>
                                                <td>
                                                    <label><input type="radio" name="select"checked>발생 연차</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>연차수</th>
                                                <td>
                                                    <input type="text" class="form-control form-control-sm" name="DayOffCount" id="countForm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>내용</th>
                                                <td>
                                                    <textarea class="form-control" id="dayOffTextarea" rows="3" style="resize: none;"></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
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