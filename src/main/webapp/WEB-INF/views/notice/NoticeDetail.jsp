<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.main{
padding-bottom:20px;
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



<div class="tablesize">
	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
	<input type="hidden" name="notice_idx" value="${viewDto.notice_idx }"/>
  <thead>
    <tr>
      <th scope="row">번호</th>
       <td>${notice_dto.notice_idx }</td>
     
    </tr>
  </thead>
  <tbody>
     
     <tr>
      	<th scope="row">제목</th>
      		<td>${notice_dto.notice_title }</td>		
     </tr>
    
    <tr>
      	<th scope="row">작성일</th>
      <td> 
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ notice_dto.notice_date }" /></td>
    </tr>
    
    <tr>
      	<th scope="row">내용</th>
    	<td colspan="2" width="800" height="80">${notice_dto.notice_content }</td>
    </tr>
 
  </tbody>
</table>

</div>

<div class="writebtn">
<input type="hidden" name="notice_idx" value="${ notice_dto.notice_idx }">
	<c:if test="${ member_grade eq 'A' }">
	<a href="/notice/NoticeContent?notice_idx=${ notice_dto.notice_idx }">
		<button class="w-btn w-btn-indigo"  >수정</button>
	</a></c:if>

	<input type="button" class="w-btn w-btn-indigo" value="목록" onclick="window.location.href='/notice/NoticeForm'">
	
</div>

</div>

 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
