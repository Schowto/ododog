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
    }
    .myBoardContent{
        text-align: left;
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
                        <td>회원작성글번호</td>
                        <td>회원작성일</td>
                        <td>회원제목</td>
                        <td>회원아이디</td>

                    </tr>
                    <tr > 
                        <td colspan="5" id="myBoardContent">
                            내가쓴게시글내용이 들어올자리 호로로로로로로로로로로로로로ㅗ로ㅗㄹ
                    </td>

                    </tr>
                </table>
            </form>



        </div>








    </div>


</body>
</html>