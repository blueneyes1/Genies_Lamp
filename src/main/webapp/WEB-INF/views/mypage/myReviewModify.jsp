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


  <title>myreviewModify</title>
  
  <link rel="stylesheet" href="/css/mypage/myreviewModify.css">
  
  
 
</head>
<body>
  <div class="menu_box">
        <div class="menu_btn">
          <button onclick="location.href='/mypage/memberInfo' " id="btns">회원정보수정</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/mypage/orderDetails' " id="btns">주문내역</button>
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
        <form method="post">
      
              <table class="table table-hover">
                <tr>
                  <th>상품평 상품 번호</th>
                  <td>
                    <input type="text" readonly value="${mypage_view_modify_review.review_product_idx}" name="review_product_idx">
                  </td>
                </tr>
    
                <tr>
                  <th>상품평 이미지</th>
                  <td>
                    <img src="${mypage_view_modify_review.review_img}" id="review_img">
                  </td>
                </tr>
    
                <tr>
                  <th>상품평 타이틀</th>
                  <td>
                    <input type="text" value="${mypage_view_modify_review.review_title}" name="review_title">
                  </td>
                </tr>
               
    
                <tr>
                  <th>상품평 내용</th>
                  <td>
                    <input type="text" value="${mypage_view_modify_review.review_content}" name="review_content">
                  </td>
                </tr>
    
                <tr>
                  <th>상품평 작성 날짜</th>
                  <td>
                    <c:set var="dateVar" value="${mypage_view_modify_review.review_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
    
              </table>
             
    
              <div class="modify_delete_btns">
    
                <input type="submit" formaction="/mypage_review_modify" value="수정" id="modify_delete_btn">
                <input type="submit" formaction="/mypage_review_delete" value="삭제" id="modify_delete_btn">
    
              </div>
    
            
    
        </form>
        </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

