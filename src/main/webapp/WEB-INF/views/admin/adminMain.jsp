<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    }
   
    #main {
      display: flex;
      flex-flow: row nowrap;
    }
    #aside {
      flex: 1 1 auto;
      flex-direction: column;
      width: 500px;
    }
    #section {
      flex: 2 1 auto;
      width: 1000px;
    }
    
    .menu_btn {
    margin: 10px;
    font-size: 12px;
  	text-align: center;
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


  
  </style>
</head>
<body>

    <div class="box" id="main">
      <div class="box" id="aside">
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
          <button onclick="location.href='/admin/board' ">게시판관리</button>
        </div>
        
      </div>
      <div class="box" id="section">
        <div class="img">
          <img src="/img/admin/admin_lamp.PNG">
        </div>
        
      </div>
    </div>

</body>
</html>