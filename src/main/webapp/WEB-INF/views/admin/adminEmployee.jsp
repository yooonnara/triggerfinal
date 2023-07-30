<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${path }/resources/css/nara.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                <h1 class="h3 text-dark mt-5 mb-5">멤버 통합관리</h1>

                    <div class="notice-container">

                         <!-- 검색창 & 작성하기 영역 -->
                         <div class="search-write-area row mb-3">
                            <!-- 검색창 -->
                            <div class="search-area float-start col-8">
                                <form>
                                    <div class="search-area d-flex">
                                        <select name="notice-search" aria-label="Default select example" class="mr-1">
                                            <option selected value="1">이름</option>
                                            <option value="3">부서</option>
                                            <option value="3">직급</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1">
                                        <button type="button" class="btn btn-dark btn-sm ">검색</button>
                                    </div>
                                </form>
                            </div>
                            <!-- 작성하기 버튼 -->
                            <div class="btn-employee wirte-area col-4">
                                <a href="#" class="btn btn-dark btn-sm float-right">멤버삭제</a>
                                <a href="#" data-toggle="modal" data-target="#insertEmployeeModal"
                                class="btn btn-dark btn-sm mr-1 float-right">멤버생성</a>
                            </div>
                        </div>


                        <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="5%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="15%" />
                                    <col width="15%" />
                                    <col width="15%" />
                                    <col width="15%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th class="align-middle"><input type="checkbox" id="employee-check"></th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>이메일</th>
                                        <th>계정상태</th>
                                        <th>관리자여부</th>
                                    </tr>
                                </thead>
                                <tbody>
                               		<c:if test="${not empty employees}">
            							<c:forEach var="e" items="${employees}">
		                                    <tr>
		                                        <td class="align-middle"><input type="checkbox" id="employee-check"></td>
		                                   		<td>${e.no}</td>
		                                        <td>
		                                        	<a href="#" data-toggle="modal" data-target="#insertEmployeeModal">${e.name}</a>
		                                        </td>
		                                        <td>${e.deptTitle}</td>
		                                        <td>${e.jobTitle}</td>
		                                        <td>${e.email}</td>
		                                        <td>${e.accStatus}</td>
		                                        <td>${e.type}</td>
		                                    </tr>
	                                	</c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <!-- 페이징 -->
                        <div class="pasing-area">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center mt-4">
                                    <li class="page-item">
                                        <a class="page-link text-muted" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link text-muted" href="#">5</a></li>
                                    <li class="page-item">
                                    <li class="page-item">
                                    <li class="page-item">
                                        <a class="page-link text-muted" href="#" aria-label="Next">
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

            <!-- 멤버생성 모달-->
            <div id="insertEmployee">
				<div class="modal fade text-center" id="insertEmployeeModal"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">멤버 생성</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="frm" name="frm" class="user"
									action="${path }/insertEmployee" method="post">
									<table class="table text-dark table-borderless">
										<tbody class="text-left">
											<tr class="text-center">
												<td colspan='2'>
													<div class="box" style="cursor: pointer">
														<img src="${path }/resources/img/user_profile.png"
															class="profile rounded enter-block profile_img"
															style="width: 80px; height: 80px" id="profile_img">
														<i class="bi bi-gear-fill profile_img"></i> <input
															id="profile_img_file" type="file" accept=".jpg, .png"
															style="display: none;">
													</div>
												</td>
											</tr>
											<tr>
												<th class="align-middle">사번</th>
												<td><input type="text" class="form-control"
													name="emp_num" id="emp_num" requireda readonly></td>
											</tr>
											<tr>
												<th class="align-middle">이름(한글)</th>
												<td>
													<input onKeyup="checkName(this.value)" type="text" class="form-control" name="emp_name" id="emp_name" required>
													<span class="emp-name-msg small text-danger" style="display: none" >이름을 입력해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">성별</th>
												<td class="text-left">
													<input type="radio" name="gender" id="gender1" value="M">&nbsp;
													<label for="gender1">남</label>
													&nbsp;&nbsp;&nbsp;&nbsp; 
													<input type="radio" name="gender" id="gender2" value="F">&nbsp;
													<label for="gender2">여</label><br>
													<span class="gender-msg small text-danger" style="display: none">성별을 선택해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">아이디</th>
												<td>
													<input type="text" class="form-control" name="emp_id"
														id="emp_id" placeholder="영문, 숫자 4글자 이상" required
														onKeyup="checkId(this.value)">
													<span class="emp-id-msg small text-danger"></span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">비밀번호</th>
												<td>
													<input onKeyup="checkPwd1(this.value)" type="password" 
															class="form-control" name="pwd1" id="pwd1">
													<span class="pwd1-msg small text-danger"></span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">비밀번호 확인</th>
												<td>
													<input onKeyup="checkPwd2(this.value)" type="password" 
															class="form-control" name="pwd2" id="pwd2">
													<span class="pwd2-msg small text-danger"></span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">계정상태</th>
												<td>
													<select onKeyup="accStatus(this.value)" class="form-control" aria-label="Default select example">
														<option value="" selected disabled hidden>선택</option>
														<option value="1" name="acc_status" id="acc_status1">정상</option>
														<option value="2" name="acc_status" id="acc_status2">중지</option>
													</select>
													<span class="acc-status-msg small text-danger" style="display: none">계정상태를 선택해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">입사일</th>
												<td>
													<input type="date" class="form-control" name="enroll_date" id="enroll_date">
													<span class="enroll-date-msg small text-danger" style="display: none">입사일을 입력해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">퇴사일</th>
												<td>
													<input type="date" class="form-control" name="resign_date" id="resign_date">
												</td>
											</tr>
											<tr>
												<th class="align-middle">부서</th>
												<td>
													<select id="dept_list" name="dept_list" class="form-control" aria-label="Default select example">
													</select>
													<span class="dept-msg small text-danger" style="display: none">부서를 선택해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">직급</th>
												<td>
													<select id="job_list" name="job_list" class="form-control" aria-label="Default select example">
													</select>
													<span class="job-msg small text-danger" style="display: none">직급을 선택해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">관리자여부</th>
												<td>
													<select class="form-control" aria-label="Default select example">
															<option value="1">Y</option>
															<option value="2">N</option>
													</select>
													<span class="job-msg small text-danger" style="display: none">관리자여부를 선택해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">이메일</th>
												<td>
													<input type="email" class="form-control" name="email" id="email" required>
													<span class="email-msg small text-danger" >이메일을 입력해 주세요.</span>
												</td>
											</tr>
											<tr>
												<th class="align-middle">전화번호</th>
												<td>
												<input type="tel" class="form-control" name="phone" id="phone" placeholder="- 없이 입력" maxlength="11" required>
												<span class="phone-msg small text-danger" >전화번호를 입력해 주세요.</span>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="modal-footer">
										<button class="btn btn-dark" type="button" id="submit_btn"
											data-dismiss="modal">저장</button>
										<button class="btn btn-secondary" type="reset"
											data-dismiss="modal">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


            <!-- Footer -->
                <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
      <i class="fas fa-angle-up"></i>
   </a>
   
<script>

$(".profile_img").on('click', function() {
	$('#profile_img_file').click();
})

// 모달 오픈 시 이벤트
$('#insertEmployee').on('shown.bs.modal', function() {
	getDept();
	getJob();
	// 수정으로 오픈되었을 경우 이벤트
})

function getDept() {
	$.ajax({
		url: "${path}/admin/ajax/getDept",
		success: data => {
			$('#dept_list').empty();
			for (var i = 0; i < data.length; i++) {
				const no = data[i]['no'];
				const title = data[i]['title'];
				const option = $("<option></option>").attr("value", no).text(title);
				$('#dept_list').append(option);
			}
		}
	})
}

function getJob() {
	$.ajax({
		url: "${path}/admin/ajax/getJob",
		success: data => {
			$('#job_list').empty();
			for (var i = 0; i < data.length; i++) {
				const no = data[i]['no'];
				const title = data[i]['title'];
				const option = $("<option></option>").attr("value", no).text(title);
				$('#job_list').append(option);
			}
		}
	})
}

// 저장 버튼 눌렀을 때 값 전체 검사
$("#submit_btn").on('click', function() {
	// 이름
	if(checkId($("#emp_name").val()) == false){
		$("#emp_name").focus();
		return false;
	}
	// 성별
	if (!$('input[name=gender]').is(":checked")){
		$(".gender-msg").show();
		$("#gender1").focus();
		return false;
	} else {
		$(".gender-msg").hide();
	}
	
 	if(checkId($("#emp_id").val()) == false){
		$("#emp_id").focus();
		return false;
	}
	
	if(checkPwd1($("#pwd1").val()) == false){
		$("#pwd1").focus();
		return false;
	}
	
	if(checkPwd2($("#pwd2").val()) == false){
		$("#pwd2").focus();
		return false;
	}
	
	if (!$('select[name=acc_status]').is(":selected")){
		$(".acc-status-msg").show();
		$("#acc_status1").focus();
		return false;
	} else {
		$(".acc-status-msg").hide();
	}
	
/* 	if (!$('select[name=enroll_date]').is(":selected")){
		$(".enroll-date-msg").show();
		$("#enroll_date").focus();
		return false;
	} else {
		$(".enroll-date-msg").hide();
	} */
	

	
});
// 이름 사용 가능 여부 확인
function checkName(str){
	
	let regex = /^[ㄱ-ㅎ|가-힣]{2,}$/;
		if(!regex.test(str)) {
			$('.emp-name-msg').text('2글자 이상 입력해 주세요. (한글만 가능)').show();
			return false;
		} else {
			$('.emp-name-msg').hide();
		}
}


//비밀번호 사용 가능 여부 확인 (keyup, 전체 검사에서도 사용)
function checkPwd1(str){
	// 비밀번호
	var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[a-zA-Z\d!@#$%^&*()_+]{8,16}$/
	if(!regex.test(str)) {
		$('.pwd1-msg').text('8~16글자로 입력해 주세요. (영문, 숫자, 특수문자 포함)').show();
		return false;
	} else {
		$('.pwd1-msg').hide();
	}
}

// 비밀번호 일치 여부 확인 (keyup)
function checkPwd2(str){
	
	if($('#pwd1').val() != str){
		$('.pwd2-msg').removeClass('text-primary').addClass('text-danger').text('비밀번호가 일치하지 않습니다.');
		return false;
	} else {
		$('.pwd2-msg').removeClass('text-danger').addClass('text-primary').text('비밀번호가 일치합니다.');
	}
	
	
}

// 아이디 사용 가능 여부 확인 (keyup , 전체 검사에서도 사용)
function checkId(str){
	// 글자수 검사
	if(str.length < 4 || str.length > 12){
		$('.emp-id-msg').text('아이디는 4~12글자로 입력해 주세요.').show();
		return false;
	} else {
		$('.emp-id-msg').hide();
	}
	// 영문 숫자 검사
	var regex = /^[a-z0-9+]+$/; 
	if(!regex.test(str)) {
		$('.emp-id-msg').text('영소문자와 숫자만 입력해 주세요.').show();
		return false;
	} else {
		$('.emp-id-msg').hide();
	}
	
	// 중복 검사
	$.ajax({
		url: "${path}/admin/ajax/checkDuplicationId",
		data : {
			'id' : str
		},
		success: data => {
			console.log(data);
			
			if(data < 1){ // 중복없음
				$('.emp-id-msg').hide();
			} else { // 중복있음
				$('.emp-id-msg').text('이미 존재하는 아이디입니다.').show();
			}
		}
	});
	
}
</script>
   



</body>

</html>