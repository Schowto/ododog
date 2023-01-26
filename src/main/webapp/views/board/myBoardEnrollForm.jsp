<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
    /*border:1px solid black;*/
    margin:auto;
    height:100%;
    width:1200px;
    }

    /****** 사이드 ******/
    #side{
        /*border:1px solid blue;*/
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
        width:75%;
        height:100%;
        margin-top:180px;
        margin-bottom: 200px;
        display: inline-block;
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
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px;">회원정보</a> <br><br>
            <a href="" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px; color:rgb(200, 140, 140);">게시글조회</a> <br><br>
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

            <h2 align="center" style="color:rgb(50,50,50); font-weight:600;">게시글 수정</h2>
            <br><br><br><br>

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
                            <td><input type="text" name="myBoardTitle" value="회원이작성한게시물의제목" style="text-align:center;"></td>
                            <td>회원아이디</td>

                        </tr>
                        <tr > 
                            <td colspan="5">
                                <br>
                                <textarea name="myBoardContent" cols="100%" rows="20px;" style="resize:none;">회원이작성한게시물의내요오오옹롱롸외마람어ㅏㅣㅇㅁ러ㅏ이오용오옹~~</textarea>   
                                <br><br>
                            </td>

                        </tr>
                    </table>
                </form>
                <br>

                <div align="center">
                <button type="submit" onclick="location.href='<%=contextPath%>/myBoard.me'">작성완료</button>
                </div>

            </div>

        </div>



		<%@ include file="../common/userFooterbar.jsp" %>




    </div>


</body>
</html>