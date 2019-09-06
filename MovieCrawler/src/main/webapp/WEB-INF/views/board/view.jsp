<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>
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
	href="${path}/resources/css/view.css?ver=20190906">
	<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/button.css?ver=20190906">
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
			<button class="bz-btn  list">목록 </button>
			<button class="bz-btn update">수정</button>
			<button id="btn-delete" class="bz-btn delete">삭제</button>
			<button id="btn-reply" class="bz-btn save">답글</button>
		</div>
	</div>
</body>
</html>