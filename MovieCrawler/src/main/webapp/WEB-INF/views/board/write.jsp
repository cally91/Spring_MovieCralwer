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
	<table class="write">
		<tr>
			<th class="write_label">작성자:</th>
			<td>${sessionScope.name}</td>
		</tr>
		<tr>
			<th class="write_label">제목:</th>
			<td><input type="text" class="write_in" /></td>
		</tr>
		<tr>
			<td colspan="2"><textarea name="content" id="reply_comment"
					class="reply_comment_style" placeholder="댓글을 입력하세요"></textarea> <script
					type="text/javascript"
					src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
					charset="utf-8"></script> <script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator
								.createInIFrame({
									oAppRef : oEditors,
									elPlaceHolder : "reply_comment",
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
	<div class="btn-box right">
		<button class="bz-btn save" id= "btn-save">저장</button>
	</div>
</body>
<script type="text/javascript">
$(function() {
	$('#btn-save').click(function() {
		location.href = "${path}/board/list";
	});
})
</script>
</html>