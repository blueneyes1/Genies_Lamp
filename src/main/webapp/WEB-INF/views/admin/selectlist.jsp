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

<title>selectlist</title>

 <script language="javascript">
  function showDelivery_1() { window.open("/admin/orderlist?pay_delivery=1", "a", "width=700, height=700, left=100, top=50"); }
  function showDelivery_2() { window.open("/admin/orderlist?pay_delivery=2", "a", "width=700, height=700, left=100, top=50"); }
  function showDelivery_3() { window.open("/admin/orderlist?pay_delivery=3", "a", "width=700, height=700, left=100, top=50"); }
  </script>
  
  <link rel="stylesheet" href="/css/admin/selectlist.css">
  
  
</head>
<body>
	 <div class="menu_box" >
        <div class="menu_btn">
          <button onclick="location.href='/admin/memberList' ">회원관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/selectlist' ">주문관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/product' ">상품관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/reviewlist' ">상품평관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/board' ">게시판관리</button>
        </div>
        
      </div>
	<div class="box">
     
      <div class="section_box" >
        <div class="order_img">
	
          <img src="/img/Genie_lamp.png">
        
        </div>
        
        <div class="order_btn">
        
          <button onclick="showDelivery_1();">배송전</button>
          <button onclick="showDelivery_2();">배송중</button>
          <button onclick="showDelivery_3();">배송완료</button>
      
        </div>
        
      </div>
      
      <div class="blank_box"></div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


