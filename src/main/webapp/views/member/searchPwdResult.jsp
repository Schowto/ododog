<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.odd.member.model.vo.Member"%>
<%
Member searchPwd = (Member)session.getAttribute("searchPwd");
%>    
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
    #btn{
        color: #fff;
        font-size: 16px;
        background-color: rgb(100, 100, 100);
        margin-top: 20px;
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-top: 5px;
        margin-bottom: 16px;
        border-radius: 6px;
    }
    #label{
        font-size: 14px;
        color:  rgb(100, 100, 100);

    }
    .login-wrapper > p{
        font-size: 16px;
        text-align: center;
    }
</style>
</head>

<body>
	<%@ include file="../common/userMenubar.jsp"%>

    <div class="login-wrapper">
        <h2 style="text-align: center;">비밀번호 찾기</h2>
            <br><br><br>
            <p>회원님의 비밀번호는<span id="userPwd" style="color: rgb(226, 36, 36); font-weight: bolder;"></span> 입니다.</p>
            <br><br><br>

            <input type="button" value="로그인 하러가기" id="btn" onclick="location.href ='<%=contextPath%>/views/member/loginUser.jsp'"> 
        
        
    </div>
    

    <script type="text/javascript">
    
        var password = '<%= searchPwd.getUser_Pwd() %>';
	    var maskedPw = '';
	    
	    console.log(password.length);
	    
	    if(password.length <= 3)
	    {
	       maskedPw = password.substring(0,password.length).replace(/[0-9a-zA-Z]/g, "*");
	    }
	    else 
	    {
	       maskedPw =  password.substring(0,2) + password.substring(2,password.length).replace(/[0-9a-zA-Z]/g, "*")
	    }
	    
	    console.log(maskedPw);	
	    $("#userPwd").html(maskedPw);

    </script>

     
    
    
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@ include file="../common/userFooterbar.jsp"%>

  

</body>
</html>