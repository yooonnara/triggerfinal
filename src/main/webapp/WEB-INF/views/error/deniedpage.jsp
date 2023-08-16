<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 시작 Sidebar -->
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
		</div>
		<!-- 사이드바 종료 End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- 상단바 시작 Topbar -->
				<div id="topbar">
					<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
				</div>
				<!-- 상단바 종료 End of Topbar -->


				<!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">
					 <!-- 404 Error Text -->
                    <div class="text-center">
                        <div class="error mx-auto" data-text="403">403</div><br>
                        <p class="lead text-gray-800 mb-5">접근이 거부되었습니다.</p>
                        <p class="text-gray-500 mb-1">자세한 사항은 관리자에게 문의해 주시기 바랍니다.</p>
                        <a href="${path }/main"><span class="text-primary">&larr; 메인페이지로 돌아가기</span></a>
                    </div>
				</div>
				<!-- 수정할 컨테이너 종료 End of Main Content -->

			</div>

			<!-- Footer -->
			<div id="footer">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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

	
</body>
</html>