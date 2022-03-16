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

<title></title>
  
  <style>
  
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
	
	#product_img {
	width: 150px;
	height: 150px;
	}

	button {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 100px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	font-size: 12px;
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
 	 
 	 table {
      font-size: 12px;
    }
  
  
  </style>
  <script language="javascript">
  function showProductAddForm() { window.open("/admin/productAddForm", "a", "width=700, height=700, left=100, top=50"); }
  </script>
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
        <div class="product_list">
		
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
              
            </tr>

			<c:forEach var="product_list" items="${product_list }" >
            <tr>
              <a href=""><td>${product_list.product_idx }</td></a>
              <td>${product_list.product_type }</td>
              <td>${product_list.product_name }</td>
              <td>${product_list.product_brand }</td>
              <td>${product_list.product_color }</td>
              <td>${product_list.product_price }</td>
              <td>${product_list.product_count }</td>
              <td><img src="${product_list.product_img1 }" id="product_img"/></td>
              <td>${product_list.product_content }</td>
              <td>${product_list.product_date }</td>
            </tr>
            </c:forEach>
          </table>
          
          <div class="product_btn">
         <button onclick="showProductAddForm();">상품등록</button>
          </div>
                  
      
        </div>
        
      </div>
    </div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

