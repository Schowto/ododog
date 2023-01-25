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
        margin:auto;
        width:1000px;
        height:500px;
    }
    .delete{
        width:800px;
        margin:auto;
    }
    .deleteText{
        margin:auto;
        font-size: 13px;
        color:rgb(50, 50, 50);
        font-weight:600;
    }
    table{
        border-collapse: collapse;
        border-spacing: 0;
        border-top:1px solid rgb(220, 220, 220);
    }
    td{
        margin:auto;
        border-bottom: 1px solid rgb(220, 220, 220);
        border-left:1px solid rgb(220, 220, 220);
        height:60px
    }
    td:first-child{
        border-left:none;
    }
    input{
        border:1px solid rgb(220, 220, 220);
    }
    
    
</style>
</head>
<body>

	<%@ import file="../common/userMenubar.jsp" %>

    <div class="outer">

        <h2 align="center">회원탈퇴</h2>
        <br><br>

        <div class="delete"">

            <div class="deleteText">
                회원 탈퇴를 위해 다시한번 비밀번호를 입력해주세요
            </div>
            <br>

            <div class="deletePassword">
                <form>
                    <table>
                        <tr>
                            <td style="width:200px; text-align:center;">비밀번호</td>
                            <td style="width:800px;">&nbsp;&nbsp;<input type="password" size=30 required></td>
                        </tr>
                    </table>
                </form>
            </div>
            <br>

            <div align="center">
            <button style="border-radius:4px; background:white; width:80px; height:30px; border:1px solid gray;">확인</button>
            </div>


        </div>





    </div>

</body>
</html>