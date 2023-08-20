<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤드 태그 -->
<div id="headTag">
	<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
</div>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 시작 Sidebar -->
        <div id="sidebar">
           <jsp:include page="/WEB-INF/views/admin/common/admin_sidebar.jsp"/>
           <link href="${pageContext.request.contextPath }/resources/css/yelin.css" rel="stylesheet">
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
                    <h1 class="h3 text-dark my-5">전사원 근태 현황
                  <p class="mt-2 text-secondary" style="font-size:17px">출퇴근 변경</p> 
                    </h1>
                    <div class="adminDayOff-container" > 
                  
                   
    
                    
                    
                    
                    
                  
                    <!-- 사용 내역 테이블 -->
                    <div id="big-table">
                        <table class="table text-center table-sm">
                            <colgroup>
                                <col style="width:130px">
                                <col style="width:100px">
                                <col style="width:130px">
                                <col style="width:130px">
                                <col style="width:130px">
                            </colgroup>
                            <!-- table-active -->
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th>번호</th>
                                    <th>이름</th>
                                    <th>사번</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>조정일</th>
                                    <th>내용</th>
                                    <th>진행상황</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white" id="wk-tbody">
                            <c:if test="${not empty adminWk }">
                            	<c:forEach var="ad" items="${adminWk }">
                             	<tr onclick="workDetail(${ad.wtNo});">
                                    <td>${ad.wtNo }</td>
                                    <td>${ad.emp.name }</td>
                                    <td>${ad.emp.empNum }</td>
                                    <td>${ad.emp.deptTitle }</td>
                                    <td>${ad.emp.jobTitle }</td>
                                    <td>${ad.wtDate }</td>
                                    <td>${ad.reContent }</td>
                                    <td>${ad.appStatus }</td>
                                </tr> 
                                </c:forEach>
                              </c:if>
                            </tbody>
                        </table>
                    </div>
                    
                  	<!-- 페이징 -->
		            <div class="pasing-area">
		            	<c:out value="${pageBar }" escapeXml="false"/>
		            </div>
		            <script>
		            	function workDetail(no){
		            		console.log(no);
		            		$.ajax({
								url:"adminWkDetail",
								data:{
									wtNo:no
								},
							success:function(ad){
								console.log(ad); 
								const input = $("#adWkTable td>input[type=text]");
								const hidden = $("#adWkTable td>input[type=hidden]");
								const textarea =$("<textarea>");
								$(hidden[0]).val(ad[0].wtNo);
								$(hidden[1]).val(ad[0].att.no);
								$(input[0]).val(ad[0].att.attDate);
								$(input[1]).val(ad[0].att.startTime);
								$(input[2]).val(ad[0].att.endTime);
								$(input[3]).val(ad[0].reStartTime);
								$(input[4]).val(ad[0].reEndTime);
								$("#adWkTable td>textarea").html(ad[0].reContent);
								
								const length = ad[0].reContent.length;
								$(".textCount").text(length + '자');	
								$("#adminWkModify").modal("show");
							},
							error:function(){
								console.log("근태 ajax 통신실패");
							}
						})
		            	}
		            </script>
		            <script>
			           $(function(){
			        	   $("#wtSubmit").click(function(){
			        		   
			        		   const input = $("#adWkTable td>input[type=text]");
								const hidden = $("#adWkTable td>input[type=hidden]");
								
			        		   if(confirm("출퇴근 시간변경을 승인하시겠습니까?")){
			        			   location.href='wtModifySubmit?wtNo=' + $("#adWkTable input[name=wtNo]").val()
			        					   + '&reStartTime=' + $("#adWkTable input[name=reStartTime]").val()
			        					   + '&reEndTime=' +$("#adWkTable input[name=reEndTime]").val()
			        					   + '&no=' +$("#adWkTable input[name=attNo]").val();
			        		   }
			        	   })
			           })
		           </script>
		           <script>
			           	$(function(){
			           		$("#wtReturn").click(function(){
			           			if(confirm("출퇴근 시간변경을 반려하시겠습니까?")){
			           				location.href='wtModifyReturn?wtNo=' + $("#adWkTable input[name=wtNo]").val();
			           			}
			           		})
			           	})
		           </script>
		             <!-- 페이징 -->
                        <div class="pasing-area">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center mt-4">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item">
                                    <li class="page-item">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
		            
		            
		            
		            <!-- 출퇴근 시간 변경 Modal -->
        			<div id="adminWorkTime">
                    <div class="modal fade text-center" id="adminWkModify" tabindex="-1" role="dialog"
                        aria-activedescendant="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-dark text-white">
                                    <h5 class="modal-title" id="exampleModalLabel">출퇴근 시간 변경</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <!-- Modal body -->        
                                <div class="modal-body">
                                    <table id="adWkTable" style="width:430px;" class="table table-borderless text-dark">
                                            <colgroup>
                                                <col style="width:40%">
                                                <col style="width:60%">
                                            </colgroup>
                                            <tr>
                                                <th class="align-middle">수정할 날짜</th>
                                                <td class="font-weight-bold">
                                                	<input type="hidden" class="form-control inputSize" name="wtNo">
                                                	<input type="hidden" name="attNo">
                                                	<input type="text" class="form-control inputSize" name="workDate" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">지정 출근 시간</th>
                                                <td class="font-weight-bold">
                                                	<input type="text" class="form-control inputSize" name="workStart" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">지정 퇴근 시간</th>
                                                <td>
                                                    <input type="text" class="form-control inputSize" name="workDate" readonly>
                                                </td>
                                            </tr>
                                            <tr id="adtr">
                                                <th class="align-middle" >수정할 출근 시간</th>
                                                <td>
                                                    <input type="text" class="form-control inputSize" name="reStartTime" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="align-middle">수정할 퇴근 시간</th>
                                                <td>
                                                    <input type="text" class="form-control inputSize" name="reEndTime" readonly>
                                                </td>
                                            </tr>
                                            <tr id="adtr">
                                                <th class="align-middle" id="thwd" >신청 사유</th>
                                            	<td id="adtd">
                                            		<span>/100자</span><span class="textCount font-weight-bold"></span>
                                                    <textarea class="form-control inputSize" name="reContent" rows="3" maxlength="99" style="resize: none;" readonly></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="wtSubmit" class="btn btn-primary">승인</button>
                                    <button type="button" id="wtReturn" class="btn btn-warning">반려</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>        
                    </div>
                </div>
		            
		            
		            
		            
		            
		            
                    </div>
                </div>
                <!-- 수정할 컨테이너 종료 End of Main Content -->
                
               
                
                
                
            </div>
            <!-- Footer -->
            

            <div id="footer">
                <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
            </div>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>

    <!-- 부트스트랩 스크립트 -->
	<div id="bootstrap">
		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
	</div>

</body>

</html>


