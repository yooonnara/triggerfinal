<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="insertEmployee">
	<div class="modal fade text-center" id="insertEmployeeModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">멤버 생성</h5>
					<button class="close text-white" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm" name="frm" class="user" action="${path}/admin/insertEmployee" method="post">
						<table class="table text-dark table-borderless">
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
									<th class="align-middle">사번</th>
									<td><input type="text" class="form-control"
										name="emp_num" id="emp_num" required readonly></td>
								</tr>
								<tr>
									<th class="align-middle">이름(한글)</th>
									<td>
										<input onKeyup="checkName(this.value)" type="text" class="form-control" name="emp_name" id="emp_name" required>
										<span class="check-msg emp-name-msg small text-danger" style="display: none" >이름을 입력해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">성별</th>
									<td class="text-left">
										<input onchange="checkGender(this.value)" type="radio" name="gender" id="gender1" value="M">&nbsp;
										<label for="gender1">남</label>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<input onchange="checkGender(this.value)" type="radio" name="gender" id="gender2" value="F">&nbsp;
										<label for="gender2">여</label><br>
										<span class="check-msg gender-msg small text-danger" style="display: none">성별을 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">아이디</th>
									<td>
										<input type="text" class="form-control" name="emp_id"
											id="emp_id" placeholder="영문, 숫자 4글자 이상" required
											onKeyup="checkId(this.value)">
										<span class="check-msg emp-id-msg small text-danger"></span>
									</td>
								</tr>
								<tr class="password_tr">
									<th class="align-middle">비밀번호</th>
									<td>
										<input onKeyup="checkPwd1(this.value)" type="password" 
												class="form-control" name="pwd1" id="pwd1">
										<span class="check-msg pwd1-msg small text-danger"></span>
									</td>
								</tr>
								<tr class="password_tr">
									<th class="align-middle">비밀번호 확인</th>
									<td>
										<input onKeyup="checkPwd2(this.value)" type="password" 
												class="form-control" name="pwd2" id="pwd2">
										<span class="check-msg pwd2-msg small text-danger"></span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">계정상태</th>
									<td>
										<select id="acc_status" name="acc_status" onclick="checkAccStatus(this.value)" class="form-control" aria-label="Default select example">
											<option value="" selected>선택</option>
											<option value="1">정상</option>
											<option value="2">중지</option>
										</select>
										<span class="check-msg acc-status-msg small text-danger" style="display: none">계정상태를 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">입사일</th>
									<td>
										<input onchange="checkEnrollDate(this.value)" onsubmit="checkEnrollDate(this.value)" type="date" class="form-control" name="enroll_date" id="enroll_date">
										<span class="check-msg enroll-date-msg small text-danger" style="display: none">입사일을 입력해 주세요.</span>
									</td>
								</tr>
								<tr id="resign_date_tr" style="display: none">
									<th class="align-middle">퇴사일</th>
									<td>
										<input type="date" class="form-control" name="resign_date" id="resign_date">
									</td>
								</tr>
								<tr>
									<th class="align-middle">부서</th>
									<td>
										<select onchange="checkDept(this.value)" id="dept" name="dept" class="form-control" aria-label="Default select example">
										</select>
										<span class="check-msg dept-msg small text-danger" style="display: none">부서를 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">직급</th>
									<td>
										<select onchange="checkJob(this.value)" id="job" name="job" class="form-control" aria-label="Default select example">
										</select>
										<span class="check-msg job-msg small text-danger" style="display: none">직급을 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">관리자여부</th>
									<td>
										<select name="acc_type" id="acc_type" onchange="checkAccType(this.value)" class="form-control" aria-label="Default select example">
												<option value="" selected>선택</option>
												<option value="2">Y</option>
												<option value="1">N</option>
										</select>
										<span class="check-msg acc-type-msg small text-danger" style="display: none">관리자여부를 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">이메일</th>
									<td>
										<input onKeyup="checkEmail(this.value)" type="email" class="form-control" name="email" id="email" required>
										<span class="check-msg email-msg small text-danger"></span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">전화번호</th>
									<td>
										<input onKeyup="checkPhone(this.value)" type="text" class="form-control" name="phone" id="phone" placeholder="- 없이 입력" maxlength="11" required>
										<span class="check-msg phone-msg small text-danger"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="modal-footer">
						<button class="btn btn-dark" type="button" onclick="checkInsertFrm()">
							저장
						</button>
						<button class="btn btn-secondary" type="reset" data-dismiss="modal">
							취소
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${path}/resources/js/employee.js"></script>
<script>

$(".profile_img").on('click', function() {
	$('#profile_img_file').click();
})



$("#enroll_date").change(e=>{
	console.log(e);
	console.log(e.target.value)
})


function getDept() {
	$.ajax({
		url: "${path}/admin/ajax/getDept",
		success: data => {
			$('#dept').empty();
			const basicOption = $("<option></option>").attr("value", "selected").text("선택");
			$('#dept').append(basicOption); 
			for (var i = 0; i < data.length; i++) {
				const no = data[i]['no'];
				const title = data[i]['title'];
				const option = $("<option></option>").attr("value", no).text(title);
				$('#dept').append(option);
			}
		}
	})
}

function getJob() {
	$.ajax({
		url: "${path}/admin/ajax/getJob",
		success: data => {
			$('#job').empty();
  			const basicOption = $("<option></option>").attr("value", "selected").text("선택");
			$('#job').append(basicOption); 
			for (var i = 0; i < data.length; i++) {
				const no = data[i]['no'];
				const title = data[i]['title'];
				const option = $("<option></option>").attr("value", no).text(title);
				$('#job').append(option);
			}
		}
	})
}
//저장 버튼 눌렀을 때 값 전체 검사
function checkInsertFrm(){
	// 이름
	if(checkName($("#emp_name").val()) == false){
		$("#emp_name").focus();
		return false;
	}
	
	// 성별
	if(checkGender($("input[name=gender]").val()) == false){
		$("#gender1").focus();
		return false;
	}
	
	// 아이디	
 	if(checkId($("#emp_id").val()) == false){
		$("#emp_id").focus();
		return false;
	}
	
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
	
	// 계정상태 
	if(checkAccStatus($("#acc_status")) == false ){
		$("#acc_status").focus();
		return false;
	}
	
	// 입사일
	if($('#enroll_date').val() == '' || $('#enroll_date').val() == null){
		$("#enroll_date").focus();
		return false;
	}
	
	// 부서
	if(checkDept($("#dept")) == false ){
		$("#dept").focus();
		return false;
	}
	
	// 직급
	if(checkJob($("#job")) == false ){
		$("#job").focus();
		return false;
	}
	
	// 관리자여부
	if(checkAccType($("#acc_type").val()) == false){
		$("#acc_type").focus();
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
		$('#frm').submit();
		
	}
}

</script>
   