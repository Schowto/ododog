<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .outer{
            margin-top:50px;
            margin:auto;
            width:1200px;
            height:100%;
        }
        .line{
            width:1000px;
            height:3px;
            background: rgb(220, 220, 220);
            margin:auto;
        }
        .title{
            width:1000px;
            margin:auto;
            font-size:12px;
            font-weight: 600;
        }
        .order{
            background: rgb(220, 220, 220);
            width:1000px;
            height:150px;
            margin:auto;
        }
        table{
            margin:auto;
            text-align: center;
        }
        .list{
            width:100%;
            height:100%;
            color: rgba(0, 0, 0, 0.705);
        }
        .myPageMenu{
            width:1000px;
            height:100%;
            margin:auto;
        }
        .menu{
            width:290px;
            height: 270px;
            border:1px solid rgb(220, 220, 220);
            display:inline-block;
            margin-top:20px;
            margin-bottom: 20px;
        }
        .menu>div{
            height:90px;
        }
        img:hover{
            opacity: 0.7;
            cursor: pointer;
        }

    </style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp"%>

    <div class="outer">

        <h2 align="center" style="color:rgb(50, 50, 50);">마이페이지</h2>

        <div class="line"></div>
        <br>
       
        <div class="title">
            나의 주문처리 현황
        </div>

        <br>

        <form class="order">
            <table class="list">
                <tr>
                    <th style="font-size:17px;">입금전</th>
                    <th style="font-size:17px;">배송준비중</th>
                    <th style="font-size:17px;">배송중</th>
                    <th style="font-size:17px;">배송완료</th>
                    <td style="font-size:13px;">취소 0</td>
                </tr>

                <tr>
                    <th rowspan="2" style="font-size:45px;">0</th>
                    <th rowspan="2" style="font-size:45px;">0</th>
                    <th rowspan="2" style="font-size:45px;">0</th>
                    <th rowspan="2" style="font-size:45px;">0</th>
                    <td style="font-size:13px;">교환 0</td>
                </tr>

                <tr>
                    <td style="font-size:13px;">반품 0 </td>
                </tr>
            </table>
        </form>

        <br><br>

        <div class="myPageMenu">

            <div class="menu" style="margin-right:55px; " align="center">
                <div class="img">
                    <br>
                    <a href="<%=contextPath%>/myOrder.me"><img src="<%= contextPath %>/resources/images/myOrder.png"></a>
                </div>
                <div class="body" style="font-size:23px; color:rgb(50, 50, 50);">
                    Order <br>
                    주문조회
                </div>
                <div class="foot" style="font-size:15px; color:rgb(220, 220, 220);">
                    고객님께서 주문하신 상품의 <br>
                    주문내역을 확인하실 수 있습니다.
                </div>
            </div>

            <div class="menu" align="center">
                <div class="img">
                    <br>
                    <a href="<%=contextPath%>/myPage.me"><img src="<%= contextPath %>/resources/images/myProfile.png"></a>
                </div>
                <div class="body" style="font-size:23px; color:rgb(50, 50, 50);">
                    Profile <br>
                    회원정보
                </div>
                <div class="foot" style="font-size:15px; color:rgb(220, 220, 220);">
                    회원이신 고객님의 개인정보를 <br>
                    관리하는 공간입니다.
                </div>
            </div>

            <div class="menu" style="margin-left:55px;" align="center" onclick="pageUse();">
                <div id="img">
                    <br>
                    <a href=""><img src="<%= contextPath %>/resources/images/myLike.png"></a>
                </div>
                <div class="body" style="font-size:23px; color:rgb(50, 50, 50);">
                    Wishlist <br>
                    관심상품
                </div>
                <div class="foot" style="font-size:15px; color:rgb(220, 220, 220);">
                    관심상품으로 등록하신 <br>
                    상품의 목록을 보여드립니다.
                </div>
            </div>

            <br>

            <div class="menu" style="margin-right:55px;" align="center">
                <div id="img">
                    <br>
                    <a href=""><img src="<%= contextPath %>/resources/images/myPoint.png"></a>
                </div>
                <div class="body" style="font-size:23px; color:rgb(50, 50, 50);">
                    Mileage <br>
                    적립금
                </div>
                <div class="foot" style="font-size:15px; color:rgb(220, 220, 220);">
                    적립금은 상품 구매시 <br>
                    사용하실 수 있습니다.
                </div>
            </div>

            <div class="menu" align="center">
                <div class="img">
                    <br>
                    <a href=""><img src="<%= contextPath %>/resources/images/myBoard.png"></a>
                </div>
                <div class="body" style="font-size:23px; color:rgb(50, 50, 50);">
                    Board <br>
                    게시글 조회
                </div>
                <div class="foot" style="font-size:15px; color:rgb(220, 220, 220);">
                    고객님께서 작성하신 게시물 내역을 <br>
                    확인하실 수 있습니다.
                </div>
            </div>

            <div class="menu" align="center" style="margin-left:55px;">
                <div class="img">
                    <br>
                    <a href=""><img src="<%= contextPath %>/resources/images/myConsult.png"></a>
                </div>
                <div class="body" style="font-size:23px; color:rgb(50, 50, 50);">
                    Consult <br>
                    1:1맞춤상담
                </div>
                <div class="foot" style="font-size:15px; color:rgb(220, 220, 220);">
                    궁금하신 문의사항에 대하여 <br>
                    맞춤상담 내용을 확인하실 수 있습니다.
                </div>
            </div>

        </div>
    </div>  

    <script>
        $function(){
           $(".menu").click(){
            ;
           }
        }
    </script>






</body>
</html>