<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- 헤드 태그 -->
<div id="headTag">
	<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
</div>
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
        <h1 class="h3 text-dark mt-5 mb-5">연차신청하기</h1>

        <div class="vcRequest-area row mt-6 mb-6">
            <div class="mypage-container col-12 d-flex justify-content-center">

                <form class="vc shadow px-5 py-5" name="vcInsertForm" id="alarm" action="${pageContext.request.contextPath }/edms/insertVc" method="post" onsubmit="return validateForm();">
					
                    <table class="table-sm ml-1 mr-5">
                    <input type="hidden" name="type" value="0"/>
					<!--  <input type="hidden" name="detailType" value=""/>-->
                      
                      	<tr>
                            <td>번호</td>
                            <td><input class="form-control ml-5 mb-1" type="number"
                               value="${loginEmp.no }" name="empNo" placeholder="" readonly ></td>
                        </tr>
                        <tr>
                            <td>이름(한글)</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                              value="${loginEmp.name }"  placeholder="" readonly></td>
                        </tr>              
                        <tr>
                            <td>직급</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                               value="${loginEmp.jobTitle }" placeholder="" readonly>
                                <input type="hidden" name="jobNo" value="${loginEmp.jobNo }"/></td>
                        </tr>
                        <tr>
                            <td>부서</td>
                            <td><input class="form-control ml-5 mb-1" type="text"
                               value="${loginEmp.deptTitle }" placeholder="" readonly>
                                 <input type="hidden" name="deptNo" value="${loginEmp.deptNo }"/></td>
                                 
                        </tr>
                        <tr>
                            <td>연차 구분</td>
                            <td> 
                           	 <select name="detailType" id="detailType" class="custom-select ml-5 mb-1 col-sm-12">
                                <option selected>연차 종류를 선택하세요</option>
                                <option  value="결혼">연차-결혼</option>
                                <option value="휴가">연차-휴가</option>
                                <option  value="조의">연차-조의</option>
                              </select>
                        </tr>
                         <tr>
                            <td>제목</td>
                            <td><textarea class="form-control ml-5 mb-1" name="title" id="title" rows="1"></textarea></td>
                        </tr>
                         <tr>
                        <td>신청 내용</td>
                       <td>
                            <textarea class="form-control ml-5 mb-1" name="content" id="content" rows="4"></textarea>
                        </td>
                        </tr>
            
                      <tr>
                        <td>연차시작날짜</td>
	                     <td>
	                    	<input type="date" class="form-control ml-5 mb-1" name="startDate" id="startDate" >   
	                    </td>
	                  </tr>
	                    <tr>
	                        <td class="align-middle">연차끝날짜</td> 
                             <td> <input type="date" class="form-control ml-5 mb-1" name="endDate" id="endDate" ></td>
                        </tr>    
                    </table>
   							<div class="req-btn d-flex justify-content-around pt-5  id="notice" >
                        <!-- <button class="align-text-bottom btn btn-primary " onclick="location.assign('{path}/edms/bsnView)';">등록</button> -->
                        <input type="submit" class="align-text-bottom btn btn-primary"  onsubmit="vcInsert();" value="등록">
                    </div>
                </form>
            </div>
        </div>
        

      <!-- 수정할 컨테이너 종료 End of Main Content -->
         </div>
<script>


function validateForm() {
    var inputs = document.querySelectorAll('.vc input[type="text"], .vc textarea');
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].value.trim() === '') {
            alert("모든 문항을 작성해주세요.");
            return false; // 폼 제출 중단
        }
    }
    return true; // 모든 필드가 작성되었으므로 폼 제출 진행
}


const startDateInput = document.querySelector('[name="startDate"]');
const endDateInput = document.querySelector('[name="endDate"]');


startDateInput.addEventListener('change', () => {
    // Ensure that the endDate cannot be earlier than startDate
   // console.log(new Date,new Date(startDateInput.value),)
   //const startDate=new Date();
    if (new Date()>new Date(startDateInput.value)||new Date(endDateInput.value) < new Date(startDateInput.value)){
   		alert ("시작일은 오늘 이전이거나 종료일 이후일 수 없습니다.");
        startDateInput.value="";
    }
});

endDateInput.addEventListener('change', () => {
    // Ensure that the endDate cannot be earlier than startDate
    if (new Date()>new Date(endDateInput.value)||new Date(startDateInput.value) > new Date(endDateInput.value)) {
       alert("종료일은 오늘 이전이거나 시작일 이전일 수없습니다.");
    	endDateInput.value = "";
    }  
});
</script>

         <!-- Footer -->
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
         <!-- End of Footer -->

      </div>
      <!-- End of Content Wrapper -->

   </div>
   <!-- End of Page Wrapper -->
</div>
   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
      <i class="fas fa-angle-up"></i>
   </a>
   

</body>

</html>