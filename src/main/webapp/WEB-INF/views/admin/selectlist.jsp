<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
	
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<title></title>

 <script language="javascript">
  function showDelivery_1() { window.open("/admin/orderlist?pay_delivery=1", "a", "width=700, height=700, left=100, top=50"); }
  function showDelivery_2() { window.open("/admin/orderlist?pay_delivery=2", "a", "width=700, height=700, left=100, top=50"); }
  function showDelivery_3() { window.open("/admin/orderlist?pay_delivery=3", "a", "width=700, height=700, left=100, top=50"); }
  </script>
  
  <style>
  * { margin: 0; padding: 0; }

	body {
      padding: 20px;
    }

	.box {
  	display: flex;
  	flex-flow: row nowrap;
  	justify-content: center;
  	align-items: center;
	}

	#main {
  	display: flex;
  	flex-flow: row nowrap;
  	width: 1200px;
	}
	
	#aside {
  	flex: 1 1 auto;
  	flex-direction: column;
  	width: 300px;
	}
	
	#section {
  	flex: 2 1 auto;
  	flex-direction: column;
  	width: 900px;
	}

	button {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 90px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	}

	button:hover {
	background-color: rgb(130, 130, 215);
	}
  
  	.menu_btn {
    margin: 10px;
    font-size: 12px;
  	text-align: center;
 	 }  

  	.order_btn {
  	 font-size: 12px;
  	 text-align: center;
 	 }
  
  </style>
</head>
<body>

    <div class="box" id="main">
      <div class="box" id="aside">
        <div class="menu_btn">
          <button onclick="location.href='/admin/member.jsp' ">회원관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/selectlist.jsp' ">주문관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/product.jsp' ">상품관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/board.jsp' ">게시판관리</button>
        </div>
        
      </div>
      <div class="box" id="section">
        <div class="order_img">
	
          <img src="/img/admin/order_lamp.PNG">
        
        </div>
        
        <div class="order_btn">
        
          <button onclick="showDelivery_1();">배송전</button>
          <button onclick="showDelivery_2();">배송중</button>
          <button onclick="showDelivery_3();">배송완료</button>
      
        </div>
        
      </div>
    </div>


</body>
</html>

</body>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


</html>