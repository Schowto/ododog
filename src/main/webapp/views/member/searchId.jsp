<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        padding: 0;
        margin: 0;
        border: none;
    }
    body{
        font-size: 14px;
        font-family: 'Roboto', sans-serif;
    }
    .login-wrapper{
        margin: auto;
        width: 400px;
        height: 100%;
        padding: 40px;
        box-sizing: border-box;
        background-color: #cacaca;
        margin-top: 50px;
    }
    
    .login-wrapper > h2{
        font-size: 24px;
        color: rgb(100, 100, 100);
        margin-bottom: 20px;
    }
    #login-form > input{
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-top: 5px;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #ffffff;
    }
    #login-form > input[type="submit"]{
        color: #fff;
        font-size: 16px;
        background-color: rgb(100, 100, 100);
        margin-top: 20px;
    }
    #label{
        font-size: 14px;
        color:  rgb(100, 100, 100);
    }
    
    
        </style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>

    <div class="login-wrapper">
        <h2 style="text-align: center;">아이디 찾기</h2>
        <form method="post" action="" id="login-form" name="lf">
            <label for="" id="label"><b>이름</b></label>
            <input type="text" name="user_Name" placeholder="내용을 입력해주세요.">
            <label for="" id="label"><b>이메일</b></label>
            <input type="email" name="email" placeholder="내용을 입력해주세요.">
            <div class="in" style="text-align: center;">
        </div>
            <input type="button" value="아이디 찾기" onclick="searchId()">
        </form>
        
    </div>
    
    <script> 
    

    </script>
   
    
  

</body>
</html>