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
   <div class="container-fluid">

                    <!-- 타이틀 Page Heading -->
                 <h1 class="h3 font-weight-bold text-dark  my-5 ml-5">결재요청하기 >연차신청</h1>

         <div class="edsm-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                    
                    <p class="h5 text-center font-weight-bold ">연차 일정, 필수정보 입력 </h5>
					
					<form>
						  <div class="form-group row ">
						    <label for="staticName" class="col-sm-2 col-form-label ">신청자</label>
						    <div class="col-sm-10">
						      <input type="text" readonly class="form-control-plaintext" id="staticName" value="나빈">
						    </div>
						     <label for="staticDept" class="col-sm-2 col-form-label">소속</label>
						    <div class="col-sm-10">
						      <input type="text" readonly class="form-control-plaintext" id="staticDept" value="인사부">
						    </div>
						  </div>
					</form>		
		<div class="form_text">
			<p class="h5 text-center font-weight-bold  py-3">연차 구분 </h5>
		</div>
				<div class="select-box py-2">
					<select class="custom-select col-sm-4">
					  <option selected>연차 종류를 선택해주세요</option>
					  <option value="1">결혼</option>
					  <option value="2">연차</option>
					  <option value="3">조의</option>
					</select>
				</div>	  
				
		<div class="form_text">
			<p class="h5 text-center font-weight-bold py-3">연차 신청 기간 </h5>
		</div>
			
		<form>
		<div class="date-form py-3">
			<label>
				시작일 
			</label>
				<input type="date" name="start" min="2023-07-23" max="2023-08-30"/>	
			<label>
				종료일
			</label>
				<input type="date" name="end" min="2023-07-23" max="2023-08-30"/>	
			</div>
		</form>		  
          
       <form>
 		 <div class="text-center form-group text py-4 ">
    		<label for="exampleFormControlFile1">파일 첨부 </label>
  			  <input type="file" class="form-control-file" id="exampleFormControlFile1">
  		</div>
	</form>
            
            
            <!--등록 여부 확인  -->
   

           
           <div class="req-btn py-5 ">
         	  <button type="button" class="btn btn-primary">등록</button>
          	 <button type="button" class="btn btn-primary">수정</button>
           </div>
           
           <style>
           .req-btn{
           margin-right: 5rem;
           text-align:right;}
           
           
           
           </style>
           
           
    
    
    
    
    
    
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