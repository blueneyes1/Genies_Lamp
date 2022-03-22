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
	margin:5px;
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
th {
    vertical-align: top;

  }
</style>
<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
	

	 <div class="main">

<div class="tablesize">
	<form action="writeAction" method="post">
		<table class="table table-sm" style="margin-left: auto; margin-right: auto;">
			<tbody>
			<tr>
				<th scope="row">이름</th>
				<td><input type="text" name="one2on_member_id" value="" size="78"></td>
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
			<button type="submit" class="w-btn w-btn-indigo">작성</button>
			<button type="button" class="w-btn w-btn-indigo"  onclick="window.location.href='/mypage/121listForm'">목록</button>
		</div>
	</form>
	</div>
	</div>
