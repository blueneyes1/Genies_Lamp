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


<title>장바구니</title>
<style>
  
  .wrap {
  	display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
  	}
  	
    .box {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      font-size: 12px;
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

  .basket {
    display: flex;
    flex-direction: row;
    margin-top: 50px;
  }
  
  #basket_btn_box {
  text-align: center;
  }
  
  
  #basket_btn {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 90px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	margin: 5px;
  }
  
  #basket_img {
  width: 150px;
  height: 150px;
  }

	
  

  </style>
</head>
<body>
	
	<div class="wrap">
	
      <div class="box" >
	<form method="post" >
		<div class="basket">
	
	
      <table class="table table-sm">

      <tr>
        <td>이미지</td>
        <td>상품명</td>
        <td>판매가</td>
        <td>수량</td>
        <td>합계</td>
      </tr>

      
      <c:forEach var="basket_list" items="${basket_list }">
	      <tr>
	        <td>
	        <img src="${basket_list.product_img1 }" id="basket_img">
	        </td>
	        <td>${basket_list.product_name }</td>
	        <td>${basket_list.product_price}</td>
	        <td>${basket_list.basket_count }</td>
	        <td>${basket_list.product_price }</td>
	      </tr>
	   </c:forEach>


      <tr>
        <td colspan="2">총 상품금액</td>
        <td colspan="2">배송비</td>
        <td colspan="2">결제 예정금액</td>
      </tr>

      <tr>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
      </tr>
        
        <tr>
          <td colspan="5"  id="basket_btn_box">
            <button type="button" onclick="location.href='/' " id="basket_btn">주문하기</button>
            <input type="submit" formaction="/mypage_basket_delete" value="장바구니 비우기"  id="basket_btn"/>
          </td>
        </tr>

      </table>



    </div>
	</form>
	
	</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
