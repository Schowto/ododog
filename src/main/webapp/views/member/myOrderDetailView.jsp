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
        margin:auto;
        margin-top:50px;


    }
    .myOrderDetailView{
        width:800px;
        height:100%;
        margin:auto;

    }
    .myOrderView{
        width: 100%;
        height:150px;
        border:1px solid gray;
    }
    .myOrderView table{
        border-collapse: collapse;
        border-spacing: 0;
        width:100%;
        height:150px;
    }
    .myOrderView td{
       text-align: center;
       font-weight: 600;;
    }
    img{
        width:100%;
        height:100%;
        box-sizing: border-box;
    }
    .myOrderView button{
        border-radius:4px; 
        background:red; 
        width:80px; height:30px; 
        border:none; 
        color:white; 
        font-weight: 900;
    }
    .myOrderList table{
        border-collapse: collapse;
        border-spacing: 0;
        width:100%;
        height:100%;
        border-top:1px solid gray;
        border-bottom:1px solid gray;
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
        border-bottom:1px solid gray;
    }
</style>
</head>
<body>

	<%@ import file="../common/userMenubar.jsp" %>

    <div class="outer">

        <h2 align="center">주문조회 > 상세조회</h2>

        <div class="myOrderDetailView">
                <div style="font-size:13px; color:rgba(36, 33, 33, 0.903); font-weight:600;">
                    2023.01.22 20:20 (주문날짜시간들어갈자리)
                </div>

                <br>

                <div class="myOrderView">
                    <form action="">
                        <table>
                            <tr>
                                <td style="width:150px;"><img src="" ></td>
                                <td style="width:250px;">댕댕이 수제간식</td>
                                <td style="width:200px; padding-right: 20px;"><button>리뷰작성</button></td>
                                <td style="width:200px; text-align:left;">
                                    &nbsp;상품명 : 댕댕츄르 <br><br>
                                    &nbsp;구매자 : 와그작 <br><br>
                                    &nbsp;총금액 : 15,000원
                                    
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

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
        <button style="border-radius:4px; background:white; width:100px; height:30px; border:1px solid gray;">주문목록보기</button>
        </div>


    </div>

</body>
</html>