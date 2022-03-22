<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<title>공지사항 상세</title>

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

.wbtn{
background-color: #87CEFA;
float:right;
}

.wbtn:active {
    transform: scale(1.5);
}



</style>

</head>


<div class="noticetablemanin">
<body>
<form action="updateAction" method="post">
<table class="noticetable" border="1" color="black" width="500">
<input type="hidden" name="notice_idx" value="${viewDto.notice_idx }"/>
	
	
	<tr>
	<th>번호</th>
	<td>${ viewDto.notice_idx }</td>
	
	<tr>
		<th>제목</th>
		<td><input type="text" name="notice_title" size="50" value="${viewDto.notice_title }"></td>
	</tr>
	
	<tr>
	<th>작성일</th>
	<td>   <c:set var="dateVar" value="${ viewDto.notice_date }" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ viewDto.notice_date }" /></td>
	 </tr>
	 
	 <tr>
	 <th>내용</th>

	 <td><textarea rows="10" cols="100" name="notice_content">${viewDto.notice_content }</textarea></td>

	 </tr>
	 
</table>
	
	

	<button type="submit" class="wbtn">수정</button>
		</form>

	<input type="button" class="wbtn" value="목록" onclick="window.location.href='/notice/NoticeForm'">
	<a href="/notice/deleteAction?notice_idx=${viewDto.notice_idx }"><input type="button" class="wbtn" value="삭제하기"></a>

</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
