<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


<title>장바구니</title>
<style>
  
  .wrap {
    display : flex;
    flex-direction : column;
    align-items: center;
    text-align: left;
    font-size: 12px;
  }

  .basket {
    display: flex;
    flex-direction: row;
    margin-top: 50px;
  }

  

  </style>
</head>
<body>

	<div class="wrap">
	<form method="post" action="basketOrder">
		<div class="basket">

      <table class="table table-sm">
      <input type="hidden" name="member_id" value="${dto.basket_member_id}" />
        
      <tr>
        <td>이미지</td>
        <td>상품정보</td>
        <td>판매가</td>
        <td>수량</td>
        <td>배송비</td>
        <td>합계</td>
      </tr>

      <tr>
        <td>${dto.product_img1 }</td>
        <td>${dto.product_name }</td>
        <td>${dto.product_price}</td>
        <td>${dto.basket_count }</td>
        <td>3000원</td>
        <td>${dto.product_price }</td>
      </tr>

      <tr>
        <td colspan="2">총 상품금액</td>
        <td colspan="2">총 배송비</td>
        <td colspan="2">결제 예정금액</td>
      </tr>

      <tr>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
      </tr>
        
        <tr id="basket_btn">
          <td colspan="5">
            <input type="submit" value="주문하기" />
            <input type="button" value="장바구니 비우기" />
          </td>
        </tr>

      </table>




    </div>
	</form>
	
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	

</body>
</html>