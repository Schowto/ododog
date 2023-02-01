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
        width:20%; 
        height:100%;
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
        width:75%;
        height:100%;
        margin:auto;
        margin-top:180px;
        margin-bottom:200px;
        display: inline-block;
        margin-left:40px;
    }
    table{
        border-collapse: collapse;
        border-spacing: 0;
    }
    .myOrderDetailView{
        width:100%;
        height:100%;
        margin:auto;
    }
    .myOrderView{
        width: 100%;
        height:150px;
        border:1px solid rgb(220,220,220);
    }
    .myOrderView table{
        width:100%;
        height:150px;
    }
    .myOrderView td{
       text-align: center;
       font-weight: 600;
    }
    .myOrderView img{
        width:100%;
        height:100%;
        box-sizing: border-box;
    }
    .myOrderList table{
        width:100%;
        height:100%;
        border-top:1px solid rgb(220,220,220);
    }
    .myOrderList td{
        height:50px;
    }
    .myOderList td:first-child{
        text-align:left;
    }
    .myOrderList td:last-child{
        text-align:right;
    }
    .myOrderList tr:first-child{
        border-bottom:1px solid rgb(220,220,220);
    }
    .deliver tr:last-child{
        border-bottom:1px solid rgb(220,220,220);
    }
    .btn-red{
        width:70px;
        height:30px;
    }
    #btn2{
        width:100px;
        height:30px;
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
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px; color:rgb(200, 140, 140);">주문조회</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px;">회원정보</a> <br><br>
            <a href="<%=contextPath%>/myWhish.me" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="<%=contextPath%>/list.co" style="font-size:17px;">1:1맞춤상담</a>
        </div>

        <script>
             $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                 $(this).css("color", "rgb(50, 50, 50)");
             })
         </script>

        <div class="content">

            <h2 align="center" style="color:rgb(50, 50, 50); font-weight:600;">주문조회 > 상세조회</h2>
            <br><br><br><br>

            <div class="myOrderDetailView">
                    <div style="font-size:13px; color:rgb(50, 50, 50); font-weight:600;">
                        2023.01.22 20:20 (주문날짜시간들어갈자리)
                    </div>

                    <br>

                    <div class="myOrderView">
                        <form action="">
                            <table>
                                <tr>
                                    <td style="width:150px;"><img src="" ></td>
                                    <td style="width:250px;">댕댕이 수제간식</td>
                                    <td style="width:200px; padding-right: 20px;">
                                        <button class="btn-red">리뷰작성</button>
                                    </td>
                                    <td style="width:200px; text-align:left;">
                                        &nbsp;상품명 : 댕댕츄르 <br><br>
                                        &nbsp;구매자 : 와그작 <br><br>
                                        &nbsp;총금액 : 15,000원
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

                    <script>
                        $(function(){
                            $(".btn-red").click(function(){
                                location.href="<%=contextPath%>/review.me";
                            })
                        })
                    </script>


                    <br><br>

                    <div class="myOrderList"> 
                        <form class="order">
                            <table>
                                <tr>
                                    <td style="font-weight: 600; font-size: 14px;">주문정보</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>주문번호</td>
                                    <td>20230122-1234567</td>
                                </tr>
                                <tr>
                                    <td>주문일자</td>
                                    <td>2023.01.22</td>
                                </tr>
                                <tr>
                                    <td>주문자</td>
                                    <td>와그작</td>
                                </tr>
                                <tr>
                                    <td>주문처리상태</td>
                                    <td>배송준비중</td>
                                </tr>
                            </table>
                        </form>

                        <form class="cash">
                            <table>
                                <tr>
                                    <td style="font-size: 14px; font-weight: 600;">결제정보</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>결제방법</td>
                                    <td>카드결제</td>
                                </tr>
                                <tr>
                                    <td>상품금액</td>
                                    <td>18,000</td>
                                </tr>
                                <tr>
                                    <td>적립금 할인</td>
                                    <td>3,000</td>
                                </tr>
                                <tr>
                                    <td>총 결제 금액</td>
                                    <td>15,000</td>
                                </tr>
                            </table>
                        </form>

                        <form class="deliver">
                            <table>
                                <tr>
                                    <td style="font-weight: 600; font-size: 14px;">배송지 정보</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>받는분</td>
                                    <td>와그작</td>
                                </tr>
                                <tr>
                                    <td>연락처</td>
                                    <td>010-111-1111</td>
                                </tr>
                                <tr>
                                    <td>주소</td>
                                    <td>메롱시 바보동</td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>

                <br>
                    <div align="center">               
                        <button id="btn2">주문목록보기</button>
                    </div> 

                    <script>
                        $(function(){
                            $("#btn2").click(function(){
                                location.href="<%=contextPath%>/myOrder.me";
                            })
                        })
                    </script>

        </div>
        
        

        <%@ include file="../common/userFooterbar.jsp"%>


    </div>

</body>
</html>