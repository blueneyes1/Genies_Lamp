<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
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



	#product_btns {
	background-color: rgb(178, 178, 238);
	border: none;
	width: 100px;
	height: 25px;
	color: rgb(17, 17, 17);
	border-radius: 3px;
	font-size: 12px;
	}

 	 table {
      font-size: 12px;
    }

    #product_add_btn_box {
      text-align: center;
    }
  
  
  </style>
  <script language="javascript">
  function showProductAddForm() { window.open("/admin/productAddForm", "a", "width=700, height=700, left=100, top=50"); }
  </script>
</head>
<body>

   
      
      <div class="box" id="section">
        <form action="/uploadOk" method="post" enctype="multipart/form-data">
          <table class="table table-hover">
            <tr>
              <th>제품타입</th>
              <td><input type="text" name="product_type"></td>
            </tr>

            <tr>
              <th>제품명</th>
              <td><input type="text" name="product_name"></td>
            </tr>

            <tr>
              <th>제품브랜드명</th>
              <td><input type="text" name="product_brand"></td>
            </tr>

            <tr>
              <th>제품 색상</th>
              <td><input type="text" name="product_color"></td>
            </tr>

            <tr>
              <th>제품 가격</th>
              <td><input type="text" name="product_price"></td>
            </tr>

            <tr>
              <th>제품 수</th>
              <td><input type="text" name="product_count"></td>
            </tr>

            <tr>
              <td>이미지 파일</td>
              <td><input type="file" name="filename"></td>
            </tr>
            
            <tr>
              <th>제품 설명</th>
              <td><input type="text" name="product_content"></td>
            </tr>

            <tr>

              <td colspan="2" id="product_add_btn_box">
                <input type="submit" value="제품 등록" id="product_btns">
                <button onclick="self.close();" id="product_btns">닫기</button>
              </td>
            </tr>

			
          </table>
        </form>
    </div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

