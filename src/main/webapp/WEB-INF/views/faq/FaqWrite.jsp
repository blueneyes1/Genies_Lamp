<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faq</title>
</head>
<style>
body {
    margin: 0;
    padding: 0;
    height: 100%;
}


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


.contanier-fluid{
margin:auto;
}

.topline{
position:relative;
}

.name{
position: absolute;
top: 50%;
text-align: center;

}

.body-wrapper {
    min-height: 100%;
    position: relative;
}

.body-content {
    margin-top: 100px;
    padding-bottom: 150px; /* footer의 높이 */
}

footer {
    width: 100%;
    height: 150px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
}
</style>

<body>
<div class="body-wrapper">
	<div class="body-content">
<div class="main">
<form action="faqwriteAction" method="post">

	<table class="table table-sm"  style="margin-left: auto; margin-right: auto;">

  <thead>
    <tr>
      <th scope="row">번호</th>
       <td>${faq_dto.faq_idx }</td>
     
    </tr>
  </thead>
  <tbody>
     
     <tr>
      <th scope="row">제목</th>
      <td><input type="text" name="faq_title" value="" size="78"></td>
      </tr>
    
    <tr>
      <th scope="row">작성일</th>
     <td>   <c:set var="dateVar" value="${ faq_list.faq_date }" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${ faq_dto.faq_date }" /></td>
    </tr>
    
    <tr>
      <th scope="row">내용</th>
      <td><textarea rows="10" cols="80" name="faq_content"></textarea></td>
    </tr>
  
  </tbody>
</table>

	
<div class="writebtn">
	
	<button type="submit" id="notice_btn">작성</button>
		</form>

	<button type="button" id="notice_btn"  onclick="window.location.href='/faq/FaqForm'">목록</button>
</div>
</div>
</div>


