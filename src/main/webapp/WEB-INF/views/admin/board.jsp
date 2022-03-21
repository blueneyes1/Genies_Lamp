<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록보기</title>
	<style>
		* {
			margin: 0 auto;
			padding: 0 auto;
			overflow: hidden;
		}
		td, h2 {
			text-align: center;
		}
	</style>
	
</head>
<body>
	<h2>관리자 페이지</h2>
	
	<div class="wrap">
    <div class="box" id="main_box">
      <div class="box" id="aside_box">
        <div class="menu_btn">
          <button onclick="location.href='/notice/NoticeForm' " id="btns">공지사항</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/faq/FaqForm'" id="btns">FAQ</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/121listForm' " id="btns">1대1문의</button>
        </div>
		
	<script>
		/* 웹브라우저 back키 누를때, 페이지 재로딩  */
		window.onpageshow = function(event) {
		    if (event.persisted) {
		        document.location.reload();
		    }
		};
	</script>
</body>
</html>



