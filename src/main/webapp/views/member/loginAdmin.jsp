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
        .wrap {
            width: 1200px;
            margin: auto;
            position:relative;
        }
        .wrap>div {float: left;}
        div {box-sizing: border-box;}
     
        /* 수정 : 사이드 고정 위해 position속성 */
        #side {
            height: 100vh;
            background: rgb(50, 50, 50);
            position:fixed;
        }

        /* 수정 : position속성 */
        #header {
            width:75%; height:40px;
            padding: 7px 0px;
            color: rgb(50, 50, 50);
            font-size: 13px;
            position:absolute;
            left:300px;
        }

        /* 수정 : height 삭제, position속성 */
        #content {
            width: 75%;
            padding-top: 20px;
            color: rgb(50, 50, 50);
            position:absolute;
            left:300px;
            top:36px;
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
    <div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
			    <div class="login-wrapper">
        <h2 style="text-align: center;">로그인</h2>
        <form action="<%= request.getContextPath() %>/login.ad" method="post" id="login-form">
            <input type="text" name="adminId" placeholder="ID">
            <input type="password" name="password" placeholder="Password">
            <div class="in" style="text-align: center;">
        </div>
            <input type="submit" value="로그인">
        </form>

        </div>
        
    </div>
</body>
</html>