<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${path }/resources/css/nara.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

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
            
            
            
            <!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">

					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark mt-5 mb-5">출장 신청 내역</h1>

					<div class="mypage-area row mb-3 justify-content-center">
						<div class="mypage-container col-6 d-flex justify-content-center bg-white shadow mb-3 pt-3">

							<form class="user" name="bsView"  >
								<table class="table-sm mt-5 mb-5">
									<tbody class="text-left" id="bsnUpdate">
										
										<tr>
											<td>결재번호</td>
											<td><input class="form-control ml-5" type="number" value= "${edms.no }" readonly ></td>
										</tr>
										<tr>
											<td>기안일</td>
											<td><input class="form-control ml-5" type="createDate" value= "${edms.createDate }" readonly ></td>
										</tr>
										<tr>
											<td>사번</td>
											<td>
												<input class="form-control ml-5" type="text" value="${edms.emp.empNum}" readonly>
											</td>
										</tr>
										<tr>
											<td>이름(한글)</td>
											<td>
												<input class="form-control ml-5" type="text" value="${edms.emp.name}" readonly>
											</td>
										</tr>				
										<tr>
											<td>부서</td>
											<td>
											<input class="form-control ml-5" type="text" value="${edms.emp.deptTitle }" readonly>
											</td>
										</tr>
										<tr>
											<td>직급</td>
											<td>
											<input class="form-control ml-5" type="text" name="jobTitle" value="${edms.emp.jobTitle }" readonly>
											</td>
										</tr>

										<tr>
                            <td>제목</td>
                            <td><textarea class="form-control ml-5 mb-1" rows="1" readonly><c:out value="${edms.title }"/> </textarea></td>
                        </tr>
                        
                         <tr>
                        <td>내용</td>
                       <td>
                            <textarea class="form-control ml-5 mb-1" name="content"  rows="4" readonly><c:out value="${edms.content }"/></textarea>
                        </td>
                        </tr>
            
                      <tr>
                        <td>출장/연차 시작일</td>
                        
	                     <td>
	                    <input type="date" class="form-control ml-5 mb-1" name="startDate" value="${edms.startDate }" readonly>   </td>
	                    </tr>
	                       <tr>
	                         <td>출장/연차 종료일</td>      
                             <td> <input type="date" class="form-control ml-5 mb-1" name="endDate" value="${edms.endDate }" readonly></td>
                            </tr>
                            </tbody> 
						</table>
						
						<div class="btn-click">
                                  <button type="button" class="btn btn-dark" id="vcButton1" onclick="changeResult('${edms.no }',1);">결재승인</button>
                      		 <button type="button" class="btn btn-danger" id="button2" onclick="changeResult('${edms.no }',2);">승인 반려</button>
                        <button class="btn btn-secondary" id="button3" onclick="button1_click();">취소</button>
                        </div>
						</form>
					</div>
					</div>
			
			      </div>
                  <script>
                  	function changeResult(edmsNo,appStatus){
                  		location.replace('${pathContext.request.contextPath}/edms/adminBsnView/statuschange?no='+edmsNo+"&appStatus="+appStatus);
                  	}
                  </script>
           
				<!-- 수정할 컨테이너 종료 End of Main Content -->
            </div>
            
          
            
            
                      <!-- 페이징 -->
                        <div class="pasing-area">
                    	    <c:out value="${pageBar }" escapeXml="false"/>
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