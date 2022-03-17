<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
  <title></title>
  <style>
    
   
    .wrap {
  	display: flex;
    flex-flow: row nowrap;
    align-items: center;
    width: 100%;
  	}
  	
    .box {
      display: flex;
      flex-flow: row nowrap;
      justify-content: center;
      align-items: center;
      font-size: 12px;
    }
   
    #main_box {
      display: flex;
      flex-flow: row nowrap;
    }
    #aside_box {
      flex: 1 1 auto;
      flex-direction: column;
      width: 200px;
      margin-left: 150px;
      
    }
    #section_box {
      flex: 2 1 auto;
      flex-direction: column;
      width: 850px;
      text-align: center;
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

	
	<div class="wrap">
    <div class="box" id="main_box">
      <div class="box" id="aside_box">
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
      <div class="box" id="section_box">
        <div class="img">
          <img src="/img/Genie_lamp.png">
        </div>
        <div class="txt">
        <p><b>관리자</b>님 환영합니다</p>
        </div>
        
      </div>
    </div>
</div>