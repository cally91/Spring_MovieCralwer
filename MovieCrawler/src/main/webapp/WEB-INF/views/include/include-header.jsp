<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
.test-style {
	text-align: center;
	color: blue;
	text-shadow: 5px 5px 5px 5px yellow;
}

#modal-box, #modal-join {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	display: none;
}

.modal-body {
	width: 500px;
	height: 700px;
	border: 2px solid blue;
	margin: 100px auto 0 auto;
	border-radius: 5px;
	background-color: white;
}

.modal-content {
	width: 350px;
	margin: 0 auto;
}

.modal-header {
	background-color: #379392;
	color: #fff;
	font-size: 30px;
	text-align: center;
	margin-bottom: 30px;
}

.modal-body input, button {
	width: 350px;
	height: 40px;
	margin: 15px auto;
}

.select {
	text-align: center
}
span.close:hover {
	color: #f9320c;
}
.btn-login{
border: 1px solid blue;
border-radius: 5px;
background-color: blue;
color: white;
font-size: 15px;
transition-duration : 0.5s;
cursor: pointer;
}
.btn-login:hover{
border: 1px solid #fab1ce;

background-color: #fab1ce;
color: black;
}
div.err_msg ,div.err_msg_id,div.err_msg_pass{
color: red;
}
</style>
</head>
<button id="topBtn" class="sideBtn">
	<i class="fas fa-arrow-up"></i>
</button>
<nav class="main">
	<ul class="main-menu">
		<li><a href="${path}/">홈</a></li>
		<li><a href="${path}/board/list">커뮤니티</a></li>

<c:choose>
		<c:when test="${empty sessionScope.name}">
			<li><a href="#" id="login" class="a-menu">로그인</a></li>
			<li><a href="#" id="join" class="a-menu">회원가입</a></li>
			</c:when>

		<c:otherwise>
		<li><a href="">${userid}</a></li>
			<li><a href="">로그아웃</a></li>
		</c:otherwise>
		</c:choose>
	</ul>
</nav>

<div id="modal-box">
	<div class="modal-body">
		<div class="modal-header">로그인<span class="close" style="float:right;cursor:pointer">&times;</span> </div> 
		<div class="modal-content">
		<div class="err_msg"></div>
			<div>
				아이디 :<div class="err_msg_id" ></div>
				<input class="userid" type="text" placeholder="id">
			</div>
			<div>
				비밀번호 :<div class="err_msg_pass" ></div><input class="passpw" type="text" placeholder="password">
			</div>
			<div >
				<button class="btn-login">로그인</button>
			</div>
			<div class="select">
				<span>회원가입</span> <span>｜</span> <span>아이디찾기</span> <span>｜</span> <span>비밀번호찾기</span>
			</div>
		</div>
	</div>
</div>

<div id="modal-join">
	<div class="modal-body">
		<div class="modal-header">회원가입<span class="close" style="float:right;cursor:pointer">&times;</span></div>
		<div class="modal-content">
			<form action="${rootPath}/member/join" method="POST">
				<div class="in-box">
					<label for="m_userid" class="join-label">회원아이디</label> <input
						type="text" name="m_userid" id="m_userid"><br /> <span
						id="check_id"></span>
				</div>
				<div class="in-box">
					<label for="m_password" class="join-label">비밀번호</label> <input
						type="password" name="m_password" id="m_password">
				</div>
				<div class="in-box">
					<label for="m_re_password" class="join-label">비밀번호확인</label> <input
						type="password" name="m_re_password" id="m_re_password">
				</div>
				<div class="in-box">
					<label for="m_name" class="join-label">회원이름</label> <input
						type="text" name="m_name" id="m_name">
				</div>
				<div class="in-box">
					<label for="m_email" class="join-label">이메일</label> <input
						type="text" name="m_email" id="m_email">
				</div>
				<div class="in-box">
					<label for="m_tel" class="join-label">전화번호</label> <input
						type="text" name="m_tel" id="m_tel">
				</div>
				<div class="btn-box center">
					<button id="btn-join" type="button" class="bz-btn save">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$(function() {
		
		$("#login").click(function() {
			$("#modal-box").css('display', 'block')
		})
		$("#join").click(function() {
			$("#modal-join").css('display', 'block')
		})
 		$(".close").click(function () {
			$("#modal-box").css("display","none")
			$(".err_msg_id").text("");
			$(".err_msg_pass").text("");
			$(".userid").val("");
			$(".passpw").val("");
		})
		$(".btn-login").click(function() {
			var userid = $.trim($(".userid").val());
			var passpw =$.trim($(".passpw").val());
			var regEmpty =/\s/g; 
			alert(userid+","+passpw);
			
			if(userid == '' || userid.length ==0){
				$('.err_msg_id').text('아이디: 필수입력정보입니다.').css('visibility','visible')
				$(".err_msg_pass").text("");
				return false;
			}else if(userid.match(regEmpty)){
				$('.err_msg_id').text('공백없이 입력해주세요').css('visibility','visible')
				$(".err_msg_pass").text("");
				return false;
			}else if(passpw==''||passpw.length == 0){
				$('.err_msg_pass').text('비밀번호: 필수입력정보입니다.').css('visibility','visible')
				$(".err_msg_id").text("");
				return false;
			}else if(passpw.match(regEmpty)){
				$('.err_msg_pass').text('공백없이 입력해주세요').css('visibility','visible')
				$(".err_msg_id").text("");
				return false;		
			}
			$(".err_msg_id").text("");
			$(".err_msg_pass").text("");
			$.ajax({
				url:"${path}/member/login",
					type:"POST",
					async: true,
					dataType:"text",
					data: "userid="+userid+"&passpw="+passpw,
					success: function(data) {
						if(data =="1"){
								location.reload();
						}else if(data=="-1"){
							$('#input_id').focus();
							$('.err_msg').text('회원 아이디 또는 비밀번호가 일치하지않습니다').css('visibility','visible')
						}else{
							alert("Error")
						}
						
					},
				error:function(){
					alert("System Error o0o")
				}
			});
		})
		
	})
</script>
