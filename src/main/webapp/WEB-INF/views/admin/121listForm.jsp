<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/main.css">
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<style>
body {
    margin: 0;
    padding: 0;
    height: 100%;
}

.contanier-fluid{
margin:auto;
}


.menu{width:800px; margin: 0 auto;
font-size: 12px;}



#one_btn {
background-color: rgb(178, 178, 238);
    border: none;
    width: 100px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px;
    font-size: 12px;
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


.body-wrapper {
    min-height: 100%;
    position: relative;
}

.body-content {
    margin-top: 100px;
    padding-bottom: 250px;
}

footer {
    width: 100%;
    height: 250px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
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
  <div class="body-wrapper">
<div class="body-content">
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
	
	<script>
		/* 웹브라우저 back키 누를때, 페이지 재로딩  */
		window.onpageshow = function(event) {
		    if (event.persisted) {
		        document.location.reload();
		    }
		};
	</script>
<div class="contanier-fluid">
  	<div class="row">
  	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=${page-1}">Previous</a>
		    </li>
		    
		    <li class="page-item <c:if test="${ page == 1 }">active</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=1">1</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 2 }">active</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=2">2</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 3 }">active</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=3">3</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 4 }">active</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=4">4</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">active</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=5">5</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="page-link" href="/admin/121listForm?page=${page+1}">Next</a>
		    </li>
  </ul>
</nav>
  	</div>
 </div>
	
</div>
</div>
</div>
</div>

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  
  



