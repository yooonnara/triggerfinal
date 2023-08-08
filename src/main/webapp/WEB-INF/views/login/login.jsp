<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />


<body>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center mt-4">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row justify-content-center">

                            <div class="col-lg-5">
                                <div class="p-5">
                                    <div class="text-center">
                                        <img src="${path }/resources/img/logo.png" class="w-100 my-4">
                                    </div>
                                    <form class="user" action="${path }/login" method='post'>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name="userId" id="userId" aria-describedby="emailHelp" placeholder="아이디">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                               name="password" id="password" placeholder="비밀번호">
                                        </div>
                                        <button class="btn btn-primary btn-user btn-block">
                                            Login
                                        </button>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small my-4">
                                                <input type="checkbox" class="custom-control-input" id="customCheck" name="remember-me">
                                                <label class="custom-control-label" for="customCheck">로그인 상태 유지 &nbsp;
                                                    &#124; &nbsp;</label>
                                                <label class="">
                                                    <a href="#" data-toggle="modal" data-target="#passwordModal" class="text-primary">
                                                    	비밀번호 찾기
                                                    </a>
                                                    </label>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 비밀번호 찾기 모달-->
    <div id="findpassword">
        <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>임시 비밀번호를 발송을 위해 등록된 아이디를 입력해 주세요.</p>
                        <form class="user">
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                    aria-describedby="emailHelp" placeholder="아이디">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#temporaryModal">다음</a>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 임시 비밀번호 발송 확인 모달-->
    <div id="temporary-password">
        <div class="modal fade" id="temporaryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">임시 비밀번호 발송</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>임시 비밀번호가 발송되었습니다.<br>
                        등록하신 메일에서 임시 비밀번호를 확인하세요.<br><br>

                        임시 비밀번호로 로그인 후<br>
                        <span style="color: #428EFF;">‘내 정보 수정’</span>에서 비밀번호를 꼭 변경해 주시기 바랍니다.</p>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-primary" href="login.html">확인</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>

</script>


	<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />

</body>

</html>