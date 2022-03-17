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


<title>리뷰</title>
<style>
  
  .wrap {
  	display: flex;
    flex-flow: row nowrap;
    align-items: center;
    width: 100%;
  	}
  	
    .box {
      display: flex;
      flex-flow: row nowrap;
      justify-content: center;
      align-items: center;
      font-size: 12px;
    }
   
    #main_box {
      display: flex;
      flex-flow: row nowrap;
    }
    #aside_box {
      flex: 1 1 auto;
      flex-direction: column;
      width: 200px;
      margin-left: 150px;
      
    }
    #section_box {
      flex: 2 1 auto;
      flex-direction: column;
      width: 850px;
      text-align: center;
    }
    
    .menu_btn {
    margin: 10px;
  	text-align: center;
    }

    #btns {
    background-color: rgb(178, 178, 238);
    border: none;
    width: 100px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px;
    font-size: 12px;
    }

  .review_box {
    display: flex;
    flex-direction: row;
    margin-top: 50px;
  }
  
  #review_btn {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 90px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	margin: 5px;
  }
  
  #review_img {
  width: 150px;
  height: 100px;
  }

	
  

  </style>
</head>
<body>
	
	<div class="wrap">
	<div class="box" id="main_box">
      <div class="box" id="aside_box">
      
      <div class="menu_btn">
          <button onclick="location.href='/mypage/memberInfo' " id="btns">회원정보수정</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/mypage/orderDetails'" id="btns">주문내역</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/mypage/basket' " id="btns">장바구니</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/mypage/myReviewList' " id="btns">나의 상품평 보기</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/' " id="btns">1:1문의</button>
        </div>
        
      </div>
      <div class="box" id="section_box">
	<form method="post" >
		<div class="review_box">
	
      <table class="table table-sm">

      <tr>
        <td>상품평 상품 번호</td>
        <td>상품평 이미지</td>
        <td>상품평 타이틀</td>
        <td>상품평 내용</td>
        <td>상품평 날짜</td>
        <td>상품평 수정/삭제</td>
      </tr>

      
      <c:forEach var="mypage_view_review" items="${mypage_view_review}">
	      <tr>
	        <td>${mypage_view_review.review_product_idx }</td>
	        <td>
	        <img src="${mypage_view_review.review_img }" id="review_img">
	        </td>
	        <td>${mypage_view_review.review_title}</td>
	        <td>${mypage_view_review.review_content }</td>
	        <td>
	        <c:set var="dateVar" value="${mypage_view_review.review_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
	        </td>
          <td>
            <a href="/mypage/myReviewModify?review_member_id=${member_id}&review_idx=${ mypage_view_review.review_idx }"><input type="button" value="수정/삭제" id="review_btn"></a>
          </td>
	      </tr>
	   </c:forEach>

       
      </table>



    </div>
	</form>
	
	</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
