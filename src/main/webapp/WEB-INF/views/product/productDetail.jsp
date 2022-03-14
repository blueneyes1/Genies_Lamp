<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

  <title>product</title>
  <style>

    .wrap {
      display: flex;
      flex-flow: column;
      justify-content: center;
      align-items: center;
      font-size: 12px;
    }

    .head {
      display: flex;
      flex-flow: row nowrap;
    }
    
    .img {
    margin-right: 10px;
    }

    img {
      width: 250px;
      height: 250px;
    }

    #order_btn {
    background-color: rgb(178, 178, 238);
    border: none;
    width: 90px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px

    }

    .order_btn_box {
      text-align: center;
    }

    #amount_btn {
    background-color: rgb(178, 178, 238);
    border: none;
    width: 25px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px

    }

    #review_btn {
    background-color: rgb(178, 178, 238);
    border: none;
    width: 500px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px

    }

    .review_btn_box {
      text-align: center;
    }

    .product_detail {
      height: 500px;
      background-color: rgb(60, 189, 220);
    }
    .product_delivery {
      height: 500px;
      background-color: rgb(102, 153, 217);
    }
    .product_refund {
      height: 500px;
      background-color: rgb(160, 104, 213);
    }

    .product_review_list {
      height: 500px;
      background-color: gainsboro;
    }


  </style>
  <script language="javascript">
    function showPopup() { 
    	var product_idx = $('#product_idx').val();
    	window.open("reviewActionForm?review_product_idx=" + product_idx, "a", "width=700, height=700, left=100, top=50");
    	}
  </script>
</head>
<body>
  <div class="wrap">
    <input type="hidden" id="product_idx" value="${product_idx }" />
    <div class="head">
      <div class="img">
        <img src="/img/moodlamp.jpg" >
      </div>
      <div class="section">
      <form action="/" method="post">
        <table class="table">
        <c:forEach var="dto" items="${list}">
          <thead>
            <tr>
             <input type="hidden" name="product_idx" value="${product_idx}" />
              <th scope="col" colspan="2">${dto.product_name}</th>
            </tr>
          </thead>
          <tbody>
           <tr>
              <th scope="row">판매 가격</th>
              <td>${dto.product_price}</td>
            </tr>
        
            <tr>
              <th scope="row">배송비</th>
              <td>3000원</td>
            </tr>
        
            <tr>
              <th scope="row">수량</th>
              <td>
             <input type="text" value="1">
                  <button type="button" id="amount_btn">+</button>
                  <button type="button" id="amount_btn">-</button>
             </td>
            </tr>
        
            <tr>
              <th scope="row">총 결제 금액</th>
              <td>${dto.product_price}</td>
            </tr>
        
            <tr>
              <th scope="row" colspan="2" class="order_btn_box">
              
                <input type="submit" value="장바구니" name="payment" id="order_btn"/>
                <input type="button" value="구매하기" name="payment" id="order_btn"/>
            
        </th>
            </tr>
           
          </tbody>
          </c:forEach>
        </table>
        </form>
      </div>
    </div>
    <div class="info">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#detail">상품 상세 보기</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#delivery">배송 정보</a>
              </li>
      
              <li class="nav-item">
                <a class="nav-link" href="#refund">교환 및 환불 정보</a>
              </li>
      
        <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#reviews">상품평 보기</a>
              </li>
              
            </ul>
            
          </div>
        </div>
      </nav>

      <a name="detail">

        <div class="product_detail">
      
          <p>상세 정보 페이지 입니다.</p>
      
        </div>
      
        </a>
      
        <a name="delivery">
        <div class="product_delivery">
      
          <p>배송 정보 페이지 입니다.</p>
      
        </div>
      
      </a>
      
      <a name="refund">
        <div class="product_refund">
      
          <p>환불 및 교환 정보 페이지 입니다.</p>
      
        </div>
      
        </a>
      
        <a name="reviews">
        <div class="product_review">
      
          <div class="product_review_list">
      
            <table width="500" cellpadding="0" cellspacing="0" border="1">
          <tr>
            <th>상품평</th>
            <th>아이디</th>
            <th>날짜</th>
          </tr>
          <c:forEach var="review_list" items="${ review_list }">
            <tr>
              <td>${ review_list.review_content }</td>
              <td>${ review_list.review_member_id }</td>
              <td>
                <c:set var="dateVar" value="${ review_list.review_date }" />
                <fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
              </td>
            </tr>
          </c:forEach>
        </table>
        
        <!-- 데이터가 없을 때 표시할 텍스트 -->
				<c:if test="${ review_list == null }">
					<div class="row-group">
						<div class="cell">
							작성된 리뷰가 없습니다.
						</div>
					</div>
				</c:if>
      
          </div>
          
          <div class="review_btn_box">
            <input type="button" value="상품평 작성하기" id="review_btn" onclick="showPopup();"/>
          </div>
      
        </div>
        </a>

    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>