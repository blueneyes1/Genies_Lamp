<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
	<meta charset="UTF-8">
	<title></title>
<style>

.contanier-fluid{
margin:auto;
text-align: center;
}


.menu{width:800px; margin: 0 auto;
font-size: 12px;
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
<div class="menu">
<div class="NFtable">
     <table class="table table-sm"">
  <thead>
    <tr>
      <th scope="col" style="width=20%;">번호</th>
      <th scope="col" style="width=50%;">제목</th>
      <th scope="col" style="width=30%;">작성일</th>
 
    </tr>
  </thead>
  <tbody>
      <c:forEach var="dto" items="${ notice_list }" varStatus="status">
	  <tr onclick="window.location.href='/notice/NoticeDetail?notice_idx=${dto.notice_idx}';"  style="cursor:pointer;">
      <td class="num" >${ status.count  }</td>
	  <td>${ dto.notice_title }</td>
	  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ dto.notice_date }" /></td>
	</tr>
       	</c:forEach>
   </tbody>
</table>

       
     <div class="writebtn">
     <c:if test="${ member_grade eq 'A' }">
	 <button onclick="location.href='/notice/NoticeWrite'" id="notice_btn">작성</button>
	</c:if>
	</div>
 	<div>

<%--    <div class="NFtable"  style="width:100%; height:100%">
	   <iframe name="noticeList"  src="/notice/NoticeFormTable"
	           frameborder="0" border="0" cellspacing="0" scrolling="yes" 
	           style="border-style: none; width: 100%; height: 100%;"></iframe>
	   
	   
	   <div class="writebtn">
	     <c:if test="${ member_grade eq 'A' }">
	       <button onclick="location.href='/notice/NoticeWrite'" class="w-btn w-btn-indigo">작성</button>
	     </c:if>
	   </div>
   </div> --%>
 
<div class="contanier-fluid">
  <div class="row">
   <nav aria-label="Page navigation example">
     <ul class="pagination">
       <li class="page-item <c:if test="${ page == 1 }">disabled</c:if>">
	     <a class="page-link" href="/notice/NoticeForm?page=${page-1}" target="noticeList">Previous</a>
	   </li>
	    <li class="page-item active">
	    	<a class="page-link" href="/notice/NoticeForm?page=1" target="noticeList">1</a>
	    </li>
	    <li class="page-item ">
	    	<a class="page-link" href="/notice/NoticeForm?page=2" target="noticeList">2</a>
	    </li>
	    <li class="page-item ">
	    	<a class="page-link" href="/notice/NoticeForm?page=3" target="noticeList">3</a>
	    </li>
	    <li class="page-item ">
	    	<a class="page-link" href="/notice/NoticeForm?page=4" target="noticeList">4</a>
	    </li>
	    <li class="page-item ">
	    	<a class="page-link" href="/notice/NoticeForm?page=5" target="noticeList">5</a>
	    </li>
	    <li class="page-item ">
	    	<a class="page-link" href="/notice/NoticeForm?page=${page+1}"  target="noticeList">Next</a>
	    </li>
      </ul>
      <script>
        $('ul.pagination li').click(function(){
            $('ul.pagination li').attr({"class":"page-item"});
            $(this).addClass("active");  
             
        });
      </script>
     </nav>
  </div>
 </div>
 </div>
 
 
  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  
  

  </div>


  </div>

