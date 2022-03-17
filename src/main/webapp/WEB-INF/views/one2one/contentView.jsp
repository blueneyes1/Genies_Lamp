<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
</head>
<body>
	
	<form action="modify.do" method="post">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
		    <input type="hidden" name="board_idx" value="${ dto.one2one_idx }" />
		    <input type="hidden" name="board_name" value="${ dto.one2one_name }" />
			<tr>
				<td>번호</td>
				<td>${ dto.one2one_idx }</td>
			</tr>
			<tr> 
				<td>이름</td>
				<td>${ dto.one2one_name }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title" value="${ dto.one2one_title }"> </td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea rows="3" cols="50" name="board_content">${ dto.one2one_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 하나의 form에 여러 submit을 사용가능.  -->
					<input type="submit" value="수정" />&nbsp;&nbsp;
					<input type="submit" value="목록" formaction="list.do" />&nbsp;&nbsp;
					<input type="submit" value="삭제" formaction="delete.do" />
					
					<%-- 
					<a href="list.do"><input type="button" value="목록"/></a>&nbsp;&nbsp;
					<a href="delete.do?board_idx=${ dto.board_idx }"><input type="button" value="삭제"/></a> 
					--%>
				</td>
			</tr>
			
		</table>
	</form>
	
	<br>
	
	<form action="reply.do" method="post">
		<input type="hidden" name="reply_board_idx" value="${ dto.one2one_idx }" />
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<td colspan="2">
					<label>댓글</label> <textarea rows="2" cols="50" name="reply_content"></textarea> <br>
					<label>관리자</label> <input type="text" name="reply_name" value=""/> 
					<input type="submit" value="댓글"/>
				</td>
			</tr>
		</table>
	</form>
	<br>
	
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>관리자</th>
			<th>내용</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="One2one_replyDto" items="${ reply_list }">
		<tr>
			<td>${ One2one_replyDto.one2one_reply_name }</td>
			<td>${ One2one_replyDto.one2one_reply_content }</td>
			<td>${ One2one_replyDto.one2one_reply_date }</td>
			<td><a href="reply_delete.do?reply_idx=${ One2one_replyDto.one2one_reply_idx }&reply_board_idx=${ One2one_replyDto.reply_one2one_idx }"><input type="submit" value="삭제"/></a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>

