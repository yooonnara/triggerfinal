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
                                        <img src="${pageContext.request.contextPath}/resources/img/logo.png" class="w-100 my-4">
                                    </div>
                                    <form class="user" action="${pageContext.request.contextPath}/login" method='post'>
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
                                <input type="text" class="form-control form-control-user" id="changePwCheckId"
                                     placeholder="아이디">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
						<button class="btn btn-primary" type="button" onclick="sendEmail()">다음</button>
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
                        <h5 class="modal-title">인증코드 메일 발송</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>인증코드가 발송되었습니다.<br>
                        아래 인증코드를 입력하신 후 새로운 비밀번호를 생성해 주세요.<br>
						<form class="user">
                            <div class="form-group">
                            	<div class="row">
	                                <input type="text" class="col-9 ml-3 form-control form-control-user" id="authenticationNumber" placeholder="인증코드">&nbsp;&nbsp;
	                                <button class="col-2 btn btn-outline-danger" onclick="authNumCheck()">인증</button><br>
	                            </div>
                                <div id="changePw" style="display:none">
	                                비밀번호 변경하기
	                                <input type="password" class="form-control form-control-user" id="newPassword" placeholder="새로운 비밀번호">
	                                <input type="password" class="form-control form-control-user" id="checkNewPassword" placeholder="비밀번호 확인">
                            	</div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                  		<button class="btn btn-secondary" href="#passwordModal" data-toggle="modal">이전</button>
                        <button class="btn btn-primary" type="button">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    function sendEmail(){
    	 var empId = $("#changePwCheckId").val();

         if (!empId) {
             alert("아이디를 입력해 주세요.");
             return;
         }
    	
    	$.ajax({
    		url:"${pageContext.request.contextPath}/sendMail/idCheck",
    		type:"post",
    		data:{id : empId}, // 비밀번호를 찾을 아이디
    		success:function(data){
    			if (data === "성공") { // 성공했을 경우 다음 모달로 넘어가기
    				console.log(data)
    				$('#passwordModal').modal('hide');
    				$('#authenticationNumberModal').modal('show');
                } else {
                	console.log(data)
                    alert("인증코드 발송이 실패하였습니다. 다시 시도해 주세요.");
                }
            }
        });
    }
    
    function authNumCheck(){
    	var enteredAuthNum = $("#authenticationNumber").val();

        if (!enteredAuthNum) {
            alert("인증코드를 입력해 주세요.");
            return;
        }
        // 입력한 아이디가 다른 경우
   	
        $.ajax({
            url: "${pageContext.request.contextPath}/sendMail/authNumcheck",
            type: "post",
            data: { authNum: enteredAuthNum }, // Sending the entered authentication number
            success: function (data) {
                if (data === true) {
                    $("#authenticationNumber").prop("readonly", true);
                    $("#changePw").show();
                } else {
                    alert("인증코드가 올바르지 않습니다.");
                }
            },
            error: function () {
                alert("인증코드 확인 중에 오류가 발생했습니다.");
            }
        });
    }
   /*  
    function changePassword() {
        var newPassword = $("#newPassword").val();
        var checkNewPassword = $("#checkNewPassword").val();

        if (!newPassword || !checkNewPassword) {
            alert("비밀번호를 입력해 주세요.");
            return;
        }
        if (newPassword !== checkNewPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        // 비밀번호 변경 처리 추가
        $.ajax({
            url: "${path}/changePassword",
            type: "post",
            data: { newPassword: newPassword },
            success: function (data) {
                if (data === "성공") {
                    alert("비밀번호를 변경했습니다.");
                } else {
                    alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
                }
            }
        });
    } */
</script>


<!-- 아이디 저장 -->
<script>
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