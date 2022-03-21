<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의 내용</title>
	
</head>
<body>
	<h2>문의 내용</h2>
	
	<form action="updateAction" method="post">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<input type="hidden" name="one2one_idx" value="${ dto.one2one_idx }" />
			<tr>
				<td>번호</td>
				<td>${ dto.one2one_idx }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${ dto.one2one_member_id }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${ dto.one2one_title }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					 ${ dto.one2one_content }
				</td>
			</tr>
			
		
		</table>
	</form>

	<br>	
	
	<form action="writeReplyAction" method="post">
	<input type="hidden" name="one2one_reply_one2one_idx" value="${ dto.one2one_idx }" />
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
	    	<c:if test="${ member_grade eq 'A' }">
	    		
				<td colspan=""2>
					
					<label>댓글</label><textarea rows="2" cols="50" name="one2one_reply_content"></textarea><br>
					<label>아이디</label><input type="text" name="one2one_reply_member_id" value="${ member_id }"><br>
					<input type="submit" value="답글달기">
				</td>
				
			</c:if>
			</tr>
		</table>
	</form>
	
	
	<br>
	
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>아이디</th>
			<th>내용</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="reply_dto" items="${ reply_list }">
			<tr>
			<input type="hidden" name="one2one_reply_idx" value="${ reply_dto.one2one_reply_idx }" />
			<input type="hidden" name="one2one_reply_one2one_idx" value="${ reply_dto.one2one_reply_one2one_idx }" />
				<td>${ reply_dto.one2one_reply_member_id }</td>
				<td>${ reply_dto.one2one_reply_content }</td>
				<td>
					<c:set var="dateVar" value="${ reply_dto.one2one_reply_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
				<td><a href="/admin/deleteReplyAction?one2one_reply_idx=${ reply_dto.one2one_reply_idx }&one2one_reply_one2one_idx=${ reply_dto.one2one_reply_one2one_idx }"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>







