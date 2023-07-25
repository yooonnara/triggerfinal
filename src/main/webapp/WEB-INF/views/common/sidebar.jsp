<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion h-100" id="accordionSidebar">

    <!-- 사이드바 화이트 로고 Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center mt-5 my-5" href="#">
        <div class="logo-area">
            <img src="${path }/resources/img/logo2.png" class="mw-100">
        </div>
    </a>
    

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="#">
            <i class="bi bi-house-door-fill"></i>
            <span>홈</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- 내 정보 사이드바 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <i class="bi bi-person-fill"></i>
            <span>내 정보</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="${path }/mypage">내 정보 수정</a>

            </div>
        </div>
    </li>

    <!-- 근태관리 사이드바 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities">
            <i class="bi bi-calendar-check-fill"></i>
            <span>근태관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="">근태현황</a>
                <a class="collapse-item" href="">연차현황</a>
                <a class="collapse-item" href="">출장현황</a>
            </div>
        </div>
    </li>

    <!-- 전자결재 사이드바 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="true" aria-controls="collapsePages">
            <i class="bi bi-pencil-square"></i>
            <span>전자결재</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="#">결재 요청하기</a>
                <a href=""><h6 class="collapse-header">- 연차 신청</h6></a>
                <a href=""><h6 class="collapse-header">- 출장 신청</h6></a>
                <a class="collapse-item" href="#">결재 문서 현황</a>
            </div>
        </div>
    </li>

    <!-- 커뮤니티 사이드바 -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCommunity"
            aria-expanded="true" aria-controls="collapseCommunity">
            <i class="bi bi-chat-square-text-fill"></i>
            <span>커뮤니티</span>
        </a>
        <div id="collapseCommunity" class="collapse" aria-labelledby="headingCommunity"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="">전체게시판</a>
                <a class="collapse-item" href="/notice.html">공지사항</a>
                <a class="collapse-item" href="">자유게시판</a>
            </div>
        </div>
    </li>


    <!-- 커뮤니티 아래 흰색 선 Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- 사이드바 축소 Sidebar Toggler (Sidebar)-->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    <!-- Sidebar Message -->
    <div class="sidebar-card d-none d-lg-flex">
        <img class="sidebar-card-illustration mb-2" src="${path }/resources/img/undraw_rocket.svg" alt="...">
        <p class="text-center mb-2"><strong>JOIN OFFICE</strong> 를 통해<br>효율적이고 편리한<br>
            업무관리를 시작해 보세요!<br><br>문의사항 02-2687-1245</p>
    </div>

</ul>