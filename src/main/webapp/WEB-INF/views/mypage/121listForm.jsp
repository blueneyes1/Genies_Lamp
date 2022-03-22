<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1문의</title>
	<style>

.contanier-fluid{
margin:auto;

}
.main{
padding-bottom:20px;
}

.menu{
width:800px; 
margin: 0 auto
padding-bottom:20;
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


.topline{
position:relative;
}

.name{
position: absolute;
top: 50%;
text-align: center;

}
.pagination > li > a
{
 background-color: white;
 color: rgb(228, 211, 241);
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > a:active,
.pagination > li > span:focus,
.pagination > li > span:hover,
.pagination > li > span:active
{
    color: rgb(95, 59, 151);
    background-color: #eee;
    border-color: #ddd;
}

.pagination > .active
{
    color: white;
    background-color: rgb(178, 178, 238);
    border: solid 1px rgb(178, 178, 238);
}

.page-item > .active {
	background-color: rgb(178, 178, 238);
}

.pagination > .active > a:hover
{
    background-color: rgb(178, 178, 238);
    border: solid 1px rgb(178, 178, 238);
}

 .page-link:focus {
	background-color: rgb(178, 178, 238);
}

.page-link:active {
	background-color: rgb(178, 178, 238);
}

.pagination > .active > a,
.pagination > .active > a:hover,
.pagination > .active > a:visited {
    background-color: rgb(178, 178, 238);
    border: 1px solid rgb(178, 178, 238);
}


	</style>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	
</head>
<body>
	
  <!-- 메인 -->
	<div class="main">
  <div class="menu">
	<div class="NFtable">
	  <table class="table table-sm"">
 	  <thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">아이디</th>
			<th scope="col">제목</th>
			<th scope="col">날짜</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${ list }">
			<tr>
				<td>${ dto.one2one_idx }</td>
				<td>${ dto.one2one_member_id }</td>
				<td>
					<a href="contentForm?one2one_idx=${dto.one2one_idx}"> ${ dto.one2one_title } </a>
				</td>
				<td>
					<c:set var="dateVar" value="${ dto.one2one_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
		</c:forEach>
		</tbody>
			</table>
		<div class="writebtn">
     		<c:if test="${ not empty member_id }">
	    	<c:if test="${ member_grade ne 'A' }">
	    		<button onclick="location.href='/mypage/writeForm'" class="w-btn w-btn-indigo">작성</button>
			</c:if>
			</c:if>
	 	</div>
		

	
	<script>
		/* 웹브라우저 back키 누를때, 페이지 재로딩  */
		window.onpageshow = function(event) {
		    if (event.persisted) {
		        document.location.reload();
		    }
		};
	</script>
</div>

</div>
</div>
</body>




