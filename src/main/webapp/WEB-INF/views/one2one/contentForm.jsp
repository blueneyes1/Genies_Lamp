<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의</title>
	
</head>
<body>
	<h2>문의내용</h2>
	
	<form action="updateAction" method="post">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<input type="hidden" name="one2one_idx" value="${ dto.one2one_idx }" />
			<tr>
				<td>번호</td>
				<td>${ dto.one2one_idx }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="one2one_name" value="${ dto.one2one_name }" size="50"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="one2one_title" value="${ dto.one2one_title }" size="50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="50" name="one2one_content"> ${ dto.one2one_content } </textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;&nbsp;<input type="submit" value="수정하기">&nbsp;&nbsp;
					<a href="listForm"><input type="button" value="목록보기"></a>&nbsp;&nbsp;
					<a href="deleteAction?one2one_idx=${ dto.one2one_idx }"><input type="button" value="삭제하기"></a>
				</td>
			</tr>
		
		</table>
	</form>

	<br>	
	
	<form action="writeReplyAction" method="post">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td colspan=""2>
					<input type="hidden" name="reply_board_index" value="${ dto.one2one_idx }">
					<label>답변</label><textarea rows="2" cols="50" name="reply_content"></textarea><br>
					<label>관리자</label><input type="text" name="reply_name" value=""><br>
					<input type="submit" value="댓글달기">
				</td>
			</tr>
		</table>
	</form>
	
	<br>
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>이름</th>
			<th>내용</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="reply_dto" items="${ reply_list }">
			<tr>
				<td>${ One2one_replyDto.one2one_reply_name }</td>
				<td>${ One2one_replyDto.one2one_reply_content }</td>
				<td>
					<c:set var="dateVar" value="${ One2one_replyDto.one2one_reply_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
				<td><a href="deleteReplyAction?reply_idx=${ One2one_replyDto.one2one_reply_idx }&board_idx=${ dto.one2one_idx }"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html>







