<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JOIN</title>

    <!-- Custom fonts for this template-->
    <link href="${page }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${page }/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${page }/resources/css/sb-admin-2.css" rel="stylesheet">
    <script src="${page }/resources/js/jquery-3.7.0.min.js"></script>

    <!--부트스트랩 아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>

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
                <h1 class="h3 text-dark mt-5 mb-5">멤버 통합관리</h1>

                    <div class="notice-container">

                         <!-- 검색창 & 작성하기 영역 -->
                         <div class="search-write-area row mb-3">
                            <!-- 검색창 -->
                            <div class="search-area float-start col-8">
                                <form>
                                    <div class="search-area d-flex">
                                        <select name="notice-search" aria-label="Default select example" class="mr-1">
                                            <option selected value="1">이름</option>
                                            <option value="2">사번</option>
                                            <option value="3">전화번호</option>
                                            <option value="3">이메일</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1">
                                        <button type="button" class="btn btn-dark btn-sm ">검색</button>
                                    </div>
                                </form>
                            </div>
                            <!-- 작성하기 버튼 -->
                            <div class="btn-member wirte-area col-4">
                                <a href="#" class="btn btn-dark btn-sm float-right">멤버삭제</a>
                                <a href="#" data-toggle="modal" data-target="#insertMemberModal"
                                class="btn btn-dark btn-sm mr-1 float-right">멤버생성</a>
                            </div>
                        </div>


                        <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="8%" />
                                    <col width="10%" />
                                    <col width="12%" />
                                    <col width="15%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="15%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th>선택</th>
                                        <th>이름</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>계정상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" id="member-check"></td>
                                        <td><a href="#" data-toggle="modal" data-target="#insertMemberModal">윤나라</a></td>
                                        <td>미지정</td>
                                        <td>대표이사</td>
                                        <td>010-4727-6729</td>
                                        <td>yooonnara@gmail.com</td>
                                        <td>정상</td>
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

            </div>

            <!-- 멤버생성 모달-->
            <div id="insertMember">
                <div class="modal fade text-center" id="insertMemberModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">멤버 생성</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form class="user">
                                    <table>
                                        <tr>
                                            <td>사번</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>이름(한글)</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>아이디</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="" placeholder="영문, 숫자 4글자 이상">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>비밀번호</td>
                                            <td>
                                                <input type="password" class="form-control ml-5 mb-3" name="userId" id="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>비밀번호 확인</td>
                                            <td>
                                                <input type="password" class="form-control ml-5 mb-3" name="userId" id="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>계정상태</td>
                                            <td>
                                                <select class="form-control ml-5 mb-3" aria-label="Default select example">
                                                    <option value="1" selected>정상</option>
                                                    <option value="2">중지</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>부서</td>
                                            <td>
                                                <select class="form-control ml-5 mb-3" aria-label="Default select example">
                                                    <option selected>미지정</option>
                                                    <option value="1">운영팀</option>
                                                    <option value="2">개발팀</option>
                                                    <option value="3">인사팀</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>직급</td>
                                            <td>
                                                <select class="form-control ml-5 mb-3" aria-label="Default select example">
                                                    <option selected>사원</option>
                                                    <option value="1">대리</option>
                                                    <option value="2">과장</option>
                                                    <option value="3">차장</option>
                                                    <option value="3">부장</option>
                                                    <option value="3">이사</option>
                                                    <option value="3">대표</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>이메일</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>전화번호</td>
                                            <td>
                                                <input type="text" class="form-control ml-5 mb-3" name="userId" id="" placeholder="- 없이 입력">
                                            </td>
                                        </tr>
                                       
                                    </table>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <a class="btn btn-dark" href="#">저장</a>
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 로그아웃 확인창 Logout Modal-->
    <div id="logoutCheck">
        <jsp:include page="/WEB-INF/views/admin/common/admin_logoutModal.jsp"/>
    </div>


    <!-- Bootstrap core JavaScript-->
    <script src="${page }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${page }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${page }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${page }/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${page }/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${page }/resources/js/demo/chart-area-demo.js"></script>
    <script src="${page }/resources/js/demo/chart-pie-demo.js"></script>
</body>

</html>