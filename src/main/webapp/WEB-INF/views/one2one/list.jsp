<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1문의 게시판</title>
<style>
* {
	margin: 0 auto;
	padding: 0 auto;
	overflow: hidden;
}

td, h1 {
	text-align: center;
}
</style>
<script>
	/* 웹브라우저 back키 누를때, 페이지 재로딩  */
	window.onpageshow = function(event) {
	    if (event.persisted) {
	        document.location.reload();
	    }
	};
</script>
</head>
<body>
	<h1>1대1 문의</h1>

	<table width="500" cellpadding="0" cellspacing="0" border="1">

		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
		<c:forEach var="dto" items="${ list }">
			<tr>
				<td>${ dto.one2one_idx }</td>
				<td>${ dto.one2one_name }</td>
				<td><a href="content_view.do?one2one_idx=${dto.one2one_idx}">
						${ dto.one2one_title }</a></td>
				<td>${ dto.one2one_date }</td>
			</tr>

		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view.do">글작성</a></td>
		</tr>

	</table>

</body>
</html>