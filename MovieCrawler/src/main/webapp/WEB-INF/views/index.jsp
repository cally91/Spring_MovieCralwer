<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
table.list {
    border-collapse: collapse;
    border-spacing: 0;
    width:96%;
    border:1px solid #ccc;
    margin:10px auto;
    text-align: center;
}

table.list tr{
    border:1px solid #ddd;
}

table.list tr:nth-child(even) {
    background-color: #ccc;
}
table.list tr:nth-child(odd) {
    background-color: #fff;
}

table.list tr:hover {
    background-color: #ddd;
    cursor: pointer;
}

table.list th {
	text-align: inherit;
}

table.list td, table.list th{
    padding:8px;
    vertical-align:top;
}

table.list td:first-child, table.list th:first-child {
    padding-left: 16px;
}
</style>

</head>
<body>
	<table class="list">
		<thead>
			<tr>
				<th>Rank</th>
				<th>img</th>
				<th>제목(애매율)</th>
				<th>네이버 평점 </th>
				<th>다음평점</th>
				<th>장르</th>
				<th>개봉일 | 상영시간</th>
				<th>감독</th>
				<th>배우</th>
			<th>네이버 코드</th>
			<th>다음 코드</th>	
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rankList}" var="one">
				<tr>
					<td>${one.rank}</td>
					<td><img src="${one.imgsrc}"></td>
					<td>${one.movie}(${one.bookingrate})</td>
					<td>${one.naverscore}</td>
					<td>${one.daumscore}</td>
					<td>${one.type}</td>
					<td> ${one.opendate} | ${one.runtime}분</td>
					<td>${one.director}</td>
					<td>${one.actor}</td>
					<td>${one.navercode}</td>
					<td>${one.daumcode}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>