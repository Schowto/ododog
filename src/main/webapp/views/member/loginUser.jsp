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
    .login-wrapper{
        margin: auto;
        width: 400px;
        height: 350px;
        padding: 40px;
        box-sizing: border-box;
        font-size: 14px;
    
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
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #ececec;
    }
    #login-form > input[type="submit"]{
        color: #fff;
        font-size: 16px;
        background-color: rgb(100, 100, 100);
        margin-top: 20px;
    }
    
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp"%>

    <div class="login-wrapper">
        <h2 style="text-align: center;">로그인</h2>
        <form action="<%= request.getContextPath() %>/login.me" method="post" id="login-form">
            <input type="text" name="userId" placeholder="ID">
            <input type="password" name="userPwd" placeholder="Password">
            <div class="in" style="text-align: center;">
        <a href="<%=contextPath%>/views/member/memberInsert.jsp">회원가입</a> |
        <a href="<%=contextPath%>/views/member/searchId.jsp"">아이디찾기</a>  |
        <a href="<%=contextPath%>/views/member/searchPwd.jsp"">비밀번호찾기</a> 
        </div>
            <input type="submit" value="로그인">
        </form>
        
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <%@ include file="../common/userFooterbar.jsp"%>

</body>
</html>