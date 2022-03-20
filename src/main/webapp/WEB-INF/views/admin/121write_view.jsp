<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form action="write.do" method="post">
		
		<table width="500" cellpadding="0" cellspacing="0" border="1">
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="one2one_name" value="" size="50" /> </td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="one2one_title" value="" size="50" /> </td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="10" cols="50" name="one2one_content"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"> 
				<input type="submit" value="쓰기">&nbsp;&nbsp;
				<a href="list.do"><input type="button" value="목록"/></a>
			</td>
		</tr>
		
		</table>
	
	
	</form>
	
	
</body>
</html>