<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


  <title>mypageMain</title>
  
  <link rel="stylesheet" href="/css/mypage/mypageMain.css">
  
  
</head>
<body>
 	
 	<div class="menu_box">
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
          <button onclick="location.href='/mypage/121listForm' " id="btns">1:1문의</button>
        </div>
        
      </div>
 	
 	<div class="box">
      
      <div class="section_box">
		
		<div class="section_img">
		<img src="/img/Genie_lamp.png" >
		</div>
		
		<div class="section_txt">
		<p><b>${member_id}</b>님 환영합니다.</p>
		</div>
        
        
      </div>
      <div class="blank_box"></div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

