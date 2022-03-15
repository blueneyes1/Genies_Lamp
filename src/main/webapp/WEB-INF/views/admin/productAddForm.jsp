<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


  <title></title>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   
  <style>
  
    body {
      display : flex;
      flex-direction : column;
      align-items: center;
      text-align: center;
      font-size: 12px;
    }

    .wrap {
      margin-top: 50px;
    }
  
    table {
      font-size: 12px;
    }

    input[type=submit] {
    background-color: rgb(178, 178, 238);
    border: none;
    width: 90px;
    height: 25px;
    color: rgb(17, 17, 17);
    border-radius: 3px;
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
  <body>
  
      <div class="wrap">
        <form action="/productAddAction" method="post">
          <table class="table">
            <thead>
              
              <tr>
                <td>
                  <input type="hidden" value="${product_idx}" name="product_idx">
                </td>
              </tr>
              
              <tr>
                <td>상품 타입</td>
                <td>
                  <input type="text" name="product_type">
                </td>
              </tr>
              
              <tr>
                <td>상품명</td>
                <td>
                  <input type="text" name="product_name">
                </td>
              </tr>
              
              <tr>
                <td>상품 브랜드명</td>
                <td>
                  <input type="text" name="product_brand">
                </td>
              </tr>
              
              <tr>
                <td>상품 색상</td>
                <td>
                  <input type="text" name="product_color">
                </td>
              </tr>
              
              <tr>
                <td>상품 가격</td>
                <td>
                  <input type="text" name="product_price">
                </td>
              </tr>
              
              <tr>
                <td>상품 수</td>
                <td>
                  <input type="text" name="product_count">
                </td>
              </tr>
              
              <tr>
              <td><input type="file" name="product_img1" /></td>
              </tr>
              <tr>
              <td><input type="file" name="product_img2" /></td>
              </tr>
              
              <tr>
                <td>
                  <input type="hidden" value="${product_date}" name="product_date">
                </td>
              </tr>
              
              
              
              <tr>
                <td>
                  <input type="submit" formaction="/productAddAction" value="상품 등록">
                </td>
              <td>
              <button onclick="self.close();">닫기</button>
              </td>
              </tr>
            </tbody>
          </table>
        </form>
        </div>
  
  </body>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


</html>