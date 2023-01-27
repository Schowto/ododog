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
        margin: auto;
        margin-top:180px;
        margin-bottom: 200px;
        width:75%;
        height:100%;
        display: inline-block;
        margin-left:40px;
    }
    table{
        width:100%;
        height:100%;
        border-top:1px solid rgb(220,220,220);
        border-collapse: collapse;
        border-spacing: 0;
    }
    .loginUser td{
       
        border-bottom:1px solid rgb(220,220,220);
        text-align: center;
        height:50px;
    }
    .logoutUser td{
        border-bottom:1px solid rgb(220,220,220);
        text-align: center;
    }
    .btn1>a{
        text-decoration-line:none ;
    }
    #modified{
        text-decoration-line:none ;
        color:black;
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
            <a href="<%=contextPath%>/myWhish.me" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px; color:rgb(200, 140, 140);">게시글조회</a> <br><br>
            <a href="<%=contextPath%>/consult.bo" style="font-size:17px;">1:1맞춤상담</a>
        </div>

        <script>
             $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                 $(this).css("color", "rgb(50, 50, 50)");
             })
         </script>

        <div class="content">

            <h2 align="center" style="color:rgb(50, 50, 50); font-weight: 600;">게시글 조회</h2> 
            <br><br><br><br>

            <div class="myBoard">

                    <div style="font-size:14px; font-weight:600; color:rgb(50, 50, 50);">
                        내가 쓴 게시글
                    </div>
                    <br>
                    <!-- 작성한 게시글이 없을때 -->
                    <form class="logoutUser">
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
                                    <br><br>
                                    <img src="<%=contextPath%>/resources/images/error.png"> <br>
                                    게시글이 존재하지 않습니다. 
                                    <br><br><br>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <br><br><br>

                    <!-- 작성한 게시글이 있을때 -->
                    <div style="font-size:13px; color:rgb(50, 50, 50); font-weight:600;">
                        내가 쓴 게시글
                    </div>

                    <br>

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
                                <td>
                                    <button>
                                       <a href="<%=contextPath%>/boardEnroll.me" id="modified">수정</a>
                                    </button>
                                </td>
                                <td><button class="btn-red">삭제</button></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2023.01.22</td>
                                <td>유기견봉사같이하실분구해욥~</td>
                                <td><button>수정</button></td>
                                <td><button class="btn-red">삭제</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2023.01.22</td>
                                <td>유기견봉사같이하실분구해욥~</td>
                                <td><button>수정</button></td>
                                <td><button class="btn-red">삭제</button></td>
                            </tr>
                        </table>
                    </form>

                    <!--
                    <script>
                        $(function(){
                            $("#modified").click(function(){
                                location.href="<%=contextPath%>/boardEnroll.me";
                            });
                        })
                    </script>
                    -->
                    
                </div>

        </div>

        <%@ include file="../common/userFooterbar.jsp"%>






    </div>

</body>
</html>