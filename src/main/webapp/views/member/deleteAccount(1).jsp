<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
    border:1px solid black;
    margin:auto;
    height:100%;
    width:1200px;
    }

    /****** 사이드 ******/
    #side{
        border:1px solid blue;
        width:20%; height:100%;
        padding:20px;
        color: rgb(50, 50, 50);
        font-weight: 600;
        float:left;
    }
    #side>hr{margin-bottom:30px; border:1px solid rgb(220,220,220);}
    #side>a{
        text-decoration:none;
        color: rgb(50, 50, 50);
    }

    /****** 내용 ******/
    .content{
        margin:auto;
        margin-top:180px;
        margin-bottom:200px;
        width:75%;
        height:100%;
        display: inline-block;
        border:1px solid red;
    }
    h2{
        color:rgb(50, 50, 50);
        font-weight: 600;
    }
    .delete{
        width:100%;
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

	<%@ include file="../common/userMenubar.jsp" %>

    <div class="outer">

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px;">주문조회</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px; color:rgb(200, 140, 140);">회원정보</a> <br><br>
            <a href="" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="" style="font-size:17px;">1:1맞춤상담</a>
        </div>

        <script>
             $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                 $(this).css("color", "rgb(50, 50, 50)");
             })
         </script>

        <div class="content">

            <h2 align="center">회원탈퇴</h2>
            <br><br><br><br>

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


        <%@ include file="../common/userFooterbar.jsp"%>


    </div>

</body>
</html>