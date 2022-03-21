<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<head>
<style>

.menu{width:800px; margin: 0 auto}

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

<div class=main>



<table class="noticetable" border="1" color="black" width="500">

	<tr>
		<th>제목</th>
		<td>${notice_dto.notice_title }</td>		
	</tr>
	<tr>
	<th>작성일</th>
	<td> 
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ notice_dto.notice_date }" /></td>
	 </tr>
	 <tr>

	 	<td colspan="2" width="500" height="80">${notice_dto.notice_content }</td>

	 	
	 </tr>
</table>
	
	
	
	<div class="writelistbtn">
	<input type="hidden" name="notice_idx" value="${ notice_dto.notice_idx }">

	<input type="button" class="btn" value="목록" onclick="window.location.href='/notice/NoticeForm'">
	
	<c:if test="${ member_grade eq 'A' }">
	<a href="/notice/NoticeContent?notice_idx=${ notice_dto.notice_idx }">
		<input type="button" class="btn" value="수정" >
	</a></c:if>
	</div>
</div>

	


</body>
</html>