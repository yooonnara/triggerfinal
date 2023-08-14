<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
<link href="${path }/resources/css/nara.css" rel="stylesheet">
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

					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark mt-5 mb-5">기본정보 수정</h1>

					<div class="mypage-area row mb-3 justify-content-center">
						<div class="mypage-container col-8 d-flex justify-content-center bg-white shadow mb-3">

							<form class="user" name="myPagefrm" id="myPagefrm" action="${path }/updateEmployee" method="post" enctype="multipart/form-data">
								<table class="table mt-5 mb-5 text-dark table-borderless">
									<tbody class="text-left">
										<tr class="text-center">
											<td colspan='2'>
												<div class="box" style="cursor: pointer">
												<c:if test="${empInfo.empImg == null}">
													<img src="${path }/resources/img/user_profile.png" class="profile rounded enter-block profile_img rounded-circle"
														 id="profileImg">
												</c:if>
												<c:if test="${empInfo.empImg != null}">
													<img src="${path}/resources/upload/employee/${empInfo.empImg}" class="profile rounded enter-block profile_img rounded-circle"
														 id="profileImg">
												</c:if>
													<i class="bi bi-gear-fill profile_img "></i>
													<input onchange="PreviewImage()" method="multipart/form-data" id="upFile" name="upFile" type="file" accept="image/*" style="display: none;">
													<input type="hidden" name="oldImg" value="${empInfo.empImg}">
												</div>
												
											</td>
										</tr>
										<tr>
											<td class="align-middle">사번</td>
											<td>
												<input id="emp_num" class="form-control ml-5" type="text" value="${empInfo.empNum}" readonly>
											</td>
										</tr>
										<tr>
											<td class="align-middle">이름(한글)</td>
											<td>
												<input id="emp_name" class="form-control ml-5" type="text" value="${empInfo.name}" readonly>
											</td>
										</tr>
										<tr>
											<td class="align-middle">아이디</td>
											<td>
												<input id="emp_id" name="emp_id" class="form-control ml-5" type="text" value="${empInfo.id}" readonly>
											</td>
										</tr>
										<tr>
											<td class="align-middle">입사일</td>
											<td>
												<input id="enroll_date" class="form-control ml-5" type="date" value="${empInfo.enrollDate}" readonly>
											</td>
										</tr>
										<tr>
											<td class="align-middle">부서</td>
											<td>
											<input id="dept" class="form-control ml-5" type="text" value="${empInfo.deptTitle}" readonly>
											</td>
										</tr>
										<tr>
											<td class="align-middle">직급</td>
											<td>
												<input id="Job" class="form-control ml-5" type="text" value="${empInfo.jobTitle}" readonly>
											</td>
										</tr>
										<tr>
											<td class="align-middle">이메일</td>
											<td>
												<input onKeyup="checkEmail(this.value)" type="email" 
														class="form-control ml-5" name="email" id="email" value="${empInfo.email}">
												<span class="email-msg small text-danger ml-5"></span>
											</td>
										</tr>
										<tr>
											<td class="align-middle">전화번호</td>
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

$(".box > img, .box > i").on('click', function() {
	$('#upFile').click();
})

function PreviewImage() {
        // 파일리더 생성 
    var preview = new FileReader();
    preview.onload = function (e) {
        console.log(e);
        // img id 값 
    	$("#profileImg").attr('src',e.target.result);
    };
    // input id 값 
    preview.readAsDataURL($("#upFile")[0].files[0]);
 };
 

//저장 버튼 눌렀을 때 값 전체 검사
function checkMyPageFrm(){
	
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