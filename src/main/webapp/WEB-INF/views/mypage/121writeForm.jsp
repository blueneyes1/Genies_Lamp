<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의하기</title>
	
</head>
<body>
	<h2>문의하기</h2>
	
	<form action="writeAction" method="post">
		<table width="500" cellpadding="0" cellspacing="0" border="1">
			
			<tr>
				<td>아이디</td>
				<td><input type="text" name="one2one_member_id" value="" size="50"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="one2one_title" value="" size="50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="50" name="one2one_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;&nbsp;<input type="submit" value="글쓰기">&nbsp;&nbsp;
					<a href="listForm"><input type="button" value="목록보기"></a>
				</td>
			</tr>
		
		</table>
	</form>
	
</body>
</html>