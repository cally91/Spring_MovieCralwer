<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<c:if test="${sessionScope.userid== null }">
	<script>
		alert("회원가입후 회원 탈퇴가 가능합니다.");
		location.href = "${path}/";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핀냐무비 : 회원탈퇴</title>
<style type="text/css">
.delete_h3 {
	text-align: center;
}

.delete_box {
	margin: 100px auto 20 auto;
	border-radius: 10px;
	border: 2px solid black;
	width: 50em;
	height: 20em;
	padding: 20px;
}

.delete_text {
	margin-top: 30px;
}

.detele_pro {
	color: blue;
}

.delete_pass {
	margin-left: 30%;
	margin-bottom: 20px;
}

.btn-center {
	margin-left: 30%;
}

.btn-delete {
	margin: 10px;
	border-radius: 10px;
	cursor: pointer;
	font-size: 20px;
}

.delete_inpnt {
	width: 50%;
	height: 30px;
}

#btn-no {
	background-color: white;
	border: 1px solid white;
}

#btn-yes {
	background-color: black;
	color: white;
	border: 1px solid black;
}
</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div>
		<div class="delete_box">
			<h3 class="delete_h3">"${name}"님회원탈퇴시 아래의 조치가 취해집니다.</h3>
			<div class="delete_text">
				1.개인정보는 <span class="detele_pro">"개인정보 보호 정책에 따라 60일간 보관 되며"</span>,
				60일이 경과된후에는 모든 개인정보는 완전히 삭제되며 더이상 복구할수없게 됩니다.
			</div>
			<div class="delete_text">
				2.작성된 게시물은 삭제되지 않으면 익명처리후 <span class="detele_pro">핀냐무비에 소유권이
					귀속</span>됩니다.
			</div>
			<div class="delete_text">
				3.게시물 삭제가 필요한 경우 <span class="detele_pro">관리자(aaaaa@naver.com)</span>로
				문의해 주기기 바랍니다.
			</div>
		</div>
		<div class="delete_pass">
			비밀번호: <input type="password" id="inputpw" class="delete_inpnt">
			<span class="error"></span>
		</div>
		<div class="btn-center ">
			<button id="btn-no" class="btn-delete">최소</button>
			<button id="btn-yes" class="btn-delete">예,탈퇴하겠습니다.</button>


		</div>
		<form action="${path}/member/delete" method="POST" id="frm_membel">
			<input type="hidden" name="id" value="${sessionScope.userid}">
		</form>
	</div>


	<div id="modal-delete">
		<div class="detele_modalBox">
			<div class="delete_h1">회원탈퇴: ${name}</div>
			<div class="delete_d1">정말 탈퇴 하겠습니까?</div>
			<div class="btn-box center">
				<button id="delete_yes" class="button_delete yes">예</button>
				<button id="delete_no" class="button_delete no">아니요</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${path}/resources/js/valibation.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var state = false;
		$('#inputpw').blur(function() {
			var nowId = "${sessionScope.userid}";
			var nowPw = $.trim($(this).val())
			if (nowPw == null || nowPw.length == 0) {
				$('.error').css('dlsplay', 'block');
				$(this).parent().css("dorder", "1px solid #ff3")
				$(this).focus();
			} else {
				$('.error').css('dlsplay', 'none');
				$(this).parent().css("dorder", "1px solid #ff3");
				state = ajaxPwCheck(nowId, nowPw);
			}
		})
		$('#btn-yes').click(function() {
			if (state) {
				$("#modal-delete").css('display', 'block')
				$('.error').css('dlsplay', 'none');
			} else {
				$('.delete_inpnt').focus();
				$('.error').css('dlsplay', 'block').text('올바른 값을 입력해주세요');
			}
		})
		$("#delete_no").click(function() {
			$("#modal-delete").css('display', 'none')
		})
		$("#delete_yes").click(function() {
			$('#frm_membel').submit();
		})
	})
</script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${path}/resources/js/daumpost.js"></script>

</html>