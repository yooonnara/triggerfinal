<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/headTag.jsp" />
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>


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
                                                <input type="checkbox" class="custom-control-input" id="saveId" name="saveId">
                                                <label class="custom-control-label" for="saveId">아이디 저장 &nbsp;
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
    <div id="find-password-area">
        <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" 
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">비밀번호 찾기</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>비밀번호를 찾고자하는 아이디를 입력해주세요.</p>
                        <form class="user">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                     placeholder="아이디">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#authenticationNumberModal">다음</a>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <!-- 인증번호 발송 확인 모달-->
    <div id="authentication-number-area">
        <div class="modal fade" id="authenticationNumberModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">인증번호 메일 발송</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>인증번호가 발송되었습니다.<br>
                        아래 인증번호를 입력하신 후 새로운 비밀번호를 생성해 주세요.<br>
						<form class="user">
                            <div class="form-group">
                                인증번호<input type="text" class="form-control form-control-user" id="authenticationNumber"><br>
                                비밀번호 변경하기
                                <input type="password" class="form-control form-control-user" id="newPassword" placeholder="새로운 비밀번호">
                                <input type="password" class="form-control form-control-user" id="checkNewPassword" placeholder="비밀번호 확인">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="button">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    // 모달 닫기
    $('#authenticationNumberModal').on('hidden.bs.modal', function (event) { // 2차로 열린 모달 닫을 때 이벤트
    	$('#passwordModal').modal('hide'); // 첫번째 모달 닫기
	});
    
    $(document).ready(function() {
        $("#userId").val(Cookies.get('key'));      
        if ($("#userId").val() !== "") {
            $("#saveId").prop("checked", true);  // Change this line
        }

        $("#saveId").change(function() {
            if ($("#saveId").is(":checked")) {
                Cookies.set('key', $("#userId").val(), { expires: 7 });
            } else {
                Cookies.remove('key');
            }
        });

        $("#userId").keyup(function() {
            if ($("#saveId").is(":checked")) {
                Cookies.set('key', $("#userId").val(), { expires: 7 });
            }
        });
    });

    </script>



	<jsp:include page="/WEB-INF/views/common/bootstrapScript.jsp" />

</body>

</html>