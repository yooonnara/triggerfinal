<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />

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
                    <h1 class="h3 text-dark mt-5 mb-5">공지사항</h1>

                    <div class="notice-container">

                        <!-- 검색창 & 작성하기 영역 -->
                        <div class="search-write-area row mb-3">
                            <!-- 검색창 -->
                            <div class="search-area float-start col-8">
                                <form>
                                    <div class="search-area d-flex">
                                        <select name="notice-search" aria-label="Default select example" class="mr-1">
                                            <option selected value="1">제목</option>
                                            <option value="2">내용</option>
                                            <option value="3">작성자</option>
                                        </select>
                                        <input type="text" name="keyword" placeholder="검색어를 입력해 주세요" class="mr-1">
                                        <button type="button" class="btn btn-primary btn-sm ">검색</button>
                                    </div>
                                </form>
                            </div>
                            <!-- 작성하기 버튼 -->
                            <div class="wirte-area col-4">
                                <a href="" class="btn btn-primary btn-sm float-right">글쓰기</a>
                            </div>
                        </div>

                        <div class="board-container">
                            <table class="table table-sm shadow table-hover text-center">

                                <!-- 테이블 칸 크기 -->
                                <colgroup>
                                    <col width="10%" />
                                    <col width="40%" />
                                    <col width="15%" />
                                    <col width="15%" />
                                    <col width="20%" />
                                </colgroup>

                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>21</td>
                                        <td><a href="">워크샵 일정 안내</a></td>
                                        <td>윤나라</td>
                                        <td>8</td>
                                        <td>2023-08-21</td>
                                    </tr>
                                    <tr>
                                        <td>20</td>
                                        <td><a href="">탕비실 간식 목록</a></td>
                                        <td>윤나라</td>
                                        <td>12</td>
                                        <td>2023-08-20</td>
                                    </tr>
                                    <tr>
                                        <td>19</td>
                                        <td><a href="">사우회 납입금액 변경</a></td>
                                        <td>윤나라</td>
                                        <td>5</td>
                                        <td>2023-08-20</td>
                                    </tr>
                                    <tr>
                                        <td>18</td>
                                        <td><a href="">8/22 의자 교체 예정입니다.</a></td>
                                        <td>윤나라</td>
                                        <td>8</td>
                                        <td>2023-08-18</td>
                                    </tr>
                                    <tr>
                                        <td>17</td>
                                        <td><a href="">연차 소진 관련 공지</a></td>
                                        <td>윤나라</td>
                                        <td>13</td>
                                        <td>2023-08-18</td>
                                    </tr>
                                    <tr>
                                        <td>16</td>
                                        <td><a href="">8/14 창립기념일 근무시간 안내</a></td>
                                        <td>윤나라</td>
                                        <td>20</td>
                                        <td>2023-08-14</td>
                                    </tr>
                                    <tr>
                                        <td>15</td>
                                        <td><a href="">거래처 휴가 일정 공유</a></td>
                                        <td>윤나라</td>
                                        <td>5</td>
                                        <td>2023-08-09</td>
                                    </tr>
                                    <tr>
                                        <td>14</td>
                                        <td><a href="">상반기 인센티브 지급 안내</a></td>
                                        <td>윤나라</td>
                                        <td>22</td>
                                        <td>2023-07-22</td>
                                    </tr>
                                    <tr>
                                        <td>13</td>
                                        <td><a href="">8월 연봉협상 대상자 공지</a></td>
                                        <td>윤나라</td>
                                        <td>10</td>
                                        <td>2023-07-22</td>
                                    </tr>
                                    <tr>
                                        <td>12</td>
                                        <td><a href="">시간 외 근무 신청 안내</a></td>
                                        <td>윤나라</td>
                                        <td>7</td>
                                        <td>2023-07-22</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

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
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
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
   

</body>

</html>