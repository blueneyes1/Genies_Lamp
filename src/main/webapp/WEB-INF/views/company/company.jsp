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
    flex-direction: row;
    justify-content: center;
      margin-top: 30px;
  margin-bottom: 30px;
  }

  .box_left {
    display: flex;
    flex-direction: column;
  }

  .box_right {
    display: flex;
    flex-direction: column;
  }
  
  #info_img {
  	width: 200px;
  	height: 150px;
  }
  
  .commonSection1 {
  width: 100%;
  position: relative;
    margin-top: 30px;
  margin-bottom: 30px;
  }
  .commonContent1 {
  height: 200px;
  }
  .commonContent1 img {
  max-height: 100%;
  }
  
  .company_txt {
  text-align: center;
    margin-top: 30px;
  margin-bottom: 30px;
  }
  
  .box_left_one , .box_right_one {
  margin-right: 10px;
  }
</style>
</head>
<body>

<div class="company_txt">

<h1><b>GENIE'S LAMP 소개</b></h1>

<p>지니의 램프는 누구나 조명을 통해 쉽고 간단하지만 확실하게 </p>
<p>디자인 변화를 추구할수 있도록 도움이 되어드리고자 언제나 노력하고있습니다 </p>

</div>

<div class="commonSection1">
    <div class="commonContent1">
      <img src="/img/company/background_img.jpg" 
          style="width: 100%; height: 100%;">
    </div>
  </div>

<div class="box">
  <div class="box_left">
    <div class="box_left_one">
      <p><b>GENIE'S LAMP</b></p>
    </div>
    <div class="box_left_two">
      <p><b>
        COMPANY<br/>
        PROFILE
      </b></p>
    </div>
  </div>
  <div class="box_right">
    <div class="box_right_one">
      <p>지니의 램프는 고객 니즈에 맞는 조명 솔루션 제공하기위한 조명 판매 전문 브랜드입니다
      </p>
    </div>
    <div class="box_right_two">
      <table class="table table-sm">
          
        <tr>
          <th>SLOGAN</th>
          <td>Light for your space</td>
        </tr>


        <tr>
          <th>KEY PRODUCT</th>
          <td>조명</td>
        </tr>

        <tr>
          <th>LOGO</th>
          <td>
            <img src="/img/company/simple_genie_logo_white.jpg" id="info_img">
          </td>
        </tr>

        <tr>
          <th>MAIN COLOR</th>
          <td>
            <img src="/img/company/genie_main_color.PNG"  id="info_img">
          </td>
        </tr>

      </table>
    </div>
  </div>
</div>
</body>
    

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

