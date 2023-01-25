<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top:50px;
    }
    .myBoard{
        margin:auto;
        height:100%;

    }
    table{
        width:800px;
        height:100%;
        border-top:1px solid gray;
        border-collapse: collapse;
        border-spacing: 0;
    }
    .loginUser td{
       
        border-bottom:1px solid gray;
        text-align: center;
        height:50px;
    }
    .logoutUser td{
        border-bottom:1px solid gray;
        text-align: center;
    }
    .btn1{
        background-color: white;
        border:1px solid gray;
        border-radius: 3px;
        color:gray
    }
    .btn2{
        background-color: rgb(200, 140, 140);
        border:white;
        border-radius: 3px;
        color:white;
    }
</style>
</head>
<body>

	<%@ import file="../common/myPageMain.jsp" %>

    <div class="outer">

       <h2 align="center">게시글 조회</h2> 
       <br><br>

       <div class="myBoard">

        <div style="font-size:14px; font-weight:600; color:rgba(27, 26, 26, 0.753);">
            내가 쓴 게시글
        </div>
        <br>
        <!-- 작성한 게시글이 없을때 -->
        <div class="logoutUser">
            <form>
                <table>
                    <tr style="height:50px;"> 
                        <td style="width:15%;">번호</td>
                        <td style="width:15%;">작성일</td>
                        <td style="width:40%;">제목</td>
                        <td style="width:15%;">수정</td>
                        <td style="width:15%;">삭제</td>

                    </tr>
                    <tr style="height:100px;">
                        <td colspan="5" style="font-weight:600; color:rgba(18, 17, 17, 0.795);">
                            <img src="/resources/images/myBoardError.png"> <br>
                            게시글이 존재하지 않습니다. 
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <br>

        <!-- 작성한 게시글이 있을때 -->
        <div>
            <form class="loginUser">
                <table>
                    <tr>
                        <td style="width:120px;">번호</td>
                        <td style="width:120px;">작성일</td>
                        <td style="width:320px;;">제목</td>
                        <td style="width:120px;">수정</td>
                        <td style="width:120px;">삭제</td>

                    </tr>
                    <tr>
                        <td>5</td>
                        <td>2023.01.22</td>
                        <td>유기견봉사같이하실분구해욥~</td>
                        <td><button class="btn1">수정</button></td>
                        <td><button class="btn2">삭제</button></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>2023.01.22</td>
                        <td>유기견봉사같이하실분구해욥~</td>
                        <td><button class="btn1">수정</button></td>
                        <td><button class="btn2">삭제</button></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>2023.01.22</td>
                        <td>유기견봉사같이하실분구해욥~</td>
                        <td><button class="btn1">수정</button></td>
                        <td><button class="btn2">삭제</button></td>
                    </tr>
                </table>
            </form>
        </div>



       </div>






    </div>

</body>
</html>