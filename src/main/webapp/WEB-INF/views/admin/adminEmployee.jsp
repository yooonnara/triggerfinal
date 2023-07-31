<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                                            <option selected value="emp_name">이름</option>
                                            <option value="dept">부서</option>
                                            <option value="job">직급</option>
                                            <option value="gender">성별</option>
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
                                    <col width="5%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="6%" />
                                    <col width="15%" />
                                    <col width="17%" />
                                    <col width="10%" />
                                    <col width="12%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th class="align-middle"><input type="checkbox" id="employee-check"></th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>성별</th>
                                        <th>전화번호</th>
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
		                                        	<a href="#" data-toggle="modal" data-target="#updateEmployeeModal">${e.name}</a>
		                                        </td>
		                                        <td>${e.deptTitle}</td>
		                                        <td>${e.jobTitle}</td>
		                                        <td>
		                                        	<c:if test="${e.gender == 'M' }">남</c:if>
      												<c:if test="${e.gender == 'F' }">여</c:if>
		                                        </td>
		                                        <td>${e.phone}</td>
		                                        <td>${e.email}</td>
		                                        <td>
													<c:if test="${e.accStatus == 1 }">정상</c:if>
        											<c:if test="${e.accStatus > 1 }">중지</c:if> 
		                                        </td>
		                                        <td>
		                                        	<c:if test="${e.type == 1 }">N</c:if>
      												<c:if test="${e.type > 1 }">Y</c:if>
		                                        </td>
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

            <!-- 멤버생성 모달 -->
			<jsp:include page="/WEB-INF/views/admin/insertMemberModal.jsp"/>
			
			<!-- 멤버수정 모달, 이름 클릭 시 -->
			<jsp:include page="/WEB-INF/views/admin/updateMemberModal.jsp"/>


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

// 저장 버튼 눌렀을 때 값 전체 검사
$("#submit_btn").on('click', function() {
	
	// 이름
	if(checkName($("#emp_name").val()) == false){
		$("#emp_name").focus();
		return false;
	}
	
	// 성별
	if(checkGender($("#gender1"||"#gender2").val()) == false){
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
	if(checkAccStatus($("#acc_status1"||"#acc_status2").val()) == false){
		$("#acc_status1").focus();
		return false;
	}
	
	// 입사일
	
	// 퇴사일
	
	// 부서
	
	// 직급
	
	// 관리자여부
	if(checkAccType($("#acc_type1"||"#acc_type2").val()) == false){
		$("#acc_type1").focus();
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

	function getAge() {
		var age = $('#age').val();	
		var address = $('#address').val();	
		$.ajax({
			url: "${pageContext.request.contextPath}/ajax/memberAge",
			data: {"age": age, "address":address},
			success: data=>{
				console.log(data);
			}
		});
	}
	
	//멤버생성 모달

	/* function insertEmployee(){
		$.ajax({
				url: "${path}/ajax/insertEmployee",
			    type: "POST",
			    data: {
			    	$('#frm's).serialize()
			    },
				success: data => {
			        console.log("성공!!!")
				}
		});
	} */
	
});



// keyup

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
		url: "${path}/admin/ajax/checkDuplicationId",
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
	if($('#pwd1').val() != str){
		$('.pwd2-msg').removeClass('text-primary').addClass('text-danger').text('비밀번호가 일치하지 않습니다.');
		return false;
	} else {
		$('.pwd2-msg').removeClass('text-danger').addClass('text-primary').text('비밀번호가 일치합니다.');
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
	if (!$('option[name=acc_status]').is(":selected")){
		$(".acc-status-msg").show();
		$("#acc_status1").focus();
		return false;
	} else {
		$(".acc-status-msg").hide();
	}
}

//입사일

// 퇴사일

// 부서
/* function checkDept(str){
	if (!$('option').is(":checked")){
		$(".dept-msg").show();
		$('select').focus();
		return false;
	} else {
		$(".dept-msg").hide();
	}
} */

// 직급

// 관리자여부
function checkAccType(str){
	if (!$('option[name=acc_type]').is(":selected")){
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


	
</script>
   



</body>

</html>