<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<<<<<<< HEAD
<style>

table.noticetable{
border-collapse:separate;
border-spacing:0;
text-align:left;
line-height:1.5;
border-top:1px solid #ccc;
border-left:1px solid #ccc;
margin: auto;
width:800px;
}

table.noticetable th{
width:50px;
padding : 10px;
font-weight:bold;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
border-top: 1px solid #fff;
border-left: 1px solid #fff;
background:	#F5F5DC;
}
table.noticetable td{
width:250px;
padding : 10px;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
}


.btn{
background-color: #87CEFA;
float:right;
}

.writelistbtn{
margin: auto;
}

</style>



</head>
<body>
<form action="faqupdateAction" method="post">
<table class="noticetable" border="1" color="black" width="500">
=======
</head>
<body>
<form action="faqupdateAction" method="post">
<table class="faqtable" border="1" color="black" width="500">
>>>>>>> dev
<input type="hidden" name="faq_idx" value="${viewDto.faq_idx }"/>
	
	
	<tr>
	<th>번호</th>
	<td>${ viewDto.faq_idx }</td>
	
	<tr>
		<th>제목</th>
		<td><input type="text" name="faq_title" size="50" value="${viewDto.faq_title }"></td>
	</tr>
	
	
	 <tr>
	 <th>내용</th>
<<<<<<< HEAD
	 <td><textarea rows="10" cols="100" name="faq_content">${viewDto.faq_content }</textarea></td>
=======
	 <td><textarea rows="10" cols="50" name="faq_content">${viewDto.faq_content }</textarea></td>
>>>>>>> dev
	 </tr>
	 
</table>
	
	
	
	<input type="submit" value="수정">
		</form>

	<input type="button" value="목록" onclick="window.location.href='/faq/FaqForm'">
	<a href="/faq/faqdeleteAction?faq_idx=${viewDto.faq_idx }"><input type="button" value="삭제하기"></a>



</body>
</html>