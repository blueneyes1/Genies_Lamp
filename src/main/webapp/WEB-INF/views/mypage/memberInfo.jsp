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


  <title></title>
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
      font-size: 12px;
    }
   
    #main {
      display: flex;
      flex-flow: row nowrap;
    }
    #aside {
      flex: 1 1 auto;
      flex-direction: column;
      width: 300px;
    }
    #section {
      flex: 2 1 auto;
      flex-direction: column;
      width: 1200px;
    }
    
    .menu_btn {
    margin: 10px;
  	text-align: center;
    }

    button {
    background-color: rgb(178, 178, 238);
    border: none;
    width: 90px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px;
    font-size: 12px;
    }

   button:hover {
    background-color: rgb(130, 130, 215);
    }

    input[type=text] {
      width: 300px;
    }

    .mypage_head_text {
      margin-top: 50px;
    }

    .password_txt {
      flex-direction: column;
    }

    .password_txt div {
      margin: 5px;
    }
    
    .password_change_box {
    width: 300px;
    heght: 20px;
    text-align: center;
    background-color: rgb(213, 213, 218);
    border: none;
    color: rgb(17, 17, 17);
    border-radius: 3px;
    font-size: 12px;
    }
    
    a {
    text-decoration: none;
    color: black;
  	}

 	 a:link {
    text-decoration: none;
    color: black;
  	}
  	a:visited {
    text-decoration: none;
    color: black;
  	}
 	 a:active {
    text-decoration: none;
    color: black;
  	}
  	a:hover {
    text-decoration: none;
    color: black;
  	}


    #mypage_btn {
      width: 500px;
      height: 20px;
      background-color: rgb(213, 213, 218);
      border: none;
      color: rgb(17, 17, 17);
      border-radius: 3px;
      font-size: 12px;
    }


  
  </style>
  <script language="javascript">
  function showPasswordChange() { window.open("/mypage/passwordChange?member_id=${member_id}", "a", "width=700, height=700, left=100, top=50"); }
  </script>
</head>
<body>
 
    <div class="box" id="main">
      <div class="box" id="aside">
        <div class="menu_btn">
          <button onclick="location.href='/mypage/memberInfo' ">회원정보수정</button>
        </div>
        
        <div class="menu_btn">
          <button onclick="location.href='/' ">주문내역</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/mypage/basket' ">장바구니</button>
        </div>

        <div class="menu_btn">
          <button onclick="location.href='/' ">1:1문의</button>
        </div>
        
      </div>
      <div class="box" id="section">
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
                <div class="password_change_box">
                   <a href="javascript:showPasswordChange();">비밀번호 변경하기</a>
                </div>
              </td>


            </tr>
        
        
        
            <tr>
              <th>이메일</th>
              <td>
                <input type="text" name="member_email" value="${dto.member_email}">
              </td>
            </tr>
        
            <tr>
            <td></td>
            <td>
                <label>메일 수신 여부 : </label>
                <input type="radio" name="email" value="accept" checked /><label>수신함</label>  
                <input type="radio" name="email" value="refuse"/><label>수신하지않음</label><br />
                <p>(이벤트, 신상품 등 고객님께 혜택이 되는 소식을 알려드립니다.)</p>
            </td>
          </tr>

          </table>
        
       
        </div>
      
        <div class="mypage_btn_box">
        
          <input type="submit" value="회원정보 수정" name="cmd" id="mypage_btn">
        
        </div>
        
         </form>
        
      </div>
    </div>

</body>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</html>