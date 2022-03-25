<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>FAQ 상세</title>
<style>
.main{
padding-bottom:20px;

font-size: 12px;

}
.tablesize{
width:100%;
display:flex;
justify-content:center;
align-items:center;
margin-left: auto; 
margin-right: auto;
}

#notice_btn {
background-color: rgb(178, 178, 238);
border: none;
width: 90px;
height: 25px;
color: rgb(17, 17, 17);
border-radius: 3px;
}

.writebtn{
float:right;

}



</style>

</head>
	 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	



</head>
<body>

</head>
<body>
<div class="main">
<form action="faqupdateAction" method="post">
 <table class="table table-sm"  style="margin-left: auto; margin-right: auto;">
	<input type="hidden" name="faq_idx" value="${viewDto.faq_idx }"/>
  <thead>
    <tr>
      <th scope="row">번호</th>
       <td>${ viewDto.faq_idx }</td>
     
    </tr>
  </thead>
  <tbody>
     
     <tr>
      	<th scope="row">제목</th>
      	<td><input type="text" name="faq_title" size="50" value="${viewDto.faq_title }"></td>
     </tr>
     
    
    <tr>
      	<th scope="row">내용</th>
    		 <td><textarea rows="10" cols="100" name="faq_content">${viewDto.faq_content }</textarea></td>
    </tr>
 
  </tbody>
</table>



<div class="writebtn">
	<button type="submit" class="w-btn w-btn-indigo">수정</button>
		</form>

	<button type="button" class="w-btn w-btn-indigo" onclick="window.location.href='/faq/FaqForm'">목록</button>
	<a href="/faq/faqdeleteAction?faq_idx=${viewDto.faq_idx }"><button type="button" class="w-btn w-btn-indigo">삭제</button></a>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

