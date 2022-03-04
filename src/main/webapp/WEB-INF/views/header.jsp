<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
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
<body>  

<!-- Header -->
	<div class="toTopScroll">
	  <img src="/img/icon-top.png" onClick="javascript:window.scrollTo(0,0)">
	</div>
	
	<div class="top d-none d-md-block">
	  <div class="topMenu d-none d-md-block container">
	    <span class="home"><a href="/main">HOME</a></span>
	    <c:if test="${ not empty member_id }">
	    	<c:if test="${ genies_member.member_grade eq A }">
	    		<span><a href="/admin/adminMain">관리자페이지</a></span>
	    	</c:if>
	    	<c:if test="${ genies_member.member_grade ne A }">
	    		<span><a href="/mypage">마이페이지</a></span>
	    	</c:if>
	  		<span><a href="/logoutAction">로그아웃</a></span>
	    </c:if>
	    <c:if test="${ empty member_id }">
	    	<span><a href="/login">로그인</a></span>
	    	<span><a href="/join">회원가입</a></span>
	    </c:if>
	  </div>
	</div>
	
	<!-- 메인로고 -->
	<div class="mainlogo">
		<a href="/main"><img src="/img/mainlogo.gif" alt="메인로고"></a>
	</div>

	<!-- 네비바 -->
	<nav class="navbar navbar-expand-md navbar-light bg-white sticky-top">
	  <div class="container">
	    <a class="navbar-brand" href="/main"><img src="/img/logo.jpg" width="150" height="50" alt="로고"></a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" 
	            data-target="#collapsibleNavbar"> 
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="collapsibleNavbar">
	      <!-- ml-auto : margin-left  -->
	      <ul class="navbar-nav ml-auto">
	        <li class="nav-item dropdown">
	          <a class="nav-link" href="#">Genie's Lamp</a>
	          <div class="dropdown-content">
	            <a href="/company/company01">Genie's Lamp 소개</a>
	            <a href="/company/company02">오시는 길</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link" href="#">제품안내</a>
	          <div class="dropdown-content">
	            <a href="/product/productDetail">스탠드등</a>
	            <a href="/product/productDetail">레일등</a>
	            <a href="/product/productDetail">천장등</a>
	            <a href="/product/productDetail">벽등</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link" href="#">커뮤니티</a>
	          <div class="dropdown-content">
	            <a href="/community/community01">공지사항</a>
	            <a href="/community/community02">1:1 문의</a>
	            <a href="/community/community03">FAQ</a>
	          </div>
	        </li>	       
	      </ul>
	    </div>
	  </div>
	</nav>



