<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

  <title>productList</title>
  <style>
    .box {
      display: flex;
      flex-flow: column;
      justify-content: center;
      align-items: center;
      font-size: 12px;
    }

    .content_box {
      display: flex;
      flex-flow: row;
      justify-content: center;
      align-items: center;
    }

    #product_img {
      width: 250px;
      height: 250px;
    }
  </style>
</head>
<body>
  <div class="box">
    <div class="head_box">

    </div>
    <div class="content_box">
      <div class="img">
        <a href="/product/productDetail?product_idx=1"><img src="" id="product_img"></a>
      </div>
      <div class="img">
        <a href=""><img src="" id="product_img"></a>
      </div>
      <div class="img">
        <a href=""><img src="" id="product_img"></a>
      </div>
      <div class="img">
        <a href=""><img src="" id="product_img"></a>
      </div>
    </div>
    <div class="page_box">
      <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	
