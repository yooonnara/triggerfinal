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
                <div class="container-fluid pl-5 pr-5">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 mb-5">전자결재관리</h1>
                    
                     <div class="edsmVc-container">

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
                      
                                <div class="btn-member col-4 ">
                                    <button type="button" class="btn btn-dark btn-sm  ml-1 float-right">반려</button>
                                     <button type="button" class="btn btn-outline-dark btn-sm ml-1 float-right">승인</button>
                                      <button type="button" class="btn btn-outline-dark btn-sm ml-1 float-right">대기</button>
                                      <button type="button" class="btn btn-outline-dark btn-sm ml-1 float-right">전체</button>
                                      
                                </div>
                            </div>
                       
                            <!-- 검색하기 버튼 -->
                            
                            
                            
                                 <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="15%" />
                                    <col width="15%" />
                                    <col width="10%" />
                                    <col width="15%" />
                                    <col width="10%" />
                                    <col width="25%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th>기안일</th>
                                        <th>문서번호</th>
                                        <th>구분</th>
                                        <th>이름</th>
                                        <th>첨부</th>
                                        <th>결재상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2023-07-22</td>
                                        <td>조의</td>
                                        <td>nr423</td>
                                       <td><a href="#" data-toggle="modal" data-target="#viewVcModal">제목</a></td>
                                      <td><img src="resources/img/#"></td>
                                      <td><a href="#" data-toggle="modal" data-target="#viewVcModal">결재대기</a></td>                                 
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

  <!-- page view 모달-->
            <div id="viewBd">
                <div class="modal fade text-center" id="viewVcModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">전자 결재 조회</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body px-3 py-3">
                                <form class="user">
                                <table class="table text-dark table-borderless">
                           			 <tbody class="text-left">
                                <tr class="text-center">
                                    <td colspan='2'></td>
                                 </tr>
                                        <tr>
                                            <td>기안자</td>
                                            <td>
                                                <input type="text" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>소속</td>
                                            <td>
                                                <input type="text" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>기안일</td>
                                            <td>
                                                <input type="date" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>문서번호</td>
                                            <td>
                                                <input type="number" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>휴가기간 </td>
                                            <td>
                                                <input type="date" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly>
                                            </td>
                                        </tr>
                                         <tr>
			                                <td class="align-middle">구분</td>
			                                <td>
			                                    <input type="number" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly>
			                              	</td>
                          			  </tr>
                                        </tbody> 
                                    </table>
                                </form>
                            </div>
                          <div class="modal-footer">
                                  <button class="btn btn-dark" href="#">결재승인</button>
                      		 <button class="btn btn-danger" href="#">승인 반려</button>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                            </div>
                          </div>
                      </div>
				</div>
            </div>

            <!-- Footer -->
        
                <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 부트스트랩 스크립트 -->
	<div id="bootstrap">
		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
	</div>
	
</body>

</html>