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
    <script src="js/jquery-3.7.0.min.js"></script>

    <!--부트스트랩 아이콘-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>

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
                <h1 class="h3 text-dark mt-5 mb-5">전자결재조회</h1>

                <div class="edms-container">

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
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="20%" />
                                    <col width="10%" />
                                    <col width="20%" />
                            </colgroup>
						
                            <thead>
                                <tr class="bg-primary text-white">
                                    <th>문서번호</th>
                                    <th>기안일</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>이름</th>
                                     <th>제목</th>
                                    <th>구분</th>
                                    <th>결재상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty edms}">
                            <c:forEach var="e" items="${edms}">
                                <tr>
                                	<td>${e.no }</td>
                                    <td>${e.createDate }</td> 
                                    <td>${e.emp.deptTitle }</td>
                                    <td>${e.emp.jobTitle }</td>
                                    <td>${e.emp.name }</td>
                                    <td><a href="${path }/edms/edmsView?no=${e.no}">${e.title }</a></td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${e.type==0 }">연차</c:when>
                                    	<c:when test="${e.type==1 }">출장</c:when>
                                    	<c:otherwise>미정</c:otherwise>
                                    </c:choose>
                                    </td>
                                  <td>
                                  <a href="${path }/edms/edmsView?no=${e.no}" >
                                  	<c:if test="${e.appStatus==0 }">결재대기</c:if>
                                  	<c:if test="${e.appStatus==1 }">승인</c:if>
                                  	<c:if test="${e.appStatus==2 }">반려</c:if>
                                  </a>
                               </td>                                 
                                </tr>
                                </c:forEach>
                                </c:if>
                            </tbody> 
                        </table>
                    </div>

                    <!-- 페이징 -->
                    <div class="pasing-area">
                    <c:out value="${pageBar }" escapeXml="false"/>
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

    <!-- 로그아웃 확인창 Logout Modal-->
    <div id="logoutCheck">
        <script>$('#logoutCheck').load('./include/logout.html')</script>
    </div>



    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>