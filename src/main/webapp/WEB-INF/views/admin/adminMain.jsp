<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
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
                  <!--   <h1 class="h3 text-dark mt-5 mb-5">HOME</h1> -->
                    
                    <div class="col-12 mb-5 pb-5 mt-5">
							<div class="card border-left-dark shadow h-100 py-2">
								<div class="card-body">
									<div class="no-gutters align-items-center d-flex text-center">
										<div class="col-3">
											<h5 class="">사이트명</h5><h6>JOIN OFFICE</h6>
										</div>
										<div class="col-3">
											<h5>사이트 URL</h5><h6>www.joinoffce.com</h6>
										</div>
										<div class="col-3">
											<h5>담당자</h5><h6>${sessionEmp.name}</h6>
										</div>
										<div class="col-3">
											<h5>총 계정 수</h5><h6>19명</h6>
										</div>
										<div class="col-auto">
										</div>
									</div>
								</div>
							</div>
						</div>

                    <div class="notice-container row justify-content-center mb-5">
	                    <img src="${pageContext.request.contextPath}/resources/img/undraw_office.svg" style="width: 50%">
	                </div>
	                    <p class="text-center">
	                    JOIN OFFICE 를 통해
						효율적이고 편리한
						업무관리를 시작해 보세요!</p>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

</body>

</html>