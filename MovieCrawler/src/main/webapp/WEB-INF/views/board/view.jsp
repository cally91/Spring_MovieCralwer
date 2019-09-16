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
	href="${path}/resources/css/view.css?ver=2019091101">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/button.css?ver=2019091001">
<title>Insert title here</title>

</head>
<body>

	<%@ include file="../include/include-header.jsp"%>

	<div class="body-1">
		<div class="bla"></div>

		<h3>커뮤니티 게시판</h3>
		<table>
			<tr>
				<th class="th-1">제목</th>
				<td colspan=3>${one.title}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${one.regdate}</td>
				<th class="th-1">작성자</th>
				<td>${one.writer}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>1651</td>
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
				<button class="bz-btn update">수정</button>
				<button id="btn-delete" class="bz-btn delete">삭제</button>
				<button id="btn-reply" class="bz-btn save">답글</button>
			</c:if>
		</div>

		<div id="reply_wrap">
			<div id="commentList"></div>
		</div>
	</div>
</body>
<script>
	$(function() {

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

	})
</script>

</html>