<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/resources/css/nara.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
<c:set var="keyfield" value="${param.keyfield}" />
<c:set var="keyword" value="${param.keyword}" />
<c:set var="searchAccStatus" value="${param.searchAccStatus}" />
<c:set var="searchAccType" value="${param.searchAccType}" />
<c:set var="baseUrl" value="${pageContext.request.contextPath}/adminEmployee?keyfield=${keyfield}&keyword=${keyword}&cPage=${cPage}" />
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
                <h1 class="h3 text-dark mt-5 mb-5">사원 통합관리</h1>

                    <div class="notice-container">

                         <!-- 검색창 & 작성하기 영역 -->
                         <div class="search-write-area row mb-3">
                            <!-- 검색창 -->
                            <div class="search-area float-start col-8">
                                <form action="" method="get" id=searchForm>
                                <input type="hidden" id="searchAccStatus" name="searchAccStatus" value="${searchAccStatus}">
                                <input type="hidden" id="searchAccType" name="searchAccType" value="${searchAccType}">
                                    <div class="search-area d-flex">
                                        <select name="keyfield" aria-label="Default select example" class="mr-1">
                                            <option value="">선택</option>
                                            <option <c:if test="${keyfield == 'emp_name'}">selected</c:if> value="emp_name">이름</option>
                                            <option <c:if test="${keyfield == 'dept'}">selected</c:if> value="dept">부서</option>
                                            <option <c:if test="${keyfield == 'job'}">selected</c:if> value="job">직급</option>
                                            <option <c:if test="${keyfield == 'gender'}">selected</c:if> value="gender">성별</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1" value="${keyword}">
                                        <button type="submit" class="btn btn-dark btn-sm ">검색</button>
                                    </div>
                                </form>
                            </div>
                            <!-- 작성하기 버튼 -->
                            <div class="btn-employee wirte-area col-4">
                                <a href="#" class="btn btn-dark btn-sm float-right" name="delete-btn" 
                                	onclick="deleteEmployee()">사원삭제
                                </a>
                                <a href="#" data-toggle="modal" data-target="#insertEmployeeModal"
                               		 class="btn btn-dark btn-sm mr-1 float-right">사원생성
                                </a>
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
                                        <th class="align-middle"><input type="checkbox" id="chkAll" name="chkAll"></th>
                                        <th class="align-middle">번호</th>
                                        <th class="align-middle">이름</th>
                                        <th class="align-middle">부서</th>
                                        <th class="align-middle">직급</th>
                                        <th class="align-middle">성별</th>
                                        <th class="align-middle">전화번호</th>
                                        <th class="align-middle">이메일</th>
                                        <th class="align-middle">
                                        	<div class="btn-group">
											  <button class="btn btn-dark dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
											  	<b>계정상태</b>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="javascript:dropdownSearch('searchAccStatus', '')">전체</a></li>
											    <li><a href="javascript:dropdownSearch('searchAccStatus', 1)">정상</a></li>
											    <li><a href="javascript:dropdownSearch('searchAccStatus', 2)">중지</a></li>
											  </ul>
											</div>
                                        </th>
                                        <th class="align-middle">
                                        	<div class="btn-group">
											  <button class="btn btn-dark dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
											  	<b>관리자여부</b>
											  </button>
											  <ul class="dropdown-menu">
											    <li><a href="javascript:dropdownSearch('searchAccType', '')">전체</a></li>
											    <li><a href="javascript:dropdownSearch('searchAccType', 2)">Y</a></li>
											    <li><a href="javascript:dropdownSearch('searchAccType', 1)">N</a></li>
											  </ul>
											</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                               		<c:if test="${not empty employees}">
            							<c:forEach var="e" items="${employees}" >
		                                    <tr>
		                                        <td class="align-middle"><input type="checkbox" name="chk" value="${e.no }"></td>
		                                   		<td>${pageStartRowNum}</td>
		                                        <td>
		                                        	<a href="#" data-toggle="modal" data-target="#insertEmployeeModal" class="update-modal"
			                                        	data-empno="${e.no}" data-empnum="${e.empNum}" data-empname="${e.name}" data-gender="${e.gender}"
			                                        	data-empid="${e.id}" data-accstatus="${e.accStatus}" data-enrolldate="${e.enrollDate}"
			                                        	data-resigndate="${e.resignDate}" data-dept="${e.deptNo}" data-job="${e.jobNo}"
			                                        	data-acctype="${e.type}" data-phone="${e.phone}" data-email="${e.email}" data-empimg="${e.empImg}">
		                                        		${e.name}
		                                        	</a>
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
        											<c:if test="${e.accStatus == 2 }">중지</c:if> 
		                                        </td>
		                                        <td>
		                                        	<c:if test="${e.type == 1 }">N</c:if>
      												<c:if test="${e.type == 2 }">Y</c:if>
		                                        </td>
		                                    </tr>
		                                    <c:set var="pageStartRowNum" value="${pageStartRowNum-1}" ></c:set>
	                                	</c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <!-- 페이징 -->
                        <div class="pasing-area">
                    	    <c:out value="${pageBar }" escapeXml="false"/>
                        </div>
                    </div>
                </div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->

            </div>

            <!-- 사원생성 모달 -->
			<jsp:include page="/WEB-INF/views/admin/insertEmployeeModal.jsp"/>
			

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
var is_update = false;

// 체크박스
$(function() {
	$("#chkAll").click(function() {
		if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
	
	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#chkAll").prop("checked", false);
		else $("#chkAll").prop("checked", true); 
	});
});


// 선택삭제
function deleteEmployee(){
	if(confirm("선택한 사원을 삭제하시겠습니까?")){
		var empList = [];
		$("td>input[type=checkbox]:checked").each(function(){
			var chk = $(this).val(); //사용자가 선택한 버튼의 no값이 ck에 담기도록 반복문을 돌린다. 
			empList.push(chk); //배열에 추가해주고 값을 넘긴다.
		});
		console.log(empList);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/ajax/deleteEmployee",
			type : 'post',
			data:{
				empList : empList
			},
			success:function(result){
				if (result > 0) {
	                alert("사원이 삭제되었습니다.");
					location.replace("/admin/adminEmployee");
				}else {
	                alert("삭제에 실패했습니다. 다시 시도해 주세요.");
	            }
	        },
			error:function(){
				alert("오류가 발생했습니다. 다시 시도해 주세요.");
			}
		})
		
	}
}

function dropdownSearch(searchId, value){
	$('#'+searchId).val(value);
	$('#searchForm').submit();
}


// 모달 오픈 시 이벤트
$('#insertEmployee').on('shown.bs.modal', function(e) {
	
	// 수정으로 오픈되었을 경우 이벤트
	var button = $(e.relatedTarget); // 누른 버튼
	var empno = button.data('empno'); 
	if(empno != null && empno != undefined){ // 수정
		is_update = true;
		$('#empModalTitle').text('사원 수정');
		$('#resign_date_tr').show();
		
		var empnum = button.data('empnum');
		$('#emp_num').val(empnum);
		
		var empname = button.data('empname');
		$('#emp_name').val(empname);
		
		$('.password_tr').hide();
		
		var gender = button.data('gender');
		if(gender == 'M' ) {
			$('#gender1').prop('checked', true);
			} else {
				$('#gender2').prop('checked', true);
			}
		
		var empid = button.data('empid');
		$('#emp_id').val(empid).prop("readonly",true)
		$('#emp_id').val(empid);
		
		var accstatus = button.data('accstatus');
		$("#acc_status").val(accstatus).prop("selected", true);
		
		var enrolldate = button.data('enrolldate');
		$("#enroll_date").val(enrolldate);
		
		var resigndate = button.data('resigndate');
		if (resigndate != null){
			$("#resign_date").val(resigndate);
		}

		var dept = button.data('dept');
		getDept(dept);
		
		var job = button.data('job');
		getJob(job);
		
		var acctype = button.data('acctype');
		$("#acc_type").val(acctype);
		
		var phone = button.data('phone');
		$('#phone').val(phone);
		
		var email = button.data('email');
		$('#email').val(email);
		
  		var empimg = button.data('empimg');
  		if(empimg != null && empimg != ''){
			$('#profileImg').attr('src','${pageContext.request.contextPath}/resources/upload/employee/'+empimg);
			$('#oldImg').val(empimg);
  		}
  		
		
	} else { // 생성
		is_update = false;
		$('#empModalTitle').text('사원 생성');
		getDept(null);
		getJob(null);
		$('#resign_date_tr').hide();
		makeEmpNum();
		$("#emp_name").focus();
	}
})

// 모달 클로즈 시 이벤트
$('#insertEmployee').on('hidden.bs.modal', function (event) {
	frmReset(); // 폼 리셋
});

$(".profile_img").on('click', function() {
	$('#profile_img_file').click();
})

$("#enroll_date").change(e=>{
	console.log(e);
	console.log(e.target.value)
})


function getDept(deptNo) {
    $.ajax({
        url: "${pageContext.request.contextPath}/admin/ajax/getDept",
        success: data => {
            $('#dept').empty();
            const basicOption = $("<option></option>").attr("value", "").text("선택");
            $('#dept').append(basicOption); 
            for (var i = 0; i < data.length; i++) {
                const no = data[i]['no'];
                const title = data[i]['title'];
                let option = $("<option></option>").attr("value", no).text(title);
                if (deptNo != null && parseInt(deptNo) == parseInt(no)) {
                    option = $("<option selected='true'></option>").attr("value", no).text(title);
                }
                $('#dept').append(option);
            }
        }
    })
}


function getJob(jobNo) {
    $.ajax({
        url: "${pageContext.request.contextPath}/admin/ajax/getJob",
        success: data => {
            $('#job').empty();
            const basicOption = $("<option></option>").attr("value", "").text("선택");
            $('#job').append(basicOption); 
            for (var i = 0; i < data.length; i++) {
                const no = data[i]['no'];
                const title = data[i]['title'];
                let option = $("<option></option>").attr("value", no).text(title);
                if (jobNo != null && parseInt(jobNo) == parseInt(no)) {
                    option = $("<option selected='true'></option>").attr("value", no).text(title);
                }
                $('#job').append(option);
            }
        }
    })
}

// 사번 자동생성
function makeEmpNum(){
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/ajax/makeEmpNum",
		success: data => {
			$('#emp_num').val(data);
		}
	})
}

function frmReset(){
	$('#frm')[0].reset();
	$('.check-msg').hide();
	$('#profileImg').attr('src','${pageContext.request.contextPath}/resources/img/user_profile.png');
	$('#emp_id').prop("readonly", false); 
}

</script>
   



</body>

</html>