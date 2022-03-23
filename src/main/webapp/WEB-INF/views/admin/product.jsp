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

<title>product</title>

<link rel="stylesheet" href="/css/admin/product.css">
  
  
  <script language="javascript">
  function showProductAddForm() { window.open("/admin/productAddForm", "a", "width=700, height=700, left=100, top=50"); }
  </script>
</head>
<body>
	
	<div class="box">
      <div class="menu_box" >
        <div class="menu_btn">
          <button onclick="location.href='/admin/member' ">회원관리</button>
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
        <div class="section_box">
		
          <table class="table table-hover">
            <tr>
              <td>상품 번호</td>
              <td>상품 타입</td>
              <td>상품 이름</td>
              <td>상품 브랜드</td>
              <td>상품 색상</td>
              <td>상품 가격</td>
              <td>상품 수</td>
              <td>상품 이미지</td>
              <td>상품 설명</td>
              <td>상품 등록 날짜</td>
              <td>상품 정보 수정/삭제</td>
              
            </tr>

			<c:forEach var="product_list" items="${product_list }" >
            <tr>
              <td>${product_list.product_idx }</td>
              <td>${product_list.product_type }</td>
              <td>${product_list.product_name }</td>
              <td>${product_list.product_brand }</td>
              <td>${product_list.product_color }</td>
              <td>${product_list.product_price }</td>
              <td>${product_list.product_count }</td>
              <td><img src="${product_list.product_img1 }" id="product_img"/></td>
              <td>${product_list.product_content }</td>
              <td>
              <c:set var="dateVar" value="${ product_list.product_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
              </td>
              <td><a href="/admin/productModify?product_idx=${product_list.product_idx }">제품 정보 수정/삭제</a></td>
            </tr>
            </c:forEach>
          </table>
          
          <div class="product_btn">
         <button onclick="showProductAddForm();" id="product_btn">상품등록</button>
          </div>
                  
      
        </div>
        <div class="blank_box"></div>
      </div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

