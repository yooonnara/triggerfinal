<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="loginEmployee" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal }"/>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- 사이드바&탑바 버튼 스타일 Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- 관리자페이지 이동 -->
		<div class="input-group" style="justify-content: right">
		    <c:choose>
		        <c:when test="${loginEmployee.type == 2 && loginEmployee.accStatus == 1}">
		            <a href="${path}/admin/adminMain">
		                <span class="mr-2 d-none d-lg-inline small text-primary">관리자 페이지</span>
		            </a>
		        </c:when>
		    </c:choose>
		</div>
	
	<!-- 로그인 프로필 시작 Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - User Information -->
		

		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginEmployee.name}님, 환영합니다!</span>
				<c:if test="${loginEmployee.empImg == null}">
					<img class="img-profile rounded-circle" src="${path}/resources/img/user_profile.png">
				</c:if>	
				<c:if test="${loginEmployee.empImg != null}">
					<img class="img-profile rounded-circle" src="${path}/resources/upload/employee/${loginEmployee.empImg}">
				</c:if>	
			</a> 
			
			<!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="${path }/mypage"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 기본정보
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					로그아웃
				</a>
			</div>
		</li>

	</ul>

</nav>


<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">정말 로그아웃 하시겠습니까?</div>
			<div class="modal-footer">
				<a href="${path }/logout" class="btn btn-primary">로그아웃</a>
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
