<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<!-- 헤드 태그 -->
<div id="headTag">
	<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
</div>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- 사이드바 시작 Sidebar -->
        <div id="sidebar">
           <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        </div>
        <!-- 사이드바 종료 End of Sidebar -->


        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
     <div id="content">

                <!-- 상단바 시작 Topbar -->
                <div id="topbar">
                    <jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
                </div>
                <!-- 상단바 종료 End of Topbar -->
 



            <!-- 수정할 컨테이너 Begin Page Content -->
            <div class="container-fluid pl-5 pr-5">

                <!-- 타이틀 Page Heading -->
                <h1 class="h3 text-dark mt-5 mb-5">전자결재조회</h1>

                <div class="edms-container">

                    <!-- 검색창 & 작성하기 영역 -->
                    <div class="search-write-area row mb-3">
                        <!-- 검색창 -->
                        <div class="search-area float-start col-8">
                            <form name="asearch-form">
                                <div class="search-area d-flex">
                                    <select name="category" aria-label="Default select example" class="mr-1">
                                        <option selected value="all">전체</option>
                                        <option value="wait">결재대기</option>
                                        <option value="allow">결재승인</option>
                                        <option value="return">결재반려</option>
                                    </select>
                                    <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1">
                                    <button type="button" onclick="eSearch()"class="btn btn-primary btn-sm ">검색</button>
                                </div>
                            </form>
                        </div>
                        
                        <!-- <script>
                        function eSearch(){
                        	$.ajax({
                        		url: "${path}/edms/bsnList/eSearch",
                        		data: $("form[name=asearch-form]").serialize(),
                        		success:function(f){
                        			$("#em-sts").html("");//리셋 
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
                        				case 0: type="연차" ;break;
                        				case 1: type="출장" ;break;
                        				}
                        				const $type=$("<td>").text(type);
                        				
                        				let appStatus="";
                        				switch(f[i]["appStatus"]){
                        				case -1: appStatus="전체" ;break;
                        				case 0: appStatus="대기" ;break;
                        				case 1:appStatus="승인" ;break;
                        				case 2:appStatus="반려" ;break;
                        				}
                        				const $appStatus=$("<td>").text(appStatus);
                        				$tr.append($no).append($createDate).append($deptTitle).append($jobTitle)
                        				.append($name).append($title).append($type).append($appStatus);
                        				$("#em-sts").append($tr);
                        			}
                        		},
                        		error:function(){
                        			console.log("ajax 통신 실패하였습니다.")
                        		}
                        	})
                        };
                        
                        
                        </script>
                         -->
                        
                        
                    <!--     작성하기 버튼
                        <div class="wirte-area col-4">
                            <a href="" class="btn btn-primary btn-sm float-right">글쓰기</a>
                        </div> -->
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
                                <tr class="bg-primary text-white">
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
                            <tbody id="em-sts">
                            <c:if test="${not empty edms}">
                            <c:forEach var="e" items="${edms}">
                  
                                <tr onclick="edmsList(${e.no});">
                                
                                <td> ${pageStartRowNum}</td>
                                	
                                    <td>${e.createDate }</td> 
                                    <td>${e.emp.deptTitle }</td>
                                    <td>${e.emp.jobTitle }</td>
                                    <td>${e.emp.name }</td>
                                    <td><a href="${pageContext.request.contextPath }/edms/edmsView?no=${e.no}">${e.title }</a></td>
                                    <td>
                                    <c:choose>
                                    	<c:when test="${e.type==0 }">연차</c:when>
                                    	<c:when test="${e.type==1 }">출장</c:when>
                                    	<c:otherwise>미정</c:otherwise>
                                    </c:choose>
                                    </td>
                                  <td>
                                  <a href="${path }/edms/edmsView?no=${e.no}" >
                                  	<c:if test="${e.appStatus==0 }">대기</c:if>
                                  	<c:if test="${e.appStatus==1 }">승인</c:if>
                                  	<c:if test="${e.appStatus==2 }">반려</c:if>
                                  </a>
                               </td>                                 
                                </tr>
                                <c:set var="pageStartRowNum" value="${pageStartRowNum-1}"></c:set>
                                </c:forEach>
                                </c:if>
                            </tbody> 
                        </table>
                    </div>

                    <!-- 페이징 -->
                    <div class="pasing-area">
                    <c:out value="${pageBar}" escapeXml="false" />   
                    </div>
                    <script>
                    function fn_paging(no, numPerpage, category, keyword) {
                        $.ajax({
                            url: "${pageContext.request.contextPath }/edms/bsnList/eSearch",
                            data: { cPage: no, numPerpage: numPerpage, category: category, keyword: keyword },
                            success: function(response) {
                                // 서버로부터 받은 데이터를 변수에 저장
                                const data = response;

                                // 저장된 데이터를 이용하여 테이블 내용 및 페이지바를 갱신하는 함수 호출
                                updateTableAndPageBar(data);
                            },
                            error: function() {
                                console.log("연차 출장 페이징 처리 통신 실패");
                            }
                        });
                    }
                    
                    function updateTableAndPageBar(data) {
                        // 테이블 내용을 갱신하는 부분
                        const $tableBody = $("#em-sts");
                        $tableBody.empty(); // 기존 내용 비우기

                        data.edms.forEach(edms => {
                            const $tr = $("<tr>");
                            const $no=$("<td>").text(edms.emp.no);
							const $createDate=$("<td>").text(edms.createDate);
							const $deptTitle=$("<td>").text(edms.emp.deptTitle);
							const $jobTitle=$("<td>").text(edms.emp.jobTitle);
							const $name=$("<td>").text(edms.emp.name);
							const $title=$("<td>").text(edms.title);
							let type="";
							switch (edms.type){
							case 0: type="연차" ;break;
            				case 1: type="출장" ;break;
							}
							const $type=$("<td>").text(type);
							let appStatus="";
							switch (edms.appStatus){
							case -1: appStatus="전체" ;break;
            				case 0: appStatus="대기" ;break;
            				case 1:appStatus="승인" ;break;
            				case 2:appStatus="반려" ;break;
							}
							const $appStatus=$("<td>").text(appStatus);
							$tr.append($no).append($createDate).append($deptTitle).append($jobTitle).append($name).append($title).append($type).append($appStatus);

                            // 클릭 이벤트 등록
                            $tr.on("click", function() {
                                edmsList(edms.no);
                            });

                            $tableBody.append($tr);
                        });

                        // 페이지바를 갱신하는 부분
                        $(".pasing-area").html(data.pageBar);
                    }
                    
                 // 검색 버튼 클릭시 호출하는 함수
                    function eSearch() {
                        const category = $("select[name=category]").val();
                        const keyword = $("input[name=keyword]").val();
                        fn_paging(1, 5, category, keyword);
                        // 페이지를 1로 초기화하여 검색 결과를 보여줍니다.
                    }

                    // 페이지 번호를 클릭할 때 호출하는 함수
                    function goToPage() {
                        const category = $("select[name=category]").val();
                        const keyword = $("input[name=keyword]").val();
                        fn_paging(no, 5, category, keyword);
                    }
                    
						/* function fn_paging(no,numPerpage,category,keyword){
							console.log(no);
							$.ajax({
								url:"${pageContext.request.contextPath }/edms/bsnList/eSearch",
								data:{cPage:no,numPerpage:numPerpage,category:category,keyword:keyword},
								success:function(e){
									$("#em-sts").html("");
									console.log(e);
									const list=e.edms;
									list.forEach(edms=>{
									const $tr=$("<tr>");
									const $no=$("<td>").text(edms.emp.no);
									const $createDate=$("<td>").text(edms.createDate);
									const $deptTitle=$("<td>").text(edms.emp.deptTitle);
									const $jobTitle=$("<td>").text(edms.emp.jobTitle);
									const $name=$("<td>").text(edms.emp.name);
									const $title=$("<td>").text(edms.title);
									let type="";
									switch (edms.type){
									case 0: type="연차" ;break;
                    				case 1: type="출장" ;break;
									}
									const $type=$("<td>").text(type);
									let appStatus="";
									switch (edms.appStatus){
									case -1: appStatus="전체" ;break;
                    				case 0: appStatus="대기" ;break;
                    				case 1:appStatus="승인" ;break;
                    				case 2:appStatus="반려" ;break;
									}
									const $appStatus=$("<td>").text(appStatus);
									$tr.append($no).append($createDate).append($deptTitle).append($jobTitle).append($name).append($title).append($type).append($appStatus);
									$tr.on("click", function() {
								        edmsList(edms.no); // 클릭 이벤트 등록
								    });
									$("#em-sts").append($tr);
										
	
									});
									
// 									const input = $("#em-sts td>input[type=text]");
									
// 									$("#em-sts td>input[type=hidden]").val(e[0].no);
									
// 									$(input[0]).val(e[0].no);
// 									$(input[1]).val(e[1].createDate);
// 									$(input[2]).val(e[2].emp.deptTitle);
// 									$(input[3]).val(e[3].emp.jobTitle);
// 									$(input[4]).val(e[4].emp.name);
// 									$(input[5]).val(e[5].title);
// 									$(input[6]).val(e[6].type);
// 									$(input[7]).val(e[7].appStatus);
									
									
									//페이지 바 처리하기 
									$(".pasing-area").html(e.pageBar);	
								},
								error:function(){
									console.log("연차 출장 페이징 처리 통신 실패")
								}
							});
							
						}
						

					    // 검색 버튼 클릭시 호출하는 함수
					    function eSearch() {
					        const category = $("select[name=category]").val();
					        const keyword = $("input[name=keyword]").val();
					        fn_paging(1, 5, category, keyword);
					       // 페이지를 1로 초기화하여 검색 결과를 보여줍니다.
					    } */
					   
                    </script>                    
                    
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
	
<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />

</body>

</html>

