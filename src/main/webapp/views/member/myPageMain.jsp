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
        }
        .line{
            width:1000px;
            height:3px;
            background: rgba(128, 128, 128, 0.26);
            margin:auto;
        }
        .title{
            width:1000px;
            margin:auto;
            font-size:12px;
        }
        #order{
            background: rgba(128, 128, 128, 0.26);
            width:1000px;
            height:150px;
            margin:auto;
        }
        #list{
            width:100%;
            height:100%;
            color: rgba(0, 0, 0, 0.705);
        }
        #myPageMenu{
            width:1000px;
            margin:auto;
        }
        #menu{
            width:290px;
            height: 270px;
            border:1px solid rgba(0, 0, 0, 0.123);
            display:inline-block;
            margin-top:20px;
            margin-bottom:20px;
        }
        #menu>div{
            height:90px;
        }

    </style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp"%>

    <div class="outer">

        <h2 align="center">마이페이지</h2>

        <div class="line"></div>
        <br>
       
        <div class="title">
            나의 주문처리 현황
        </div>
        <br>

        <form action="" id="order">
            <table id="list">
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

        <div id="myPageMenu">

            <div id="menu" style="margin-right:55px;" align="center">
                <div id="img">
                    <img src="/resources/images/my_order.png">
                </div>
                <div id="body" style="font-size:23px; color:rgba(0, 0, 0, 0.692);">
                    Order <br>
                    주문조회
                </div>
                <div id="foot" style="font-size:15px; color:rgba(0, 0, 0, 0.397);">
                    고객님께서 주문하신 상품의 <br>
                    주문내역을 확인하실 수 있습니다.
                </div>
            </div>

            <div id="menu" align="center">
                <div id="img">
                    <img src="/resources/images/my_profile.png">
                </div>
                <div id="body" style="font-size:23px; color:rgba(0, 0, 0, 0.692);">
                    Profile <br>
                    회원정보
                </div>
                <div id="foot" style="font-size:15px; color:rgba(0, 0, 0, 0.397);">
                    회원이신 고객님의 개인정보를 <br>
                    관리하는 공간입니다.
                </div>
            </div>

            <div id="menu" style="margin-left:55px;" align="center">
                <div id="img">
                    <img src="/resources/images/my_like.png">
                </div>
                <div id="body" style="font-size:23px; color:rgba(0, 0, 0, 0.692);">
                    Wishlist <br>
                    관심상품
                </div>
                <div id="foot" style="font-size:15px; color:rgba(0, 0, 0, 0.397);">
                    관심상품으로 등록하신 <br>
                    상품의 목록을 보여드립니다.
                </div>
            </div>

            <br>

            <div id="menu" style="margin-right:55px;" align="center">
                <div id="img">
                    <img src="/resources/images/my_point.png">
                </div>
                <div id="body" style="font-size:23px; color:rgba(0, 0, 0, 0.692);">
                    Mileage <br>
                    적립금
                </div>
                <div id="foot" style="font-size:15px; color:rgba(0, 0, 0, 0.397);">
                    적립금은 상품 구매시 <br>
                    사용하실 수 있습니다.
                </div>
            </div>

            <div id="menu" align="center">
                <div id="img" style="height:90px;">
                    <img src="/resources/images/my_board.png">
                </div>
                <div id="body" style="font-size:23px; color:rgba(0, 0, 0, 0.692);">
                    Board <br>
                    게시글 조회
                </div>
                <div id="foot" style="font-size:15px; color:rgba(0, 0, 0, 0.397);">
                    고객님께서 작성하신 게시물 내역을 <br>
                    확인하실 수 있습니다.
                </div>
            </div>

            <div id="menu" align="center" style="margin-left:55px;">
                <div id="img" style="height:90px;">
                    <img src="/resources/images/my_consult.png">
                </div>
                <div id="body" style="font-size:23px; color:rgba(0, 0, 0, 0.692);">
                    Consult <br>
                    1:1맞춤상담
                </div>
                <div id="foot" style="font-size:15px; color:rgba(0, 0, 0, 0.397);">
                    고객님의 궁금하신 문의사항에 대하여 <br>
                    1:1맞춤상담 내용을 <br>
                    확인하실 수 있습니다.
                </div>
            </div>

        </div>
</div>  






</body>
</html>