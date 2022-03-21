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
<<<<<<< HEAD
<body>
<form action="writeAction" method="post">
<table class="noticetable" border="1" color="black" width="500">
=======
<style>
.menu{width:800px; margin: 0 auto}




table.NFForm{
border-collapse:separate;
border-spacing:0;
text-align:left;
line-height:1.5;
border-top:1px solid #ccc;
border-left:1px solid #ccc;
margin: 20px 10px;
width:800px;
}

table.NFForm th{
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
table.NFForm td{
width:250px;
padding : 10px;
vertical-align:top;
border-right :1px solid #ccc;
border-bottom : 1px solid #ccc;
}

.contanier-fluid{
margin:auto;
}
.writebtn
color:cyan;

.topline{
position:relative;
}

.name{
position: absolute;
top: 50%;
text-align: center;

}
</style>


<body>
 <div class="menu">
<div class="NFtable">
<form action="writeAction" method="post">
<table class="NFForm">
>>>>>>> dev
	
	<tr>
	<th>번호</th>
	<td>${notice_dto.notice_idx }</td>
	
	<tr>
		<th>제목</th>
		<td><input type="text" name="notice_title" value="" size="50"></td>
	</tr>
	
	<tr>
	<th>작성일</th>
	<td>   <c:set var="dateVar" value="${ notice_list.notice_date }" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ notice_dto.notice_date }" /></td>
	 </tr>
	 
	 <tr>
	 <th>내용</th>
<<<<<<< HEAD
	 <td><textarea rows="10" cols="50" name="notice_content"></textarea></td>
	 </tr>
	 
</table>
=======
	 <td><textarea rows="10" cols="80" name="notice_content"></textarea></td>
	 </tr>
	 
</table>
	</div>
	</div>
>>>>>>> dev
	
	
	
	<input type="submit" value="작성">
		</form>

	<input type="button" value="목록" onclick="window.location.href='/notice/NoticeForm'">




</body>
</html>