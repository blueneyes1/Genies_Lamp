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
.main{
padding-bottom:20px;


}
.tablesize{
width:100%;
display:flex;
justify-content:center;
align-items:center;
margin-left: auto; 
margin-right: auto;
}



.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 5px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;

}

.w-btn-outline {
    position: relative;
    padding: 10px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: rgb(178, 178, 238);
    color: aliceblue;
}

.w-btn-indigo-outline {
    border: 3px solid rgb(178, 178, 238);
    color: rgb(178, 178, 238);
}

.w-btn-indigo-outline:hover {
    color: rgb(178, 178, 238);
    background: aliceblue;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}
.writebtn{
float:right;

}


</style>

</head>
	 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	


<body>
<div class="main">


<form action="updateAction" method="post">
<div class="tablesize">
	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
	<input type="hidden" name="notice_idx" value="${viewDto.notice_idx }"/>
  <thead>
    <tr>
      <th scope="row">번호</th>
       <td>${viewDto.notice_idx }</td>
     
    </tr>
  </thead>
  <tbody>
     
     <tr>
      	<th scope="row">제목</th>
      	<td ><input type="text" name="notice_title" size="78" value="${viewDto.notice_title }"></td>
     </tr>
    
    <tr>
      	<th scope="row">작성일</th>
      	<td><c:set var="dateVar" value="${ viewDto.notice_date }" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ viewDto.notice_date }" /></td>
    </tr>
    
    <tr>
      	<th scope="row">내용</th>
    	 <td><textarea rows="10" cols="80" name="notice_content">${viewDto.notice_content }</textarea></td>
    </tr>
 
  </tbody>
</table>

</div>

<div class="writebtn">
	<button type="submit" class="w-btn w-btn-indigo">수정</button>
		</form>

	<input type="button" class="w-btn w-btn-indigo" value="목록" onclick="window.location.href='/notice/NoticeForm'">
	<a href="/notice/deleteAction?notice_idx=${viewDto.notice_idx }"><input type="button" class="w-btn w-btn-indigo" value="삭제"></a>
</div>
</div>





<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
