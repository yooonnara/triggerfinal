<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Border Utilities</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>


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

    <!--ë¶í¸ì¤í¸ë© ìì´ì½-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- ì¬ì´ëë° ìì Sidebar -->
        <div id="sidebar">
           <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        </div>
        <!-- ì¬ì´ëë° ì¢ë£ End of Sidebar -->


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
     <div id="content">

                <!-- ìë¨ë° ìì Topbar -->
                <div id="topbar">
                    <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
                </div>
                <!-- ìë¨ë° ì¢ë£ End of Topbar -->
 

                              <!-- - Begin Page Content -->
    <div class="container-fluid pl-5 pr-5">

        <!-- íì´í Page Heading -->
        <h1 class="h3 text-dark mt-5 mb-5">출장신청하기</h1>

        <div class="vcRequest-area row mt-6 mb-6">
            <div class="mypage-container col-12 d-flex justify-content-center">

                <form class="vc shadow px-5 py-5" name="bsninsertForm" action="${path }/edms/insertbsn" method="post" enctype="multipart/form-data" >
                    <table class="table-sm ml-1 mr-5">
                      <input type="hidden" name="type" value="1"/> 
                      <!--0은연차이고 1은 출장  -->
                      <input type="hidden" name="detailType" value="출장"/>
                      <input type="hidden" name="empNo" value="${loginEmp.no }"/>
                      
                         <tr>
                            <td>번호</td>
                            <td><input class="form-control ml-5 mb-1" type="number"
                               value="${loginEmp.no }" name="empNo" placeholder="" readonly ></td>
                        </tr>
                        <tr>
                            <td>이름(한글)</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                             value="${loginEmp.name }" placeholder="" readonly ></td>
                        </tr>
                           <tr>
                            <td>부서</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                              value="${loginEmp.deptTitle }" placeholder="" readonly>
                              <input type="hidden" name="deptNo" value="${loginEmp.deptNo }"/></td>
                        </tr>
                        <tr>
                            <td>직급</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                               value="${loginEmp.jobTitle }" placeholder="" readonly>
                               <input type="hidden" name="jobNo" value="${loginEmp.jobNo }"/></td>
                        </tr>
                        <tr>
                      <!--   <td>작성날짜</td>
                        
	                     <td>
	                    <input type="date" class="form-control ml-5 mb-1" name="createDate" id="createDate">   </td>
	                    </tr> -->
                         <tr>
                            <td>제목</td>
                            <td><textarea class="form-control ml-5 mb-1" name="title" id="title" rows="1"></textarea></td>
                        </tr>
                        
                         <tr>
                        <td>내용</td>
                       <td>
                            <textarea class="form-control ml-5 mb-1" name="content" id="content" rows="4"></textarea>
                        </td>
                        </tr>
            
                      <tr>
                        <td>출장시작일</td>
                        
	                     <td>
	                    <input type="date" class="form-control ml-5 mb-1" name="startDate" id="startDate">   </td>
	                    </tr>
	                       <tr>
	                         <td >출장종료일</td>
	                               
                             <td> <input type="date" class="form-control ml-5 mb-1" name="endDate" id="endDate"></td>
	                            
                            </tr>
                            
                            <tr>
                            <td>첨부파일</td>
                            <td> 
                            <input type="file" class="form-control-file  ml-5 mb-1" name="upFile"><!-- "exampleFormControlFile1" -->
                            	</td>	
                            </tr>
                           
                    </table>
                    <div class="req-btn d-flex justify-content-around pt-5  ">
                        <!-- <button class="align-text-bottom btn btn-primary " onclick="location.assign('{path}/edms/bsnView)';">등록</button> -->
                        <input type="submit" class="align-text-bottom btn btn-primary"  value="등록">
                    </div>
                </form>
            </div>
        </div>
        
    <!-- ìì í  ì»¨íì´ë ì¢ë£ End of Main Content -->
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

    <!-- ë¡ê·¸ìì íì¸ì°½ Logout Modal-->
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