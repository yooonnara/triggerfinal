<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
            
            
            
            <!-- 수정할 컨테이너 Begin Page Content -->
				<div class="container-fluid pl-5 pr-5">

					<!-- 타이틀 Page Heading -->
					<h1 class="h3 text-dark mt-5 mb-5">출장 신청 내역</h1>

					<div class="mypage-area row mb-3 justify-content-center">
						<div class="mypage-container col-6 d-flex justify-content-center bg-white shadow mb-3 pt-3">

							<form class="user" name="bsView"  >
								<table class="table-sm mt-5 mb-5">
									<tbody class="text-left" id="bsnUpdate">
										
										<tr>
											<td>결재번호</td>
											<td><input class="form-control ml-5" type="number" value= "${edms.no }" readonly ></td>
										</tr>
										<tr>
											<td>기안일</td>
											<td><input class="form-control ml-5" type="createDate" value= "${edms.createDate }" readonly ></td>
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
                            <td>제목</td>
                            <td><textarea class="form-control ml-5 mb-1" rows="1" readonly><c:out value="${edms.title }"/> </textarea></td>
                        </tr>
                        
                         <tr>
                        <td>내용</td>
                       <td>
                            <textarea class="form-control ml-5 mb-1" name="content"  rows="4" readonly><c:out value="${edms.content }"/></textarea>
                        </td>
                        </tr>
            
                      <tr>
                        <td>출장/연차 시작일</td>
                        
	                     <td>
	                    <input type="date" class="form-control ml-5 mb-1" name="startDate" value="${edms.startDate }" readonly>   </td>
	                    </tr>
	                       <tr>
	                         <td>출장/연차 종료일</td>      
                             <td> <input type="date" class="form-control ml-5 mb-1" name="endDate" value="${edms.endDate }" readonly></td>
                            </tr>
                              <tr>
                            	<td>첨부파일</td>
                            	<td>
                            	 <c:if test="${not empty edms.file }">
							      <c:forEach var="f" items="${edms.file }">
							         <button type="button"  class="btn btn-primary ml-5 mb-1" 
							         onclick="fn_fileDownload('${f.originalFilename}','${f.renamedFilename }');">
							           ${f.originalFilename }</button>
							        </c:forEach>
							     </c:if>
							     </td>
							    </tr>
                            </tbody> 
						</table>
						
						<div class="btn-click col text-center pb-5">
                                  <button type="button" class="btn btn-dark" id="vcButton1" onclick="changeResult('${edms.no }',1);">결재승인</button>
                      		 <button type="button" class="btn btn-danger" id="button2" onclick="changeResult('${edms.no }',2);">결재반려</button>
                        <button class="btn btn-secondary" type="button" id="button3" onclick="location.href='${pageContext.request.contextPath }/edms/adminBsn'">취소</button>
                        </div>
						</form>
					</div>
					</div>
			
			      </div>
                  <script>
                  function changeResult(edmsNo,appStatus){
                		location.replace('${pageContext.request.contextPath}/edms/adminBsnView/statuschange?no='+edmsNo+"&appStatus="+appStatus);
                	}
				function fn_fileDownload(oriName,reName){
					location.assign("${pageContext.request.contextPath}/edms/filedownload?oriname="+oriName+"&rename="+reName);
				};
				</script>
           
				<!-- 수정할 컨테이너 종료 End of Main Content -->
            </div>
            
          
            
            
                      <!-- 페이징 -->
                        <div class="pasing-area">
                    	    <c:out value="${pageBar }" escapeXml="false"/>
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


