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


  <title>memberInfo</title>
  
    <link rel="stylesheet" href="/css/mypage/memberInfo.css">
  
  
  <script language="javascript">
  function showPasswordChange() { window.open("/mypage/passwordChange?member_id=${member_id}", "a", "width=330, height=300, left=100, top=50"); }
  </script>
</head>
<body>
 	
 	<div class="box">
      <div class="menu_box">
        <div class="menu_btn">
          <button onclick="location.href='/mypage/memberInfo' " id="btns">회원정보수정</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/' " id="btns">주문내역</button>
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
      <div class="section_box">
        <div class="mypage_head_text">

          <p><b>회원정보수정</b></p>
        
        </div>
        
        <div class="mypage_contents">
        
        <form action="/memberUpdate" method="post">
        
          <table class="table table-hover">
      	  
      
        
        
            <tr>
              <th>아이디</th>
              <td>${dto.member_id}
              <input type="hidden" name="member_id" readonly value="${ dto.member_id }" />
              </td>
            </tr>
        
        
        
            <tr>
              <th>이름</th>
              <td>${dto.member_name}
              <input type="hidden" name="member_name" readonly value="${ dto.member_name }" />
              </td>
            </tr>
        
        
        
            <tr>
              <th>연락처</th>
              <td>
                <input type="text" name="member_phone" value="${dto.member_phone}">
              </td>
            </tr>

            <tr>

              <th>비밀번호 변경</th>
              <td class="password_change_btn">
                   <a href="javascript:showPasswordChange();"><span>비밀번호 변경하기</span></a>
              </td>


            </tr>
        
        
        
            <tr>
              <th>이메일</th>
              <td>
                <input type="text" name="member_email" value="${dto.member_email}">
              </td>
            </tr>
        

          </table>
        
       
        </div>
      
        <div class="mypage_btn_box">
        
          <input type="submit" value="회원정보 수정" name="cmd" id="mypage_btn">
        
        </div>
        
         </form>
        
      </div>
      
      <div class="blank_box"></div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

