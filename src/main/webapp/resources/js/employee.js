// 이름 사용 가능 여부
function checkName(str){
	let regex = /^[ㄱ-ㅎ|가-힣]{2,}$/;
	if(!regex.test(str)) {
		$('.emp-name-msg').text('2글자 이상 입력하세요. (한글만 가능)').show();
		return false;
	} else {
		$('.emp-name-msg').hide();
	}
}

function checkName(str){
	let regex = /^[ㄱ-ㅎ|가-힣]{2,}$/;
	if(!regex.test(str)) {
		$('.emp-name-msg').text('2글자 이상 입력하세요. (한글만 가능)').show();
		return false;
	} else {
		$('.emp-name-msg').hide();
	}
}

// 아이디 사용 가능 여부 확인
function checkId(str){
	var regex = /^[a-z0-9+]{4,12}$/; 
	if(!regex.test(str)) {
		$('.emp-id-msg').text('4~12글자로 입력하세요. (영소문자, 숫자만 가능)').show();
		return false;
	} else {
		$('.emp-id-msg').hide();
	}
	
	// 아이디 중복 검사
	$.ajax({
		url: "/admin/ajax/checkDuplicationId",
		data : {
			'id' : str
		},
		success: data => {
			if(data < 1){ // 중복없음
				$('.emp-id-msg').hide();
			} else { // 중복있음
				$('.emp-id-msg').text('이미 존재하는 아이디입니다.').show();
			}
		}
	});
	
}

// 현재 비밀번호와 일치 여부 확인 (비밀번호 변경 시)
function checkCpwd(password){
	if(password != ''){
		$.ajax({
			url: "/ajax/checkPassword",
			type : "post",
			data : {
				'password' : password
			},
			success: data => {
				if(data < 1){ // 현재 비밀번호 같지않음
					$('.cPwd-msg').text('비밀번호를 확인해 주세요.').show();
					return false;
				} else { // 같음
					$('.cPwd-msg').hide();
				}
			}
		});
		
	}
	
	
	return ;
	
}




// 비밀번호 사용 가능 여부
function checkPwd1(str){
	let regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[a-zA-Z\d!@#$%^&*()_+]{8,16}$/
	if(!regex.test(str)) {
		$('.pwd1-msg').text('8~16글자로 입력하세요. (영문, 숫자, 특수문자 포함)').show();
		return false;
	} else {
		$('.pwd1-msg').hide();
	}
}

// 비밀번호 일치 여부 확인
function checkPwd2(str){
	if(str != ''){
		if($('#pwd1').val() != str){
			$('.pwd2-msg').removeClass('text-primary').addClass('text-danger').text('비밀번호가 일치하지 않습니다.');
			return false;
		} else {
			$('.pwd2-msg').removeClass('text-danger').addClass('text-primary').text('비밀번호가 일치합니다.');
		}
	}
}

// 성별
function checkGender(str){
	if (!$('input[name=gender]').is(":checked")){
		$(".gender-msg").show();
		$("#gender1").focus();
		return false;
	} else {
		$(".gender-msg").hide();
	}
}

// 계정상태
function checkAccStatus(str){
	if ($('#acc_status').val() == ''){
		$(".acc-status-msg").show();
		$("#acc_status1").focus();
		return false;
	} else {
		$(".acc-status-msg").hide();
	}
}

// 입사일
function checkEnrollDate(str){
	if ($('#enroll_date').val() == ''){
		$(".enroll-date-msg").show();
		$("#enroll_date").focus();
		return false;
	} else {
		$(".enroll-date-msg").hide();
	}
}


// 부서
function checkDept(str){
	if ($('#dept').val() == ''){
		$(".dept-msg").show();
		$("#dept").focus();
		return false;
	} else {
		$(".dept-msg").hide();
	}
}

// 직급
function checkJob(str){
	if ($('#job').val() == ''){
		$(".job-msg").show();
		$("#job").focus();
		return false;
	} else {
		$(".job-msg").hide();
	}
}

// 관리자여부
function checkAccType(str){
	if ($("#acc_type").val() == ''){
		$(".acc-type-msg").show();
		$("#acc_type").focus();
		return false;
	} else {
		$(".acc-type-msg").hide();
	}
}

// 이메일
function checkEmail(str){
	let regex = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/; 
	if(!regex.test(str)) {
		$('.email-msg').text('이메일을 입력하세요. (abc@join.com)').show();
		return false;
	} else {
		$('.email-msg').hide();
	}
}

// 전화번호
function checkPhone(str){
	let regex = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/; 
	if(!regex.test(str)) {
		$('.phone-msg').text('전화번호를 입력하세요. (-없이)').show();
		return false;
	} else {
		$('.phone-msg').hide();
	}
}