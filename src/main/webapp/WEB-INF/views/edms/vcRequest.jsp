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
        <h1 class="h3 text-dark mt-5 mb-5">연차신청하기</h1>

        <div class="vcRequest-area row mt-6 mb-6">
            <div class="mypage-container col-12 d-flex justify-content-center">

                <form class="vc shadow px-5 py-5 ">
                    <table class="table-sm ml-1 mr-5"">
                      
                      
                        <tr>
                            <td>이름(한글)</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                                placeholder="나빈" readonly></td>
                        </tr>
                        <tr>
                            <td>부서</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                                placeholder="개발팀" readonly></td>
                        </tr>
                        <tr>
                            <td>직급</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                                placeholder="대리" readonly></td>
                        </tr>
                        <tr>
                            <td>연차 구분</td>
                            <td> <select id="type" onchange="bsnFn()" class="custom-select ml-5 mb-1" col-sm-12">
                                <option selected>연차 종류를 선택하세요</option>
                                <option name="type" value="1">연차-결혼</option>
                                <option name="type" value="2">연차-휴가</option>
                                <option name="type" value="3">연차-조의</option>
                                <option name="type" value="4">출장</option>
                              </select>
                        </tr>
                        
                         <tr>
                        <td>신청 내용</td>
                       <td>
                            <textarea class="form-control ml-5 mb-1" name="exampleFormControlTextarea1" rows="4"></textarea>
                        </td>
                        </tr>
            
                      <tr>
                        <td>연차시작날짜</td>
                        
	                     <td>
	                    <input type="date" class="form-control ml-5 mb-1" name="enroll_date" id="">   </td>
	                    </tr>
	                         <tr>
	                         <td class="align-middle">연차끝날짜</td>
	                               
                             <td> <input type="date" class="form-control ml-5 mb-1" name="resign_date" id=""></td>
	                            
                            </tr>
                           
                    </table>
                    <div class="req-btn d-flex justify-content-around pt-5  ">
                        <a class="align-text-bottom btn btn-primary " href="#">등록</a></button>
                    </div>
                </form>
            </div>
        </div>
        
<!-- <script>
function bsnFn(){
	var type=documnet.getElementById("type");
	var value=()
	
}

</script> -->
        
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
    <a class="scroll-to-top rounded" href="#page-top" style="display:list-item">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 로그아웃 확인창 Logout Modal-->
    <div id="logoutCheck">
        <script>$('#logoutCheck').load('./include/logout.html')</script>
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