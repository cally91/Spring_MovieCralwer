<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>
<%
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=20190906">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=2019090304">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090502">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/view.css?ver=20190917">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/button.css?ver=2019091001">
<title>Insert title here</title>

</head>
<body>

	<%@ include file="../include/include-header.jsp"%>
	<div class="body-1">
		<div class="bla"></div>
		<h1>커뮤니티 게시판</h1>
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd"
			var="date" />
		<table>
			<tr>
				<th class="th-1">제목</th>
				<td colspan=3>${one.title}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${date}</td>
				<th class="th-1">작성자</th>
				<td>${one.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>업데이트 예정</td>
				<th>조회수</th>
				<td>${one.viewcnt}</td>
			</tr>
			<tr>
				<td class="content" colspan=4>${one.content}</td>
			</tr>

		</table>
		<div class="btn-box center">
			<a href="${path}/board/list"><button class="bz-btn  list">
					목록</button></a>
			<c:if test="${sessionScope.name ==one.writer}">
				<button id="btn-update" class="bz-btn update">수정</button>
				<button id="btn-delete" class="bz-btn delete">삭제</button>
				<button id="btn-reply" class="bz-btn save">답글</button>
			</c:if>
		</div>

		<div id="reply_wrap">
			<div id="commentList"></div>
		</div>
	</div>

	<div id="modal-delete">
		<div class="detele_modalBox">
			<div class="delete_h1">게시글을 삭제</div>
			<div class="delete_d1">정말 삭제하겠습니까?</div>
			<div class="btn-box center">
				<button id="delete_yes" class="button_delete yes">예</button>
				<button id="delete_no" class="button_delete no">아니요</button>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		
		$("#btn-delete").click(function() {
			$("#modal-delete").css('display', 'block')
		})
		$("#delete_no").click(function() {
			$("#modal-delete").css('display', 'none')
		})
		$(document).on("click", "#delete_yes", function() {
			location.href = "${path}/board/delete?bno=${one.bno}"
		})
		function comment_list() {
			$.ajax({
				type : "get",
				url : "${path}/reply/list?bno=${one.bno}",
				success : function(page) {
					$('#commentList').html(page);
				}
			});
		}
		$(document).ready(function() {
			comment_list();
		})
		/* View.jsp에서 commenlist.jsp의 태그 이벤트 처리 할때 사용*/
		$(document).on("click", ".btn_comm.delete", function() {
			var rno = $(this).attr("data_num");
			var bno = '${one.bno}';
			$.ajax({
				url : "${path}/reply/delete",
				data : "rno=" + rno + "&bno=" + bno,
				success : function(result) {
					comment_list();
				},
				error : function() {
					alert("System error o0o");
				}

			})

		})
		$(document).on("click","#btn-reply",function(){
			
		})
			
		
		$(document)
				.on(
						"click",
						".bz-btn.comment",
						function() {
							oEditors.getById["reply_comment"].exec(
									"UPDATE_CONTENTS_FIELD", []);
							var context = $('#reply_comment').val()
							var text = context.replace(/[<][^>]*[>]/gi, "");
							if (text == null || text == "") {
								$("#reply_comment").focus();
								$(".error").css("display", "biock");
								return false;
							} else {
								var bno = '${one.bno}';
								$("#re_bno").val(bno);
								$
										.ajax({
											url : "${path}/reply/write",
											type : "POST",
											data : $("#frm_reply").serialize(),
											contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
											success : function() {
												comment_list();
												$("#reply_comment").val("");
											},
											error : function() {
												alert("System error o0o");

											}
										})
							}
						})
		$(document).on("click", "#btn-update", function() {
			location.href = "${path}/board/write?bno=${one.bno}";
		})
		$(document).on("click", "#btn-reply", function() {
			location.href="${path}/board/answer?bno=${one.bno}";
		})

	})
</script>

</html>