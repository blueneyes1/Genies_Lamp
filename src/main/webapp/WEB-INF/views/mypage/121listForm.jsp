<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록보기</title>
	<style>
		* {
			margin: 0 auto;
			padding: 0 auto;
			overflow: hidden;
		}
		td, h2 {
			text-align: center;
		}
	</style>
	
</head>
<body>
	<h2>1대1 게시판 글목록</h2>
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		
		<c:forEach var="dto" items="${ list }">
			<tr>
				<td>${ dto.one2one_idx }</td>
				<td>${ dto.one2one_member_id }</td>
				<td>
					<a href="contentForm?one2one_idx=${dto.one2one_idx}"> ${ dto.one2one_title } </a>
				</td>
				<td>
					<c:set var="dateVar" value="${ dto.one2one_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5"><a href="writeForm">문의작성</a></td>
		</tr>
	</table>
	
	<script>
		/* 웹브라우저 back키 누를때, 페이지 재로딩  */
		window.onpageshow = function(event) {
		    if (event.persisted) {
		        document.location.reload();
		    }
		};
	</script>
</body>
</html>



