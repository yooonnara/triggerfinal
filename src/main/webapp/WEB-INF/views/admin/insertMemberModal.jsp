<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="insertEmployee">
	<div class="modal fade text-center" id="insertEmployeeModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">멤버 수정</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm" name="frm" class="user"
						action="${path }/insertEmployee" method="post">
						<table class="table text-dark table-borderless">
							<tbody class="text-left">
								<tr class="text-center">
									<td colspan='2'>
										<div class="box" style="cursor: pointer">
											<img src="${path }/resources/img/user_profile.png"
												class="profile rounded enter-block profile_img"
												style="width: 80px; height: 80px" id="profile_img">
											<i class="bi bi-gear-fill profile_img"></i> <input
												id="profile_img_file" type="file" accept=".jpg, .png"
												style="display: none;">
										</div>
									</td>
								</tr>
								<tr>
									<th class="align-middle">사번</th>
									<td><input type="text" class="form-control"
										name="emp_num" id="emp_num" requireda readonly></td>
								</tr>
								<tr>
									<th class="align-middle">이름(한글)</th>
									<td>
										<input onKeyup="checkName(this.value)" type="text" class="form-control" name="emp_name" id="emp_name" required>
										<span class="emp-name-msg small text-danger" style="display: none" >이름을 입력해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">성별</th>
									<td class="text-left">
										<input onclick="checkGender(this.value)" type="radio" name="gender" id="gender1" value="M">&nbsp;
										<label for="gender1">남</label>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<input onclick="checkGender(this.value)" type="radio" name="gender" id="gender2" value="F">&nbsp;
										<label for="gender2">여</label><br>
										<span class="gender-msg small text-danger" style="display: none">성별을 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">아이디</th>
									<td>
										<input type="text" class="form-control" name="emp_id"
											id="emp_id" placeholder="영문, 숫자 4글자 이상" required
											onKeyup="checkId(this.value)">
										<span class="emp-id-msg small text-danger"></span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">비밀번호</th>
									<td>
										<input onKeyup="checkPwd1(this.value)" onclick="checkPwd1(this.value)" type="password" 
												class="form-control" name="pwd1" id="pwd1">
										<span class="pwd1-msg small text-danger"></span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">비밀번호 확인</th>
									<td>
										<input onKeyup="checkPwd2(this.value)" onclick="checkPwd2(this.value)" type="password" 
												class="form-control" name="pwd2" id="pwd2">
										<span class="pwd2-msg small text-danger"></span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">계정상태</th>
									<td>
										<select onclick="checkAccStatus(this.value)" class="form-control" aria-label="Default select example">
											<option selected>선택</option>
											<option value="1" name="acc_status" id="acc_status1">정상</option>
											<option value="2" name="acc_status" id="acc_status2">중지</option>
										</select>
										<span class="acc-status-msg small text-danger" style="display: none">계정상태를 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">입사일</th>
									<td>
										<input type="date" class="form-control" name="enroll_date" id="enroll_date">
										<span class="enroll-date-msg small text-danger" style="display: none">입사일을 입력해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">부서</th>
									<td>
										<select onclick="checkDept(this.value)" id="dept" name="dept" class="form-control" aria-label="Default select example">
										</select>
										<span class="dept-msg small text-danger" style="display: none">부서를 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">직급</th>
									<td>
										<select id="job" name="job" class="form-control" aria-label="Default select example">
										</select>
										<span class="job-msg small text-danger" style="display: none">직급을 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">관리자여부</th>
									<td>
										<select onclick="checkAccType(this.value)" class="form-control" aria-label="Default select example">
												<option selected>선택</option>
												<option value="1" name="acc_type" id="acc_type1">N</option>
												<option value="2" name="acc_type" id="acc_type2">Y</option>
										</select>
										<span class="acc-type-msg small text-danger" style="display: none">관리자여부를 선택해 주세요.</span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">이메일</th>
									<td>
										<input onKeyup="checkEmail(this.value)" type="email" class="form-control" name="email" id="email" required>
										<span class="email-msg small text-danger"></span>
									</td>
								</tr>
								<tr>
									<th class="align-middle">전화번호</th>
									<td>
									<input onKeyup="checkPhone(this.value)" type="text" class="form-control" name="phone" id="phone" placeholder="- 없이 입력" maxlength="11" required>
									<span class="phone-msg small text-danger"></span>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
							<button class="btn btn-dark" type="button" id="submit_btn"
								data-dismiss="modal">저장</button>
							<button class="btn btn-secondary" type="reset"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>