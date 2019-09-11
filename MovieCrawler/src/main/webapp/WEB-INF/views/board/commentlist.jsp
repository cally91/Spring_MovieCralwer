<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.reply_comment_header {
	background-color: #ddd;
	padding: 10px;
}

.btn_re {
	width: 70px;
	height: 25px;
	margin-left: 10px;
}

.reply_comment_name {
	display: none;
}

.not_reply_comment {
	
}

.reply_comment_style {
	width: 99%;
	height: 100px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h3 class="reply_comment_h3">전체 댓글(${replyList.size()})</h3>
	<c:if test="${sessionScope.name == sessionScope.userid}">
		<h2 class="reply_comment_header">로그인한후 댓글창이나옵니다.</h2>
	</c:if>
	
	<c:if test="${sessionScope.name != sessionScope.userid}">
		<form action="replyAdd.fcryan" method="POST" name="frm_reply" id="frm_reply">
			<div class="reply_comment_header">
				<div class="reply_comment_name">
					작성자 : ${sessionScope.name} <span> 작성일: 2019-09-10 </span>
				</div>
				<textarea name="content" id="reply_comment" class="reply_comment_style"
					placeholder="댓글을 입력하세요"></textarea>
				<script type="text/javascript"
					src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js"
					charset="utf-8"></script>
				<script type="text/javascript">
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
				</script>


				<button type="button" id="bz-btn_comment" class="bz-btn comment">등록</button>
			</div>
			<br />
			<input type="hidden" id="re_bno" name="bno"> 
		</form>
	</c:if>

	<c:choose>
		<c:when test="${replyList.size() != 0}">
			<c:forEach items="${replyList}" var="replyView">
				<div class="reply_comment_card">
					<div class="reply_comment_writer">
						${replyView.writer} <span class="reply_comment_day">
							${replyView.regdate} </span>
					</div>
					<div class="reply_comment_contents">${replyView.content}</div>
					<c:if test="${sessionScope.name ==replyView.writer}">
						<button class="btn_re">답글</button>
						<button class="btn_comm updata">수정</button>
						<button class="btn_comm delete" data_num="${replyView.rno}">삭제</button>
					</c:if>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="not_reply_comment">
				<h2>댓글이 없습니다 첫 댓글을 작성해주세요</h2>
			</div>
		</c:otherwise>
	</c:choose>


</body>
</html>