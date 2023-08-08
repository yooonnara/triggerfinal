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
			<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
			<link href="${page }/resources/css/yelin.css" rel="stylesheet">
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
				<div class="container-fluid">
                    <!-- 타이틀 Page Heading -->
                    <h1 class="h3 text-dark mt-5 ml-1 mb-5">출장 현황</h1>

                    <div class="businessTripList-container "> <!-- ex) board-container 등으로 클래스 이름 수정하고 작업하기 -->
                        <!-- 출장신청 개수 -->
                        <div class="row justify-content-between">
                        	<p class="ml-2 col-3 float-left">출장신청
                        		<strong style="color:blue"> ${count} </strong>
                        	</p>
	                        <div class="btn-member float-right mr-3">
	                        	<button class="btn btn-primary btn-sm" id="cbtn" onclick="checkCancel();">취소 내역 확인하기</button>
	                        </div>
                        </div>
                    </div>
                        <!-- 사용 내역 테이블 -->
                        <table class="table text-center shadow table-sm">
                            <colgroup>
                                <col style="width:70px">
                                <col style="width:70px">
                                <col style="width:80px">
                                <col style="width:120px">
                                <col style="width:120px">
                                <col style="width:80px">
                                <col style="width:100px">
                            </colgroup>
                            <thead class="bg-primary">
                                <tr>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>신청일</th>
                                    <th>출장 기간</th>
                                    <th>제목</th>
                                    <th>진행상황</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="bg-white" id="bt-tbody">
                            <c:if test="${not empty edms }">
                            	<c:forEach var="e" items="${edms }">
                                <tr>
                                    <td>${e.emp.name }</td>
                                    <td>${e.emp.deptTitle }</td>
                                    <td>${e.createDate }</td>
                                    <td>${e.startDate} ~ ${e.endDate}</td>
                                    <td>${e.title }</td>
                                    <td>
                                    	<c:if test="${e.appStatus == '0'}">결재 대기</c:if>
                                    	<c:if test="${e.appStatus == '1'}">승인</c:if>
                                    	<c:if test="${e.appStatus == '2'}">반려</c:if>
                                    </td>
                                    <c:if test="${e.appStatus == '0' }">
                                    <td>
                                    <a href="#" data-toggle="modal" class="btn btn-sm border-warning" 
                                    id="ccbtn" onclick="cancelBtn(${e.no});"> 취소 </a>
                                    </td>
                                    </c:if>
                                    <c:if test="${e.appStatus != '0' }">
                                    <td></td>
                                    </c:if>
                                </tr>
                                </c:forEach>
                           	</c:if>     
                            </tbody>
                        </table>
                </div>
                <script>
                	function cancelBtn(no){
                		if(confirm("출장신청을 삭제하시겠습니까?")){
                			console.log(no);
                			location.href = '/deleteBT?btNo=' + no;
                		}
                	}
                	
                	$(document).ready(function(){
                		$("#cbtn").click(function(){
                			$(this).text('승인 신청 조회');
                		})
                		$.ajax({
                			url:"/businessTripList",
                			
                			
                		})
                	})
                	
                	function checkCancel(){
                		$.ajax({
                			url:"/checkCancelList",
                			success:function(d){
                				console.log(d);
                				$("#bt-tbody").html("");
                				for(let i=0;i<d.length;i++){
                					const $tr = $("<tr>");
                					const $td = $("<td>");
                					const $name = $("<td>").text(d[i]["emp"]["name"]);
                					const $deptTitle = $("<td>").text(d[i]["emp"]["deptTitle"]);
                					const $createDate = $("<td>").text(d[i]["createDate"]);
                					const $startDate = $("<td>").text(d[i]["startDate"]).text(d[i]["endDate"]);
                					const $title = $("<td>").text(d[i]["title"]);
                					const $appStatus = $("<td>").text("취소");
                					
                					$tr.append($name).append($deptTitle).append($createDate).append($startDate).append($title).append($appStatus).append($td);
                					
                					$("#bt-tbody").append($tr);
                				}
                			},
                			error:function(){
                				console.log("ajax 통신 실패");
                			}
                		})
                	}
                </script>
				<!-- 수정할 컨테이너 종료 End of Main Content -->
				<!-- 출장신청 삭제 모달-->
                <!-- <div id="cancel-businessTrip">
                    <div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <p><br>출장신청을 삭제하시겠습니까?<br></p>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-primary">확인</a>
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
			</div>


			<!-- Footer -->
			<div id="footer">
				<jsp:include page="/WEB-INF/views/common/footer.jsp" />
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