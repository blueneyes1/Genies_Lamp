<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
<form action="faqwriteAction" method="post">
<table class="faqtable" border="1" color="black" width="500">
	
	<tr>
	<th>번호</th>
	<td>${faq_dto.faq_idx }</td>
	
	<tr>
		<th>제목</th>
		<td><input type="text" name="faq_title" value="" size="50"></td>
	</tr>
	
	<tr>
	<th>작성일</th>
	<td>   <c:set var="dateVar" value="${ faq_list.faq_date }" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ faq_dto.faq_date }" /></td>
	 </tr>
	 
	 <tr>
	 <th>내용</th>
	 <td><textarea rows="10" cols="50" name="faq_content"></textarea></td>
	 </tr>
	 
</table>
	
	
	
	<input type="submit" value="작성">
		</form>

	<input type="button" value="목록" onclick="window.location.href='/faq/FaqForm'">




</body>
</html>