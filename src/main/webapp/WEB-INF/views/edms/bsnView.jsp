<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${path }/resources/js/jquery-3.7.0.min.js"></script>
<link href="${path }/resources/css/nara.css" rel="stylesheet">
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
					<h1 class="h3 text-dark mt-5 mb-5">내 정보 수정</h1>

					<div class="mypage-area row mb-3 justify-content-center">
						<div class="mypage-container col-8 d-flex justify-content-center bg-white shadow mb-3">

							<form class="user" name="bsView" action="${path }/selectByNo" >
								<table class="table-sm mt-5 mb-5">
									<tbody class="text-left">
										
										<tr>
											<td>결재번호</td>
											<td><input class="form-control ml-5" type="number" value= "${edms.no }"readonly ></td>
										</tr>
										<tr>
											<td>기안일</td>
											<td><input class="form-control ml-5" type="createDate" value= "${edms.createDate }"readonly ></td>
										</tr>
										<tr>
											<td>사번</td>
											<td>
												<input class="form-control ml-5" type="text" value="${edms.emp.empNum}" readonly>
											</td>
										</tr>
										<tr>
											<td>이름(한글)</td>
											<td>
												<input class="form-control ml-5" type="text" value="${edms.emp.name}" readonly>
											</td>
										</tr>				
										<tr>
											<td>부서</td>
											<td>
											<input class="form-control ml-5" type="text" value="${edms.emp.deptTitle }" readonly>
											</td>
										</tr>
										<tr>
											<td>직급</td>
											<td>
											<input class="form-control ml-5" type="text" name="jobTitle" value="${edms.emp.jobTitle }" readonly>
											</td>
										</tr>

										<tr>
                            <td>제목</td>
                            <td><textarea class="form-control ml-5 mb-1" rows="1" readonly><c:out value="${edms.title }"/> </textarea></td>
                        </tr>
                        
                         <tr>
                        <td>내용</td>
                       <td>
                            <textarea class="form-control ml-5 mb-1" name="content"  rows="4" readonly><c:out value="${edms.content }"/></textarea>
                        </td>
                        </tr>
            
                      <tr>
                        <td>출장/연차 시작일</td>
                        
	                     <td>
	                    <input type="date" class="form-control ml-5 mb-1" name="startDate" value="${edms.startDate }" readonly>   </td>
	                    </tr>
	                       <tr>
	                         <td>출장/연차 종료일</td>
	                               
                             <td> <input type="date" class="form-control ml-5 mb-1" name="endDate" value="${edms.endDate }" readonly></td>
	                            
                            </tr>
                    
                            </tbody> 
								</table>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="submit" id="submit_btn" data-dismiss="modal">
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

<%-- <!-- 폼조회 모달-->
        <div id="viewEdms">
            <div class="modal fade text-center" id="viewEdmsModal" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">전자 결재 조회</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body px-3 py-3">
                            <form class="user">
                                <table class="table text-dark table-borderless">
                                    <tbody class="text-left">
                                        <tr class="text-center">
                                            <td colspan='2'>
                                            <c:if test="${not emty
 									 <tr>
                                        <td class="align-middle">기안일</td>
                                        <td>
                                            <input type="date" class="form-control mr-5 my-1"name="userId" id="" placeholder="" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle">사원번호</td>
                                        <td><input class="form-control ml-5 mb-1" type="text"
                               				value="${loginEmp.no }" placeholder="" readonly></td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle">이름</td>
                                       <td><input class="form-control ml-5 mb-1" type="text"
                            				value="${loginEmp.name }"   placeholder="" readonly></td>
                                    </tr>
                              
                                    <tr>
                                        <td class="align-middle">부서</td>
                                           <td><input class="form-control ml-5 mb-1" type="text"
                             				 value="${loginEmp. }"   placeholder="개발팀" readonly></td>  
                                    </tr>
                                    <tr>
	                                     <td class="align-middle">직급</td>
	                                     <td><input class="form-control ml-5 mb-1" type="text"
	                               			 placeholder="대리" readonly></td>
                               		 </tr>
                               		 <tr>
                                    <td class="from-group align-middle">제목</td> 
                                        <td> <textarea class="form-control mr-5 my-1" name="title" id="" rows="1" placeholder="" readonly><c:out value="${ed.title}</textarea></td>
                                    </tr>
                               		 <tr>
                                    	<td class="from-group align-middle">신청내용</td>
                                       <td><textarea class="form-control mr-5 my-1" name="content" id="" rows="4" placeholder="" readonly></textarea></td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle">출장기간-시작일</td>
                                        <td><input type="date" class="form-control mr-5 my-1" name="startDate" id="" placeholder="" readonly></td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle">출장기간-종료일</td>
                                        <td> <input type="date" class="form-control mr-5 my-1" name="endDate" id="" placeholder="" readonly> </td>
                                    </tr>
                                      <tr>
	                                        <td class="align-middle">첨부파일</td>
	                                        <td> <input type="file" class="form-control mr-5 my-1" name="userId" id="" placeholder="" readonly></td>
                                       </tr>
                                  </table> 
                                 </tbody> 
                                </table>
                            </form>
                        </div>
                        <div class="modal-footer mr-3">  <a class="btn btn-primary" href="#">목록</a>
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
 --%>
         
         
         

</body>

</html>