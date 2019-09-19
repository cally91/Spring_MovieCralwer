<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<c:if test="${sessionScope.userid!= null }">
<script>
	alert("로그아웃 후 사용해주세요.");
	location.href="${path}/";
</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=20190917">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=2019090304">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090502">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/view.css?ver=20190917">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/button.css?ver=2019091001">
<title>핀냐무비 : 회원가입</title>
<style type="text/css">
div#member_join {
	margin: 100px auto 0 auto;
	width: 600px;
}

label.join_label, span.join-class {
	margin-left: 10px;
}

div.in-box {
	margin-left: 100px;
}

div.member_body {
	height: 700px;
	width: 800px;
	padding: 10px;
}

h2.join_h2 {
	text-align: center;
}

input.join_write {
	margin: 10px;
	height: 50px;
	width: 85%;
}

input.join_email {
	margin: 10px;
	height: 50px;
	width: 40%;
}
 input.addrbtn,.join_addr{
 margin: 10px;
	height: 50px;
	width: 41%;
 }
 

input.btn_write {
	margin: 10px;
	height: 46px;
	width: 40%;
	background-color: black;
	color: white;
	border: 1px solid black;
	cursor: pointer;
}

select.join_select {
	width: 85%;
	height: 30px;
	margin: 10px;
}

.join-class {
	margin: 0px;
}
.join-addr{
margin-top:10px;
text-align: center;
}
#err_check_msg{
text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div id="member_join">
		<div class="member_body">
			<h2 class="join_h2">회원가입</h2>
			<div class="member_content">
				<form action="${path}/member/write" method="POST" id="frm_mem">
					<div class="in-box">
						<h3>
							<label class="join_label">아이디</label>
						</h3>
						<div class="">
							<input type="text" name="userid" id="inputid" class="join_write"
								placeholder="아이디"> <span id="join-id" class="join-class"></span>
						</div>
					</div>
					<div class="in-box">
						<h3>
							<label class="join_label">비밀번호</label>
						</h3>
						<div id="join-passwd"></div>
						<input type="password" name="passpw" id="inputpw"
							class="join_write" placeholder="비밀번호"> <span
							id="join-repasswd" class="join-class"></span>
					</div>
					<div class="in-box">
						<h3>
							<label class="join_label">비밀번호 재확인</label>
						</h3>

						<input type="password" name="re_password" id="inputrpw"
							class="join_write" placeholder="비빌번호 확인"> <span
							id="join-repasswd" class="join-class"></span>
					</div>
					<div class="in-box">
						<h3>
							<label class="join_label">회원이름</label>
						</h3>
						<input type="text" name="name" id="inputname" class="join_write"
							placeholder="회원 이름"> <span id="join-name"
							class="join-class"></span>
					</div>
					<div class="in-box">
						<h3>
							<label class="join_label">이메일</label>
						</h3>

						<input type="text" name="email" id="email_id" class="join_email"
							placeholder="아이디">@<input name="email" id="email_url" class="join_email"
							placeholder="URL"> <select id="selmail"
							class="join_select" name="type">
							<option value="direct">직접입력</option>
							<option value="naver.com">naver.com(네이버)</option>
							<option value="daum.net">daum.net(다음)</option>
							<option value="gmail.com">gmail.com(구글)</option>
							<option value="nate.com">nate.com(네이트)</option>
						</select> <span class="join-class"></span>
					</div>

					<div class="in-box">
						<h3>
							<label class="join_label">전화번호</label>
						</h3>
						<input type="text" name="phone" id="inputPhone" class="join_write"
							placeholder="전화번호( - 없이 입력해주세요)"> <span id="join-tel"
							class="join-class"></span>
					</div>
					<div class="in-box">
						<h3>
							<label class="join_label">주소</label>
						</h3>
						<input type="text" id="sample6_postcode" name="zipcode" class="addrbtn" placeholder="우편번호" readonly="readonly"> 
							<span id="sample6_extraAddress"></span>
							 <input type="button" onclick="sample6_execDaumPostcode()" id="addr_btn" value="우편번호 찾기" readonly="readonly"><br> <input
							type="text" id="sample6_address" name="addr1" class="addrbtn" placeholder="주소"
							readonly="readonly"> <input type="text"
							id="sample6_detailAddress" class="join_addr" name="addr2" placeholder="상세주소">
						<span id="join-add" class="join-class"></span>
					</div>
					<div id="err_check_msg"></div>
					<div class="btn-box center">
						<button id="btn-join" type="button" id="email" class="bz-btn save">회원가입</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript" src="${path}/resources/js/valibation.js"></script>
<script type="text/javascript">
	// 유효성 체크 flag값(통과여부)
	var check_id = false;
	var check_pw = false;
	var check_rpw = false;
	var check_name = false;
	var check_phone = false;
	var check_email = false;
	var check_posh = false;
	$(function() {
		$('.addrbtn').click(function() {
			var zipcode = $('.addrbtn').eq(0).val();
			var addr = $('.addrbtn').eq(1).val();
			if (zipcode == "" || addr == "") {
				$('#addr_btn').click();
			}
		})
		$('#sample6_detailAddress').blur(function() {
					var dAddr = $.trim($(this).val());
					if (dAddr == "" || dAddr.length == 0) {
						$('#sample6_detailAddress').next().text('필수 정보입니다')
								.css('dlsplay', 'block')
								.css('color', '#FF3636');
						check_posh = false;
						return false;
					}
					check_posh = true;
					return true;
				})
		$('.bz-btn.save').click(function() {
							var email_id = $('#email_id').val();
							var email_url = $('#email_url').val();
							var email = email_id + '@' + email_url;
							if(!check_id){
								$('#inputid').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');
							}else if(!check_pw){
								$('#inputpw').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');
							}else if(!check_rpw ){
								$('#inputrpw').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');
							}else if(!check_name){
								$('#inputname').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');
							}else if(!check_phone){
								$('#inputPhone').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');
							
							}else if(!check_email ){
								$('#email_id').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');								
							}else if(!check_posh ){
								$('#sample6_detailAddress').focus();
								$('#err_check').css('display','none')
								$('#err_check_msg').text("필수 정보를 모두 입력해주세요")
								.css('display','block').css('color', '#FF3636');
							}
							
							$('#email').val(email);
							//유효성 체크
							//alert('아이디 = ' + check_id + ' 비밀번호 = ' + check_pw+ ' 비밀번호재확인 = ' + check_rpw + ' 이름 = '+ check_name+' 이메일 = ' + check_email + ' 휴대전화 = '+ check_phone + ' 주소  = ' + check_posh);
							alert("submit");
							$('#frm_mem').submit();

						})
		$('.input_join').focus(function() {
			$(this).parent().css('border', '1px solid #f39');
		})
		$('.input_join').blur(function() {
			$(this).parent().css('border', '1px solid #dada');
		})
		//id값 유효성 체크
		$("#inputid").keyup(function() {
					var memId = $.trim($(this).val());
					var checkResult = joinValidate.checkId(memId);
					if (checkResult.code != 0) {//경고 메세지 출력
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');
						check_id = false;
						return false;
					} else {
						//AJAX로 ID중복 체크
						if (ajaxCheck(memId)) {
							check_id = true;
							return true;
						}
					}
					check_id = false;
					return false;
				})

		//비밀번호 유효성 체크
		$('#inputpw').keyup(function() {
							var memPw = $.trim($(this).val());
							var memRpw = $.trim($("#inputrpw").val());
							var checkResult = joinValidate.checkPw(memPw,memRpw);

							if (checkResult.code == 4) {
								$("#inputrpw").next().text(checkResult.desc)
										.css('display', 'block')
										.css('color','#FF3636');
								check_pw = false;
								return false;

							} else if (checkResult.code != 0) {//경고 메세지 출력

								$(this).next().text(checkResult.desc).css(
										'display', 'block').css('color',
										'#FF3636');
								check_pw = false;
								return false;

							} else {
								if ((memRpw != "") || (memRpw.length != 0)) {
									$(this).next().text('')
									$("#inputrpw").next()
											.text(checkResult.desc).css(
													'display', 'block').css(
													'color', '#0000ff');
									check_rpw = true;
									check_pw = true;
								} else {
									$(this).next().text('')
								}
								return true;
							}
							check_pw = false;
							return false;
						})
		//비밀번호 재확인 유효성체크
		$('#inputrpw').keyup(
				function() {
					var memPw = $.trim($("#inputpw").val());
					var memRpw = $.trim($(this).val());
					var checkResult = joinValidate.checkRpw(memPw, memRpw);
					if (checkResult.code != 0) {//경고 메세지 출력
						$(this).next().text(checkResult.desc)
							.css('display','block')
							.css('color', '#FF3636');
						check_rpw = false;
						return false;
					} else {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#0000ff');
						check_pw = true;
						check_rpw = true;
						return true;
					}
				})
		//이름 유효성채크
		$('#inputname').keyup(
				function() {
					var name = $.trim($(this).val());
					var checkResult = joinValidate.checkName(name);
					if (checkResult.code != 0) {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');
						check_name = false;
						return false;
					} else {
						$(this).next().text(checkResult.desc)
						.css('display','block')
						.css('color', '#0000ff');
						check_name = true;
						return true;
					}
					check_name = false;
					return false;
				})
		//이메일 selectBox 설정
		$('#selmail').change(function() {
			var url = $(this).val();
			if (url == "direct") {
				$('#email_url').val('');
				$('#email_url').removeAttr('readonly');
				$('#email_url').blur();
				$('#email_url').focus();

			} else {
				$('#email_url').val(url);
				$('#email_url').prop('readonly', true);
				$('#email_url').blur();
			}
		})
		//이메일 유효성 체크
		$('#email_id').blur(
				function() {
					var email = $.trim($(this).val());
					var url = $.trim($('#email_url').val());
					var checkResult = joinValidate.checkEmail(email, url);
					if (checkResult.code != 0) {
						$('#selmail').next().text(checkResult.desc).css(
								'display', 'block').css('color', '#FF3636');
						check_email = false;
						return false;
					} else {
						$('#selmail').next().text(checkResult.desc).css(
								'display', 'block').css('color', '#0000ff');
						check_email = true;
						return true;
					}
				})
		$('#email_url').blur(
				function() {
					var email = $.trim($('#email_id').val());
					var url = $.trim($('#email_url').val());
					var checkResult = joinValidate.checkUrl(email, url);
					if (checkResult.code != 0) {
						$('#selmail').next().text(checkResult.desc).css(
								'display', 'block').css('color', '#FF3636');
						check_email = false;
						return false;
					} else {
						$('#selmail').next().text(checkResult.desc).css(
								'display', 'block').css('color', '#0000ff');
						check_email = true;
						return true;
					}
				})
		//휴대폰 유효성 체크
		$('#inputPhone').keyup(
				function() {
					var phone = $.trim($(this).val());
					var checkResult = joinValidate.checkPhone(phone);
					if (checkResult.code != 0) {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');
						check_phone = false;
						return false;
					} else {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#0000ff');
						check_phone = true;
						return true;
					}
					check_phone = false;
					return false;
				})

	})
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>
</html>