<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
	<meta charset="UTF-8">
	<title></title>
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

text-align:center;

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


.btnwrite{
background-color: #87CEFA;
float:right;
}

.writebtn{
margin: auto;
}

.writebtn{
color:cyan;
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
	
</head>
<body>

  
  <!-- 메인 -->


 	<div class="topline">
       <div class="name">
        
          </div>

     	
     	
        

         </div>
  <div class="menu">
<div class="NFtable">
      <table class="NFForm">
        <colgroup>

    	<col width="10%"/>
    	<col width="70%"/>
    	<col width="20%"/>
  </colgroup>
        <tr>
          <th scope="row" colspan="1" >번호</th>
         
          <th scope="row" colspan="1">제목</th>
       
          <th scope="row" colspan="1">작성일</th>
       

        </tr>
        
        
      		<c:forEach var="dto" items="${ notice_list }" varStatus="status">
	        <tr onclick="window.location.href='/notice/NoticeDetail?notice_idx=${dto.notice_idx}';"  style="cursor:pointer;">

	       

	          <td class="num">${ status.count  }</td>
	          <td>${ dto.notice_title }</td>
	          <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ dto.notice_date }" /></td>

	        </tr>
        	</c:forEach>
       
      </table>

       
       
     <div class="writebtn">
     <c:if test="${ member_grade eq 'A' }">
	 <button onclick="location.href='/notice/NoticeWrite'" class="btnwrite">글작성</button>
	</c:if>
	</div>
 	<div></div>

 </div> 	
<div class="contanier-fluid">
  	<div class="row">
  	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=${page-1}">Previous</a>
		    </li>
		    
		    <li class="page-item <c:if test="${ page == 1 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=1">1</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 2 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=2">2</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 3 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=3">3</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 4 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=4">4</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">active</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=5">5</a>
		    </li>
		    <li class="page-item <c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="page-link" href="/notice/NoticeForm?page=${page+1}">Next</a>
		    </li>
  </ul>
</nav>
  	</div>
 </div>
 
 
  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
  

  </div>


  </div>

