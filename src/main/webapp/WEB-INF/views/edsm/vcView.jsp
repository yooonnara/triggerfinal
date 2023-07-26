<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 시작 Sidebar -->
        <div id="sidebar">
           <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        </div>
        <!-- 사이드바 종료 End of Sidebar -->


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
     <div id="content">

                <!-- 상단바 시작 Topbar -->
                <div id="topbar">
                    <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
                </div>
                <!-- 상단바 종료 End of Topbar -->
 

                <!-- 수정할 컨테이너 Begin Page Content -->
                <div class="container-fluid pl-5 pr-5">

                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 mb-5">전자결재>휴가신청</h1>

                    <div class="edsm-container">

                        <!-- 검색창 & 작성하기 영역 -->
                        <div class="search-write-area row mb-3">
                            <!-- 검색창 -->
                            <div class="search-area float-start col-8">
                                <form>
                                    <div class="search-area d-flex">
                                        <select name="notice-search" aria-label="Default select example" class="mr-1">
                                            <option selected value="1">전체</option>
                                            <option value="2">결재대기</option>
                                            <option value="3">결재승인</option>
                                            <option value="4">결재반려</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1">
                                        <button type="button" class="btn btn-primary btn-sm ">검색</button>
                                    </div>
                                </form>
                            </div>
                        <!--     작성하기 버튼
                            <div class="wirte-area col-4">
                                <a href="" class="btn btn-primary btn-sm float-right">글쓰기</a>
                            </div> -->
                        </div>

                        <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="10%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="15%" />
                                    <col width="40%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-primary text-white">
                                        <th>기안일</th>
                                        <th>문서번호</th>
                                        <th>구분</th>
                                        <th>제목</th>
                                        <th>첨부</th>
                                        <th>결재상테></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2023-07-22</td>
                                        <td>조의</td>
                                        <td>nr423</td>
                                       <td><a href="#" data-toggle="modal" data-target="#viewEdsmModal">제목</a></td>
                                      <td><img src="resources/img/#"></td>
                                      <td><a href="#" data-toggle="modal" data-target="#viewEdsmModal">결재대기</a></td>                                 
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

  <!-- 멤버생성 모달-->
            <div id="viewEdsm">
                <div class="modal fade text-center" id="viewEdsmModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">전자 결재 조회</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form class="user">
                                    <table>
                                        <tr>
                                            <td>기안자</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="" placeholder="Readonly input here…" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>소속</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="" placeholder="Readonly input here…" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>기안일</td>
                                            <td>
                                                <input type="date" class="form-control ml-5 mb-3" name="userId" id="" placeholder="Readonly input here…" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>문서번호</td>
                                            <td>
                                                <input type="number" class="form-control ml-5 mb-3" name="userId" id="" placeholder="Readonly input here…" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>휴가기간 </td>
                                            <td>
                                                <input type="date" class="form-control ml-5 mb-3" name="userId" id="" placeholder="Readonly input here…" readonly>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td>첨부파일 </td>
                                            <td>
                                                <input type="file" class="form-control ml-5 mb-3" name="userId" id="" placeholder="Readonly input here…" readonly>
                                            </td>
                                        </tr>  
                                    </table>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <a class="btn btn-primary" href="#">목록</a>
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

             <!-- Footer -->
             <div id="footer">
                <script>$('#footer').load('./include/footer.html')</script>
            </div>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top"style="display:list-item">
        <i class="fas fa-angle-up"></i>
    </a>

   


</body>

</html>