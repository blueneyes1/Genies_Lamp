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

	#main_box {
  	display: flex;
  	flex-flow: row nowrap;
  	width: 1200px;
	}
	
	#aside_box {
  	flex: 1 1 auto;
  	flex-direction: column;
  	width: 300px;
	}
	
	#section_box {
  	flex: 2 1 auto;
  	flex-direction: column;
  	width: 900px;
	}

	#btns {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 90px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	}

	#member_btn {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 90px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	text-align: center;
	}
	
	a {
	text-decoration: none;
	}
	
	a:hover {
	text-decoration: none;
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
</head>
<body>

    <div class="box" id="main_box">
      <div class="box" id="aside_box">
        <div class="menu_btn">
          <button onclick="location.href='/admin/memberList.jsp' " id="btns">회원관리</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/admin/selectlist.jsp' " id="btns">주문관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/product.jsp' " id="btns">상품관리</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/admin/board.jsp' " id="btns">게시판관리</button>
        </div>
        
      </div>
      
      <div class="box" id="section_box">
        <div class="member_list">
	
          <table class="table table-hover">
  
            <tr>
              <th>멤버 아이디</th>
              <th>멤버 성명</th>
              <th>멤버 이메일</th>
              <th>멤버 전화번호</th>
              <th>멤버 주소</th>
              <th>멤버 등급</th>
              <th>멤버 가입날짜</th>
              <th>멤버 수정/삭제하기</th>
            </tr>
		
		<c:forEach var="list" items="${list }" >
            <tr>
              <td>${list.member_id }</td>
              <td>${list.member_name }</td>
              <td>${list.member_email }</td>
              <td>${list.member_phone }</td>
              <td>${list.member_address1 }</td>
              <td>${list.member_grade }</td>
              <td>
              <c:set var="dateVar" value="${list.member_join_date }" />
					<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
              
              </td>
              <td><a href="/admin/memberModify?member_id=${list.member_id }" id="member_btn">정보수정/삭제</a></td>
            </tr>
           </c:forEach>

          </table>
         
        </div>
        
      </div>
      
    </div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

