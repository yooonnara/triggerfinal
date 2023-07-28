<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${path }/resources/css/nara.css" rel="stylesheet">

<body id="page-top">

<!-- <script>
      $(function(){
        $("#frm").submit(function(){
          if($("#id").val().trim() == ""){
            alert("아이디를 입력하세요.");
            $("#id").focus();
            return false;
          }
          if($("#pwd1").val().trim() == ""){
            alert("비밀번호를 입력하세요.");
            $("#pwd1").focus();
            return false;
          }
          if($("#pwd2").val() != $("#pwd1").val()){
            alert("비밀번호가 일치하지 않습니다.");
            $("#pwd2").focus();
            return false;
          }
          if($("#name").val().trim() == ""){
            alert("이름을 입력하세요.");
            $("#name").focus();
            return false;
          }
          if($("#phone").val().trim() == ""){
            alert("전화번호를 입력하세요.");
            $("#phone").focus();
            return false;
          }
        });
      });
    </script> -->

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
                                            <option selected value="1">이름</option>
                                            <option value="2">사번</option>
                                            <option value="3">전화번호</option>
                                            <option value="3">이메일</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1">
                                        <button type="button" class="btn btn-dark btn-sm ">검색</button>
                                    </div>
                                </form>
                            </div>
                            <!-- 작성하기 버튼 -->
                            <div class="btn-member wirte-area col-4">
                                <a href="#" class="btn btn-dark btn-sm float-right">멤버삭제</a>
                                <a href="#" data-toggle="modal" data-target="#insertMemberModal"
                                class="btn btn-dark btn-sm mr-1 float-right">멤버생성</a>
                            </div>
                        </div>


                        <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="5%" />
                                    <col width="8%" />
                                    <col width="10%" />
                                    <col width="10%" />
                                    <col width="15%" />
                                    <col width="20%" />
                                    <col width="20%" />
                                    <col width="12%" />
                                </colgroup>

                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th class="align-middle"><input type="checkbox" id="member-check"></th>
                                        <th>번호</th>
                                        <th>이름</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>계정상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                    <tr>
                                        <td class="align-middle"><input type="checkbox" id="member-check"></td>
                                   		<td>1</td>
                                        <td>
                                        	<a href="#" data-toggle="modal" data-target="#insertMemberModal">윤나라</a>
                                        </td>
                                        <td>미지정</td>
                                        <td>대표이사</td>
                                        <td>010-4727-6729</td>
                                        <td>yooonnara@gmail.com</td>
                                        <td>정상</td>
                                    </tr>
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

            <!-- 멤버생성 모달-->
            <div id="insertMember">
                <div class="modal fade text-center" id="insertMemberModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">멤버 생성</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="frm" name="frm" class="user" action="${path }/insertMember" method="post">
                                    <table class="table text-dark table-borderless">
	                                    <tbody class="text-left">
	                                    	<tr class="text-center">
	                                            <td colspan='2'>
	                                            	<div class="box">
														<img src="${path }/resources/img/user_profile.png" 
																class="profile rounded enter-block mb-3" 
																style="width: 80px; height: 80px">
														<input type="file" accept=".jpg, .png">     
													</div>                                       
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">사번</th>
	                                            <td>
	                                                <input type="text" class="form-control" name="emp_no" id="emp_no" required>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">이름(한글)</th>
	                                            <td>
	                                                <input type="text" class="form-control" name="name" id="name" required>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">성별</th>
	                                            <td class="text-left">
	                                            	<input type="radio" name="gender" id="gender1" value="M">&nbsp;
	                                            		<label for="gender1">남</label>
															&nbsp;&nbsp;&nbsp;&nbsp;
	                                            	<input type="radio" name="gender" id="gender2" value="F">&nbsp;
	                                            		<label for="gender2">여</label>
												</td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">아이디</th>
	                                            <td>
	                                                <input type="text" class="form-control" name="id" id="id" placeholder="영문, 숫자 4글자 이상" required>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">비밀번호</th>
	                                            <td>
	                                                <input type="password" class="form-control" name="pwd1" id="">
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">비밀번호 확인</th>
	                                            <td>
	                                                <input type="password" class="form-control" name="pwd2" id="">
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">계정상태</th>
	                                            <td>
	                                                <select class="form-control" aria-label="Default select example">
	                                                    <option value="1" selected>정상</option>
	                                                    <option value="2">중지</option>
	                                                </select>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">입사일</th>
	                                            <td>
	                                                <input type="date" class="form-control" name="enroll_date" id="">
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">퇴사일</th>
	                                            <td>
	                                                <input type="date" class="form-control" name="resign_date" id="">
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">부서</th>
	                                            <td>
	                                                <select class="form-control" aria-label="Default select example">
	                                                    <option selected>미지정</option>
	                                                    <option value="1">운영팀</option>
	                                                    <option value="2">개발팀</option>
	                                                    <option value="3">인사팀</option>
	                                                </select>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">직급</th>
	                                            <td>
	                                                <select class="form-control" aria-label="Default select example">
	                                                    <option selected>사원</option>
	                                                    <option value="1">대리</option>
	                                                    <option value="2">과장</option>
	                                                    <option value="3">차장</option>
	                                                    <option value="3">부장</option>
	                                                    <option value="3">이사</option>
	                                                    <option value="3">대표</option>
	                                                </select>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">이메일</th>
	                                            <td>
	                                                <input type="email" class="form-control" name="email" id="email" required>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <th class="align-middle">전화번호</th>
	                                            <td>
	                                                <input type="tel" class="form-control" name="phone" id="phone" 
	                                                		placeholder="- 없이 입력" maxlength="11" required>
	                                            </td>
	                                        </tr>
                                       </tbody>
                                    </table>
		                            <div class="modal-footer">
		                                <button class="btn btn-dark" type="submit" data-dismiss="modal">저장</button>
		                                <button class="btn btn-secondary" type="reset" data-dismiss="modal">취소</button>
		                            </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


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
   



</body>

</html>