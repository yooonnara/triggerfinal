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
					<h1 class="h3 text-dark mt-5 mb-5">내 정보 수정</h1>

					<div class="mypage-area row mb-3 justify-content-center">
						<div class="mypage-container col-8 d-flex justify-content-center bg-white shadow mb-3">

							<form class="user" name="myPagefrm" id="myPagefrm" action="${path }/updateEmployee" method="post">
								<table class="table-sm mt-5 mb-5">
									<tbody class="text-left">
										<tr class="text-center">
											<td colspan='2'>
												<div class="box" style="cursor: pointer">
													<img src="${path }/resources/img/user_profile.png" 
														class="profile rounded enter-block profile_img"
														style="width: 80px; height: 80px" id="profile_img">
													<i class="bi bi-gear-fill profile_img"></i>
													<input id="profile_img_file" type="file" accept=".jpg, .png" style="display: none;">
												</div>
											</td>
										</tr>
										<tr>
											<td>사번</td>
											<td>
												<input id="emp_num" class="form-control ml-5" type="text" value="${empInfo.empNum}" readonly>
											</td>
										</tr>
										<tr>
											<td>이름(한글)</td>
											<td>
												<input id="emp_name" class="form-control ml-5" type="text" value="${empInfo.name}" readonly>
											</td>
										</tr>
										<tr>
											<td>아이디</td>
											<td>
												<input id="emp_id" name="emp_id" class="form-control ml-5" type="text" value="${empInfo.id}" readonly>
											</td>
										</tr>
										<tr>
											<td>비밀번호</td>
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
										<tr>
											<td>입사일</td>
											<td>
												<input id="enroll_date" class="form-control ml-5" type="date" value="${empInfo.enrollDate}" readonly>
											</td>
										</tr>
										<tr>
											<td>부서</td>
											<td>
											<input id="dept" class="form-control ml-5" type="text" value="${empInfo.deptTitle}" readonly>
											</td>
										</tr>
										<tr>
											<td>직급</td>
											<td>
												<input id="Job" class="form-control ml-5" type="text" value="${empInfo.jobTitle}" readonly>
											</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>
												<input onKeyup="checkEmail(this.value)" type="email" 
														class="form-control ml-5" name="email" id="email" value="${empInfo.email}">
												<span class="email-msg small text-danger ml-5"></span>
											</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>
												<input onKeyup="checkPhone(this.value)" type="text" value="${empInfo.phone}"
														class="form-control ml-5" name="phone" id="phone" placeholder="- 없이 입력" value="">
												<span class="phone-msg small text-danger ml-5"></span>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="button" onclick="checkMyPageFrm()">
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

$(".profile_img").on('click', function() {
	$('#profile_img_file').click();
})

//저장 버튼 눌렀을 때 값 전체 검사
function checkMyPageFrm(){
	
	// 비밀번호
	if(checkPwd1($("#pwd1").val()) == false){
		$("#pwd1").focus();
		return false;
	}
	
	// 비밀번호 확인
	if(checkPwd2($("#pwd2").val()) == false){
		$("#pwd2").focus();
		return false;
	}
	
	// 이메일
	if(checkEmail($("#email").val()) == false){
		$("#email").focus();
		return false;
	}
	
	// 전화번호
	if(checkPhone($("#phone").val()) == false){
		$("#phone").focus();
		return false;
	}
	frmSubmit();
}

function frmSubmit(){
	if(confirm('저장하시겠습니까?')){
		$('#myPagefrm').submit();
	}
}


</script>

</body>

</html>