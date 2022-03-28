<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글쓰기</title>


<style>
body {
    margin: 0;
    padding: 0;
    height: 100%;
}

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

.contanier-fluid{
margin:auto;
}

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
th {
    vertical-align: top;

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

<div class="body-wrapper">
<div class="body-content">

	 <div class="main">

<div class="tablesize">
	<form action="writeAction" method="post">
		<table class="table table-sm" style="margin-left: auto; margin-right: auto;">
			<tbody>
			<tr>
				<th scope="row">이름</th>
				<td>${ member_id }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="one2one_title" value="" size="78"></td>
			</tr>
			<tr>
				<th scope="row" >내용</th>
				<td><textarea rows="10" cols="80" name="one2one_content"></textarea></td>
			</tr>
		</tbody>
		</table>
		<div class="writebtn">
			<button type="submit" id="one_btn">작성</button>
			<button type="button" id="one_btn"  onclick="window.location.href='/mypage/121listForm'">목록</button>
		</div>
	</form>
	</div>
	</div>
	</div>
	</div>
