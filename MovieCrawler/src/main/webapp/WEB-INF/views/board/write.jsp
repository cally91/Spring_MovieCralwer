<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=20190906">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=2019090304">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090502">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/view.css?ver=2019091101">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/button.css?ver=20190916">
<style>
table.write {
	border: 1px solid black;
	margin: 100px 200px;
	width: 80%;
}

th.write_label {
	width: 10%;
	height: 50px;
	margin: 0 auto;
}

input.write_in {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<form action="" method="post" id="ref_commit">
		<table class="write">
			<tr>
				<th class="write_label">작성자:</th>
				<td>${sessionScope.name}</td>
			</tr>
			<tr>
				<th class="write_label">제목:</th>
				<td><input type="text" name="title" class="write_in"
					value="${one.title}" /></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content" id="board_comment"
						class="reply_comment_style" placeholder="댓글을 입력하세요">${one.content}</textarea>
					<script type="text/javascript"
						src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
						charset="utf-8"></script> <script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator
									.createInIFrame({
										oAppRef : oEditors,
										elPlaceHolder : "board_comment",
										sSkinURI : "${path}/resources/smarteditor/SmartEditor2Skin.html",
										fCreator : "createSEditor2",
										htParams : {
											fOnBeforeUnload : function() {
											}
										}
									});
						</script></td>
			</tr>
		</table>
	</form>
	<div class="btn-box right">
		<button class="bz-btn save" id="btn-save">게시글 등록</button>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#btn-save").click(
				function() {
					oEditors.getById["board_comment"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					var context = $('#board_comment').val()
					var text = context.replace(/[<][^>]*[>]/gi, "");
					if (text == null || text == "") {
						$("#board_comment").focus();
						$(".error").css("display", "biock");
						return false;
					} else {
						$('#ref_commit').submit();
					}
				})
		$(document)
				.ready(
						function() {
							var bno = "${one.bno}"
							if (bno == '') {

							} else {
								$(".bz-btn.save")
										.css("background-color", "red").css(
												"border", "1px solid red")
										.text("게시글 수정");
								var str = '';
								str += "<input type ='hidden' name ='bno' value='"+bno+"'>"
								$("#ref_commit").append(str);
							}

						})
		$(document)
				.ready(
						function() {
							var flag = '${flag}';
							if (flag == "answer") { // 답글 페이지
								$(".bz-btn.save").text("답글 등록");
							} else {
								var bno = '${one.bno}';
								if (bno == '') {
								} else {
									$(".button-btn-in").text("수정");
									var str = '';
									str += "<input type='hidden' name='bno' value='" + bno + "'>";
									$("#frm_content").append(str);
								}
							}

						})
	})
</script>
</html>