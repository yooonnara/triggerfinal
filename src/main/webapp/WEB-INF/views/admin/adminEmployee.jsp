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
            							<c:forEach var="e" items="${employees}" >
		                                    <tr>
		                                        <td class="align-middle"><input type="checkbox" id="employee-check"></td>
<!-- 		                                   		<td>${e.no}</td> -->
		                                   		<td>${pageStartRowNum}</td>
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

            <!-- 멤버생성 모달 -->
			<jsp:include page="/WEB-INF/views/admin/insertMemberModal.jsp"/>
			

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
// 모달 오픈 시 이벤트
$('#insertEmployee').on('shown.bs.modal', function() {
	getDept();
	getJob();
	makeEmpNum();
	$("#emp_name").focus();
	// 수정으로 오픈되었을 경우 이벤트
})
// 모달 클로즈 시 이벤트
$('#insertEmployee').on('hidden.bs.modal', function (event) {
	frmReset(); // 폼 리셋
})

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
function makeEmpNum(){
	$.ajax({
		url: "${path}/admin/ajax/makeEmpNum",
		success: data => {
			$('#emp_num').val(data);
		}
	})
}

function frmReset(){
	$('#frm')[0].reset();
	$('.check-msg').hide();
}

</script>
   



</body>

</html>