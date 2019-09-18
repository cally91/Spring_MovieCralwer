<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
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

input.join_add {
	margin: 10px;
	height: 50px;
	width: 40%;
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
</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div id="member_join">
		<div class="member_body">
			<h2 class="join_h2">회원가입</h2>
			<div class="member_content">
				<form action="${path}/member/join" method="POST">
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
						<input type="password" name="password" id="inputpw"
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

						<input type="text" name="email" id="email" class="join_add"
							placeholder="아이디">@<input class="join_add"
							placeholder="URL"> <select id="join_selsearch"
							class="join_select" name="type">
							<option value="선택해주세요" selected="selected">선택해주세요</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc">직접입력</option>
						</select> <span id="join-emall" class="join-class"></span>
					</div>

					<div class="in-box">
						<h3>
							<label class="join_label">전화번호</label>
						</h3>
						<input type="text" name="tel" id="inputPhone" class="join_write"
							placeholder="전화번호( - 없이 입력해주세요)"> <span id="join-tel"
							class="join-class"></span>
					</div>
					<div class="in-box">
						<h3>
							<label class="join_label">주소</label>
						</h3>
						<input type="text" id="sample6_postcode" class="join_add"
							placeholder="우편번호"> <input type="button"
							onclick="sample6_execDaumPostcode()" class="btn_write"
							value="우편번호 찾기"><br> <input type="text"
							id="sample6_address" class="join_write" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" class="join_write"
							placeholder="상세주소"> <input type="hidden"
							id="sample6_extraAddress" placeholder="참고항목"> <span
							id="join-add" class="join-class"></span>
					</div>
					<div class="btn-box center">
						<button id="btn-join" type="button" class="bz-btn save">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${path}/resources/js/valibation.js"></script>
<script type="text/javascript">
	$(function() {
		//id값 유효성 체크
		$("#inputid").keyup(
				function() {
					var memId = $.trim($(this).val());
					var checkResult = joinValidate.checkId(memId);
					if (checkResult.code != 0) {//경고 메세지 출력
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');
						return false;
					} else {
						//AJAX로 ID중복 체크
						if (ajaxCheck(memId) == "ok") {
							return true;
						}
					}
					return false;
				})
		//비밀번호 유효성 체크
		$('#inputpw')
				.keyup(
						function() {
							var memPw = $.trim($(this).val());
							var memRpw = $.trim($("#inputrpw").val());
							var checkResult = joinValidate.checkPw(memPw,
									memRpw);

							if (checkResult.code == 4) {
								$("#inputrpw").next().text(checkResult.desc)
										.css('display', 'block').css('color',
												'#FF3636');
								return false;
							} else if (checkResult.code != 0) {//경고 메세지 출력
								$(this).next().text(checkResult.desc).css(
										'display', 'block').css('color',
										'#FF3636');
								return false;
							} else {
								if (memRpw != "" || memRpw.length != 0) {
									$("#inputrpw").next()
											.text(checkResult.desc).css(
													'display', 'block').css(
													'color', '#0000ff');
								} else {
									$(this).next().text('')
								}
								return true;
							}
							return false;

						})
		$('#inputrpw').blur(
				function() {
					var memPw = $.trim($("#inputpw").val());
					var memRpw = $.trim($(this).val());
					var checkResult = joinValidate.checkRpw(memPw, memRpw);

					if (checkResult.code != 0) {//경고 메세지 출력
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');

						return false;
					} else {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#0000ff');
						return true;
					}
				})
		$('#inputname').keyup(
				function() {
					var name = $.trim($(this).val());
					var checkResult = joinValidate.checkName(name);
					if (checkResult.code != 0) {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');
						return false;
					} else {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#0000ff');
						return true;
					}
					return false;
				})
		$('#inputPhone').keyup(
				function() {
					var phone = $.trim($(this).val());
					var checkResult = joinValidate.checkPhone(phone);
					if (checkResult.code != 0) {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#FF3636');
						return false;
					} else {
						$(this).next().text(checkResult.desc).css('display',
								'block').css('color', '#0000ff');
						return true;
					}
					return false;
				})

	})
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>
</html>