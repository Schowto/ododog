<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1000px;
        height:100%;
        margin-top:50px;
        margin:auto;
    }
    .myBoard{
        margin:auto;
        width:800px;
        height:100%;
    }
    table{
        width:800px;
        border-top:1px solid gray;
        border-collapse: collapse;
        border-spacing: 0;
    }
    td{
        border-bottom:1px solid gray;
        text-align: center;
        height:50px;
        font-weight: 500;
    }
    input{
        height:100%;
        box-sizing: border-box;
        border:none;
        width:100%;

    }
    textarea{
        width:100%;
        border:none;
        resize:none; 
        margin-top:5px; 
        margin-bottom:5px; 
        background:rgba(128, 128, 128, 0.21);
    }
    button{
        border-radius:4px; 
        background:white; 
        width:80px; 
        height:30px; 
        border:1px solid gray;
    }
</style>
</head>
<body>

	<%@ import file="../common/myPageMain.jsp" %>

    <div class="outer">

        <h2 align="center">게시글 수정</h2>
        <br><br>

        <div class="myBoard">

            <form action="">
                <table>
                    <tr style="height:50px;"> 
                        <td style="width:20%;">번호</td>
                        <td style="width:20%;">작성일</td>
                        <td style="width:40%;">제목</td>
                        <td style="width:20%;">작성자</td>

                    </tr>
                    <tr style="height:50px;"> 
                        <td>5</td>
                        <td>2023.01.22</td>
                        <td><input type="text" name="myBoardTitle" value=""></td>
                        <td>회원아이디</td>

                    </tr>
                    <tr > 
                        <td colspan="5">
                         <textarea name="myBoardContent" cols="100%" rows="20px;"></textarea>   
                        </td>

                    </tr>
                </table>
            </form>
            <br>

            <div align="center">
            <button type="submit">작성완료</button>
            </div>

        </div>








    </div>


</body>
</html>