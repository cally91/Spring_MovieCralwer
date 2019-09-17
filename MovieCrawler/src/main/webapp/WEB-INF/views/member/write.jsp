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
<title>Insert title here</title>
<style type="text/css">
div#member_join {
	margin: 100px auto 0 auto;
	width: 600px;
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
							<label>아이디</label>
						</h3>
						<input type="text" name="userid" id="userid" class="join_write"
							placeholder="아이디"> <span id="check_id"></span>
					</div>
					<div class="in-box">
						<h3>
							<label>비밀번호</label>
						</h3>
						<input type="password" name="password" id="password"
							class="join_write" placeholder="비밀번호">
					</div>
					<div class="in-box">
						<h3>
							<label>비밀번호 재확인</label>
						</h3>
						<input type="password" name="re_password" id="re_password"
							class="join_write" placeholder="비빌번호 확인">
					</div>
					<div class="in-box">
						<h3>
							<label>회원이름</label>
						</h3>
						<input type="text" name="name" id="name" class="join_write"
							placeholder="회원 이름">
					</div>
					<div class="in-box">
						<h3>
							<label>이메일</label>
						</h3>
						<input type="text" name="email" id="email" class="join_add"
							placeholder="id">@<input class="join_add"
							placeholder="URL">
					</div>
					<div class="in-box">
						<h3>
							<label>전화번호</label>
						</h3>
						<input type="text" name="tel" id="tel" class="join_write"
							placeholder="전화번호">
					</div>



					<div class="btn-box center">
						<button id="btn-join" type="button" class="bz-btn save">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>