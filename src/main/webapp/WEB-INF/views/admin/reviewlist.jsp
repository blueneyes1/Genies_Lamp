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

<title>reviewlist</title>

<link rel="stylesheet" href="/css/admin/reviewlist.css">
  
 
</head>
<body>
	
	<div class="wrap">
    <div class="box" id="main_box">
      <div class="box" id="aside_box">
        <div class="menu_btn">
          <button onclick="location.href='/admin/memberList' " id="btns">회원관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/selectlist' " id="btns">주문관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/product' " id="btns">상품관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/reviewlist' " id="btns">상품평관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/board' " id="btns">게시판관리</button>
        </div>
        
      </div>
      
      <div class="box" id="section_box">
        <div class="member_list">
		<form method="post">
          <table class="table table-hover">
  
            <tr>
              <th>상품평 번호</th>
              <th>상품평 작성자</th>
              <th>상품평 이미지</th>
              <th>상품평 타이틀</th>
              <th>상품평 내용</th>
              <th>상품평 작성 날짜</th>
              <th>상품평 삭제</th>
              
            </tr>
		
		<c:forEach var="admin_view_review" items="${admin_view_review }" >
            <tr>
              <td>${admin_view_review.review_idx }</td>
              <td>${admin_view_review.review_member_id }</td>
              <td>
              <img src="${admin_view_review.review_img }" id="review_img">
              </td>
              <td>${admin_view_review.review_title }</td>
              <td>${admin_view_review.review_content }</td>
              <td>
              <c:set var="dateVar" value="${admin_view_review.review_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
              
              </td>
              <td>
              <input type="submit" value="삭제" formaction="/admin_review_delete_action?review_idx=${ admin_view_review.review_idx }" id="btns">
              </td>
            </tr>
       
           </c:forEach>

          </table>
         </form>
        </div>
        
      </div>
      
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

