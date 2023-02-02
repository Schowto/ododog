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
            <p>회원님의 비밀번호는 <span style="color: rgb(226, 36, 36); font-weight: bolder;" ><%= searchPwd.getUser_Pwd() %></span> 입니다.</p>
            <br><br><br>

            <input type="button" value="로그인 하러가기" id="btn" onclick="location.href ='<%=contextPath%>/views/member/loginUser.jsp'"> 
        
        
    </div>

        <!-- 
    <div class="login-wrapper">
        <h2 style="text-align: center;">비밀번호 변경</h2>
        <form method="post" action="<%= contextPath %>/searchUpdate.pwd" id="login-form">
            <input type="hidden" name="user_Id" value="<%= searchPwd.getUser_Id() %>">
            <input type="hidden" name="user_Pwd" value="<%= searchPwd.getUser_Pwd() %>">
            
            <input type="password" name="update_Pwd" placeholder="변경할 비밀번호">
           <input type="password" name="update_Pwd2" placeholder="비밀번호 확인"> 
            <div class="in" style="text-align: center;">
        </div>
            <input type="submit" value="변경">
        </form>
        
    </div>
    
     -->

   

  

</body>
</html>