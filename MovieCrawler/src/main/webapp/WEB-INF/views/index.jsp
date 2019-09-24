<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>핀냐무비</title>
<style type="text/css">
a.no_decoration{
text-decoration: none;
color: black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css?ver=20190918">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/album.css?ver=20190917">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/common.css?ver=2019090301">

</head>
<body>
	<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
	<div class="bla"></div>
	<h1 class="movie_sort">실시간 순위</h1>
	<div class="movie_sort">
		<span><a href="${path}/sort?sort=booking">예매순</a></span> <span>|</span>
		<span><a href="${path}/sort?sort=score">평점순</a></span> <span>|</span>
		<span><a href="${path}/sort?sort=date">개봉일순</a></span>
	</div>
	<article class="grid-container">


		<c:forEach items="${rankList}" var="one" varStatus="status">
			<a href="${path}/movie/detail?code=${one.daumcode}" class="no_decoration">
				<div class="bz-card">
					<div class="bz-card-content">${status.count}위</div>
					<div class="movie-card">
						<img src="${one.imgsrc}">
						<div class="movie-card-ty">
							<div class="movie-card-ay">
								<div class="movie-card-ta">개요</div>
								<div>${one.type}</div>
								&nbsp;
								<div>${one.runtime}분</div>
								&nbsp;
								<div>${one.opendate}</div>
							</div>
							<div class="movie-card-ay">
								<div class="movie-card-ta">감독</div>
								<div>${one.director}</div>
							</div>
							<div class="movie-card-ay">
								<div class="movie-card-ta">출연</div>
								<div>${one.actor}</div>
							</div>
							<div class="movie-card-ay">
								<div class="movie-card-ta">예매율</div>
								<div>${one.bookingrate}</div>
							</div>
							<div class="movie-card-ay">
								<div class="movie-card-ta">평점</div>
								<div>네이버 : ${one.naverscore} 다음 : ${one.daumscore}</div>
							</div>
							<div class="movie-card-ay">
								<div class="movie-card-ta">코드</div>
								<div>네이버 : ${one.navercode} 다음 : ${one.daumcode}</div>
							</div>
						</div>

					</div>

					<div class="bz-card-content">${one.movie}</div>

				</div>
			</a>
		</c:forEach>

	</article>
	<script type="text/javascript">
		$(function() {
			var sort = "${sort}";

			if (sort == "booking") {
				$('div.movie_sort > span:eq(0)').css('color', 'crimson').css(
						'font-weight', 'bold');
			} else if (sort == "score") {
				$('div.movie_sort > span:eq(2)').css('color', 'crimson').css(
						'font-weight', 'bold');
			} else if (sort == "date") {
				$('div.movie_sort > span:eq(4)').css('color', 'crimson').css(
						'font-weight', 'bold');
			}
		})
	</script>
	<script type="text/javascript" src="${path}/resources/js/header.js"></script>

</body>
<%@ include file="./include/include-footer.jsp"%>
</html>