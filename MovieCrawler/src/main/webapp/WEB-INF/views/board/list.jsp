<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/include.jsp"%>
<%
	String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=2019090302">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=20190917">
<title>핀냐무비 : 커뮤니티</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.page li {
	list-style: none;
	margin: 0 10px;
}

.page li a {
	text-decoration: none;
}

.btn_search {
	width: 60px;
	height: 30px;
}
h1{
margin-top: 100px;
}
td{
height: 40px;
}
button.bz-btn.add{
	background-color: olive;
	border: 2px solid olive;
	color:white;
}
li.button_on{
border: 1px solid black;
padding: 5px;
color: black;
cursor: pointer; 
border-radius: 5px;
}
li.button_on a{
color: black;
cursor: pointer;
}
li.button_on:hover{
border: 1px solid red;
border-radius: 5px;
}
li.button_on a:hover{
color: red;
cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="../include/include-header.jsp"%>
	<div class="body">
		<div class="bla"></div>
		<h1>커뮤니티</h1>

		<div class="table">
			<span><a
				href="${path}/board/list?sort_option=new&search_option=${map.search_option}&keyword=${map.keyword}">최신순</a></span>
			<span>&nbsp;</span> <span><a
				href="${path}/board/list?sort_option=view&search_option=${map.search_option}&keyword=${map.keyword}">조회순</a></span>
			<span>&nbsp;</span> <span><a
				href="${path}/board/list?sort_option=reply&search_option=${map.search_option}&keyword=${map.keyword}">댓글순</a></span>
		</div>
		<div class="input">
			<c:if test="${map.keyword != ''}">
				<span>"${map.keyword}" 검색 결과 총${map.count}건 입니다</span>
			</c:if>
			<select id="selsearch" class="select" name="type">
				<option value="all" selected="selected">제목+내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" id="search_board" placeholder="검색할 값을 입력하세요">
			<button onclick="search_board()" class="btn_search" id="search_btn" >검색</button>
		</div>
		<table>
			<tr>
				<td class="td-1">NO</td>
				<td class="td-2">제목</td>
				<td class="td-3">작성자</td>
				<td class="td-4">조회수</td>
				<td class="td-5">댓글수</td>
				<td class="td-6">첨부파일</td>
				<td class="td-7">등록일자</td>
			</tr>
			<c:choose>
				<c:when test="${empty map.list}">
					<tr>
						<td colspan="6">게시글이없습니다</td>
				</c:when>
				<c:otherwise>
					<c:forEach items="${map.list}" var="bDTO">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						<fmt:formatDate value="${bDTO.regdate}" pattern="yyyy-MM-dd" var="regdate" />
						<tr>
							<td>${bDTO.bno}</td>
							<td><c:choose>
									<c:when test="${today == regdate}">
										<a  class="title" href="${path}/board/view?bno=${bDTO.bno}">${bDTO.title}</a>
										<span class="new">new</span>
									</c:when>
									<c:otherwise>
										<a class="title" href="${path}/board/view?bno=${bDTO.bno}">${bDTO.title}</a>
									</c:otherwise>
								</c:choose></td>
							<td>${bDTO.writer}</td>
							<td>${bDTO.viewcnt}</td>
							<td>${bDTO.replycnt}</td>
							<td><i class="fas fa-ban"></i></td>
							<td><c:choose>
									<c:when test="${today == regdate}">
										<fmt:formatDate pattern="hh:mm:ss" value="${bDTO.regdate}" />
									</c:when>
									<c:otherwise>
							${regdate}
						</c:otherwise>
								</c:choose></td>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="button">
			<ul class="page" style="display: flex; justify-content: center">
				<c:if test="${map.pager.curBlock > 1}">

					<li class="button_on"><a
						href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}"><i
							class="fas fa-angle-left"></i></a></li>
					<li class="button_on"><a
						href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">1</a></li>
					<li class="button_on">...</li>
				</c:if>
				<c:forEach begin="${map.pager.blockBegin}"
					end="${map.pager.blockEnd}" var="idx">
					<li class="button_on"
						<c:out value="{map.pager.curPage == idx ?
				'class=active':''}"/>>
						<a
						href="${path}/board/list?curPage=${idx}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">${idx}</a>
					</li>

				</c:forEach>


				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<li>...</li>
					<li><a
						href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}">${map.pager.totPage}</a></li>
					<li><a
						href="${path}/board/list?curPage=${map.pager.blockEnd+1}&sort_option=${map.sort_option}&search_option=${map.search_option}&keyword=${map.keyword}"><i
							class="fas fa-angle-right"></i></a></li>
				</c:if>
			</ul>
		</div>
		<div class="button-input">
			<button id="write" class="bz-btn add">게시글 등록</button>
			<button id="re" class="bz-btn reset">처음으로</button>
		</div>

	</div>
	<script type="text/javascript">
		$(function() {
			var sort_option = "${map.sort_option}";

			if (sort_option == "new") {
				$('div.table > span:eq(0)').css('color', 'crimson').css(
						'font-weight', 'bold');
			} else if (sort_option == "view") {
				$('div.table > span:eq(2)').css('color', 'crimson').css(
						'font-weight', 'bold');
			} else if (sort_option == "reply") {
				$('div.table > span:eq(4)').css('color', 'crimson').css(
						'font-weight', 'bold');
			}

			$('#search_btn').click(
					function() {
						var search_option = $('#selsearch').val();
						var keyword = $.trim($('#search_board').val());

						// 유효성체크
						if (keyword == null || keyword.length == 0) {
							$('#search_board').focus();
							$('#search_board').css('border',
									'1px solid Crimson');
							return false;
						}

						location.href = "${path}/board/list?sort_option="
								+ sort_option + "&search_option="
								+ search_option + "&keyword=" + keyword;
					});
			$('#re').click(function() {
				location.href = "${path}/board/list";
			});
			$('#write').click(function() {
				location.href = "${path}/board/write";
			});
			$(document).ready(function() {
				$("#search_board").keydown(function(key) {
					if (key.keyCode == 13) {
						$("#search_btn").click();
					}
				});
			});

		});
		// 조회수보존(뒤로가기)
		window.onpageshow = function(event) {
			if (event.persisted
					|| (window.performance && window.performance.navigation.type == 2)) {
				location.reload();
			}
		}
	</script>
</body>
<%@ include file="../include/include-footer.jsp"%>
</html>