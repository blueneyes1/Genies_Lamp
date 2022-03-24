<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
	
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<title>memberList</title>

<link rel="stylesheet" href="/css/admin/memberList.css">
  
  
</head>
<body>
	
	<div class="box">
      <div class="menu_box">
      <div>
        <div class="menu_btn">
          <button onclick="location.href='/admin/memberList.jsp' " id="btns">회원관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/selectlist.jsp' " id="btns">주문관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/product.jsp' " id="btns">상품관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/reviewlist' " id="btns">상품평관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/board' " id="btns">게시판관리</button>
        </div>
        </div>
      </div>
      
      <div class="section_box">
        <div class="member_list">
	
          <table class="table table-hover">
  
            <tr>
              <th>멤버 아이디</th>
              <th>멤버 성명</th>
              <th>멤버 이메일</th>
              <th>멤버 전화번호</th>
              <th>멤버 주소</th>
              <th>멤버 등급</th>
              <th>멤버 가입날짜</th>
              <th>멤버 수정/삭제하기</th>
            </tr>
		
		<c:forEach var="list" items="${list }" >
            <tr>
              <td>${list.member_id }</td>
              <td>${list.member_name }</td>
              <td>${list.member_email }</td>
              <td>${list.member_phone }</td>
              <td>${list.member_address1 }</td>
              <td>${list.member_grade }</td>
              <td>
              <c:set var="dateVar" value="${list.member_join_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
              
              </td>
              <td><a href="/admin/memberModify?member_id=${list.member_id }" id="member_btn">정보수정/삭제</a></td>
            </tr>
           </c:forEach>

          </table>
         
        </div>
        </div>
        <div class="blank_box"></div>
      </div>
      
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

