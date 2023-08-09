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

                <!-- 타이틀 Page Heading -->
                <h1 class="h3 text-dark mt-5 mb-5">출장관리</h1>

                <div class="edms-container">

                    <!-- 검색창 & 작성하기 영역 -->
                    <div class="search-write-area row mb-3">
                        <!-- 검색창 -->
                        <div class="search-area float-start col-8">
                            <form name="search-form">
                                <div class="search-area d-flex" >
                                    <select name="category" aria-label="Default select example" class="mr-1">
                                        <option selected value="all">전체</option>
                                        <option value="name">이름</option>
                                        <option value="title">부서</option>
                                        <option value="job">직급</option>
                                    </select>
                                    <input type="text" name="keyword" value="" placeholder="검색어를 입력해 주세요" class="mr-1"></input>
                                  <input type="button" onclick="search()" class="btn btn-dark btn-sm "  value="검색"></input>                              </div>
                            </form>
                        </div>
                        
                        <script>
                        function search(){
                        	$.ajax({  		
                        		url : "${pageContext.request.contextPath}/edms/adminBsn/search",
                        		data : $("form[name=search-form]").serialize(),
                        		 success:function(d){
             		            	$("#edms-sts").html(""); //리셋
             		            	console.log(d);
             		            	for(let i=0; i<d.length;i++){
             		            		const $tr=$("<tr>");
             		            		const $no=$("<td>").text(d[i]["no"]);
             		            		const $createDate=$("<td>").text(d[i]["createDate"]);
             		            		const $deptTitle=$("<td>").text(d[i]['emp']["deptTitle"]);
             		            		const $jobTitle=$("<td>").text(d[i]['emp']["jobTitle"]);
             		            		const $name=$("<td>").text(d[i]['emp']["name"]);
             		            		const $title=$("<td>").text(d[i]["title"]);
             		            		let type="";
             		            		switch(d[i]["type"]){
             		            			case 0:type="연차";break;
             		            			case 1:type="출장";break;			
             		            		}
             		            		const $type=$("<td>").text(type);
             		            		
             		            		let appStatus="";
             		            		switch(d[i]["appStatus"]){
             		            		case -1 :appStatus="전체";break;
             		            		case 0 :appStatus="대기";break;
             		            		case 1 :appStatus="승인";break;
             		            		case 2:appStatus="반려";break;
             		            		}
             		            		const $appStatus=$("<td>").text(appStatus);						            	
             							$tr.append($no).append($createDate).append($deptTitle).append($jobTitle)
             							.append($name).append($title).append($type).append($appStatus);
             							$("#edms-sts").append($tr);
             		            	}
             		            },
             		            	
             		            error:function(){
             		           		console.log("ajax 통신시실패");
             		           	}
             		            
             		           })
             				};
                        </script>
                     
                        <div class="btn-member col-4 " id="btnAll">
                                     <button  type="button" name="options" id="btn1" class="btn btn-dark btn-sm  ml-1 float-right" value="-1">전체</button>
                                      <button type="button" name="options" id="btn2" class="btn btn-outline-dark btn-sm ml-1 float-right" value="0">대기</button>
                                       <button  type="button" name="options" id="btn3" class="btn btn-outline-dark btn-sm ml-1 float-right" value="1">승인</button>
                                      <button  type="button" name="options" id="btn4" class="btn btn-outline-dark btn-sm ml-1 float-right" value="2">반려</button>
                                </div>
                            </div>
                       
                    <div class="board-container">
                        <table class="table table-sm shadow table-hover text-center">

                            <!-- 테이블 칸 크기 -->
                            <colgroup>
                                  <col width="10%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                     <col width="10%" />
                                    <col width="10%" />
                                    <col width="15%" />
                                    <col width="10%" />
                                    <col width="15%" />
                            </colgroup>
						
                            <thead>
                                <tr class="bg-dark text-white">
                                    <th>번호</th>
                                    <th>기안일</th>
                                    <th>부서</th>
                                    <th>직급</th>
                                    <th>이름</th>
                                    <th>제목</th>
                                    <th>구분</th>
                                    <th>결재상태</th>
                                </tr>
                            </thead>
                            <tbody id="edms-sts">
                            <c:if test="${not empty edms}">
                            <c:forEach var="a" items="${edms}">
                                <tr>
                                	<td>${a.no }</td>
                                    <td>${a.createDate }</td> 
                                    <td>${a.emp.deptTitle }</td>
                                    <td>${a.emp.jobTitle }</td>
                                    <td>${a.emp.name }</td>
                                    <td>${a.title }</td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${a.type==0 }">연차</c:when>
                                    	<c:when test="${a.type==1 }">출장</c:when>
                                    	<c:otherwise>미정</c:otherwise>
                                    </c:choose>
                                    </td>
                                  <td >
                                  <a href="/edms/adminBnsView?no=${a.no}" > 
                                  	<c:if test="${a.appStatus==0 }">결재대기</c:if>
                                  	<c:if test="${a.appStatus==1 }">승인</c:if>
                                  	<c:if test="${a.appStatus==2 }">반려</c:if>
                                  </a>
                               </td>                                 
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
 <script>
	//function btnFnc(){
		 $("#btnAll button").click(e=>{
			 $.ajax ({
		            url:"${pageContext.request.contextPath}/edms/adminBsn/select",
		            data: {"searchNum":e.target.value},
		            success:function(f){
		            	$("#edms-sts").html(""); //리셋
		            	console.log(e.target.value);
		            	console.log(f);
		            	for(let i=0; i<f.length;i++){
		            		const $tr=$("<tr>");
		            		const $no=$("<td>").text(f[i]["no"]);
		            		const $createDate=$("<td>").text(f[i]["createDate"]);
		            		const $deptTitle=$("<td>").text(f[i]['emp']["deptTitle"]);
		            		const $jobTitle=$("<td>").text(f[i]['emp']["jobTitle"]);
		            		const $name=$("<td>").text(f[i]['emp']["name"]);
		            		const $title=$("<td>").text(f[i]["title"]);
		            		let type="";
		            		switch(f[i]["type"]){
		            			case 0:type="연차";break;
		            			case 1:type="출장";break;			
		            		}
		            		const $type=$("<td>").text(type);
		            		
		            		let appStatus="";
		            		switch(f[i]["appStatus"]){
		            		//case -1 :appStatus="전체";break;
		            		case 0 :appStatus="대기";break;
		            		case 1 :appStatus="승인";break;
		            		case 2:appStatus="반려";break;
		            		}
		            		const $appStatus=$("<td>").text(appStatus);						            	
							$tr.append($no).append($createDate).append($deptTitle).append($jobTitle)
							.append($name).append($title).append($type).append($appStatus);
							$("#edms-sts").append($tr);
		            	}
		            },
		            	
		            error:function(){
		           		console.log("ajax 통신시실패");
		           	}
		            
		           })
				});
	//}
</script>
                        
                        
    <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top" style="display: list-item"> 
		<i class="fas fa-angle-up"></i>
	</a>

    <!-- 부트스트랩 스크립트 -->
	<div id="bootstrap">
		<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />
	</div>
<!-- datepicker -->
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>

</html>