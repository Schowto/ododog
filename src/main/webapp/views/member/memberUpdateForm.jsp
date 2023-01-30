<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <div class="container">
    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
      Open modal
    </button>
  
    <!-- The Modal -->
    <div class="modal fade" id="myModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
        
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원정보수정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          
          <!-- Modal body -->
          <div class="modal-body">
            <label></label> <br><br>
            <label>이름</label> 
            <input type="" name="" value=""> <br><br>

            <label>이메일</label> 
            <input type="" name="" value=""> <br><br>

            <label>전화번호</label> 
            <input type="" name="" value=""> <br><br>

            <label>우편번호</label> 
            <input type="" name="" value=""> <br>
            <label>기본주소</label> 
            <input type="" name="" value=""> <br>
            <label>상세주소</label> 
            <input type="" name="" value=""> <br>
          </div>
          
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          </div>
          
        </div>
      </div>
    </div>
    
  </div>
</body>
</html>