<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
<link href="${path }/resources/css/nara.css" rel="stylesheet">
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

					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark mt-5 mb-5">비밀번호 변경</h1>

					<div class="mypage-area row mb-3 justify-content-center">
						<div class="mypage-container col-8 d-flex justify-content-center bg-white shadow mb-3">

							<form class="user" name="passwordFrm" id="passwordFrm" action="${path }/mypagePassword" method="post">
								<table class="table-sm mt-5 mb-5">
									<tbody class="text-left">
										<tr>
											<td>현재 비밀번호</td>
											<td>
												<input type="password" 
													class="form-control ml-5" name="cPwd" id="cPwd">
												<span class="cPwd-msg small text-danger ml-5"></span>
											</td>
										</tr>	
										<tr>
											<td>변경할 비밀번호</td>
											<td>
												<input onKeyup="checkPwd1(this.value)" onclick="checkPwd1(this.value)" type="password" 
													class="form-control ml-5" name="pwd1" id="pwd1">
												<span class="pwd1-msg small text-danger ml-5"></span>
											</td>
										</tr>
										<tr>
											<td>비밀번호 확인</td>
											<td>
												<input onKeyup="checkPwd2(this.value)" onclick="checkPwd2(this.value)" type="password" 
													class="form-control ml-5" name="pwd2" id="pwd2">
												<span class="pwd2-msg small text-danger ml-5"></span>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="button" onclick="updatePasswordFrm()">
							저장
						</button>
						<button class="btn btn-secondary" type="reset" data-dismiss="modal">
							취소
						</button>
					</div>
				</div>
				<!-- 수정할 컨테이너 종료 End of Main Content -->
			</div>

			<!-- Footer -->
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>
	
	
	
<script type="text/javascript" src="${path}/resources/js/employee.js"></script>
	
<script>

//저장 버튼 눌렀을 때 값 전체 검사
function updatePasswordFrm(){
	
	// 현재 비밀번호
	if(checkCPwd($("#cPwd").val()) == false){
		$("#cPwd").focus();
		return false;
	}
	
	
	// 변경할 비밀번호
	if(checkPwd1($("#pwd1").val()) == false){
		$("#pwd1").focus();
		return false;
	}
	
	// 비밀번호 확인
	if(checkPwd2($("#pwd2").val()) == false){
		$("#pwd2").focus();
		return false;
	}

function frmSubmit(){
	if(confirm('저장하시겠습니까?')){
		$('#passwordFrm').submit();
	}
}


</script>

</body>

</html>