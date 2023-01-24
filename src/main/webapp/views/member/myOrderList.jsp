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
    .myOrder{
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
        width:100%;
        border-collapse: collapse;
        border-spacing: 0;

    }
    .myOrderView td{
        text-align:center;
        width:100px;
        height:150px;

    }
    button{
        border-radius:4px; 
        background:white; 
        width:80px; 
        height:30px; 
        border:1px solid gray;
    }
    select{
        height:30px;
        width:250px;
    }
    #date1, #date2{
        height:30px;
    }
    #date1{
        margin-left:10px;
    }
    #date2{
        margin-right:10px;
    }
    .myOrderList table{
        width:100%;
        border-collapse: collapse;
        border-spacing: 0;
        border-top:1px solid gray;
        margin-bottom: 20px;
    }
    .myOrderList td{
        height:50px;
        border-bottom:1px solid gray;
        text-align: center;
    }
</style>
</head>
<body>

	<%@ import file="../common/userMenubar.jsp" %>

    <div class="outer">

        <h2 align="center">주문조회</h2>

        <div class="myOrde">
            <div style="font-size:13px; color:rgba(36, 33, 33, 0.903); font-weight:600;">
                나의 주문조회 내역(주문횟수들어갈자리)
            </div>
            <br>
            <div class="myOrderView">
                <form action="">
                    <table>
                        <tr>
                            <td colspan="2">
                                <select name="" id="" >
                                    <option value="">&nbsp;&nbsp;전체 주문처리 상태&nbsp;&nbsp;</option>
                                    <option value="">&nbsp;&nbsp;전체 주문처리 상태&nbsp;&nbsp;</option>
                                    <option value="">&nbsp;&nbsp;전체 주문처리 상태&nbsp;&nbsp;</option>
                                    <option value="">&nbsp;&nbsp;전체 주문처리 상태&nbsp;&nbsp;</option>
                                    <option value="">&nbsp;&nbsp;전체 주문처리 상태&nbsp;&nbsp;</option>
                                </select>
                            </td>
                            <td>
                                <button>1주일</button>
                            </td>
                            <td>
                                <button>1개월</button>
                            </td>
                            <td>
                                <button>3개월</button>
                            </td>
                            <td>
                                <input type="date" name="date1" id="date1" value="startDate">
                            </td>
                            <td style="font-size:25px;">
                                ~
                            </td>
                            <td>
                                <input type="date" name="date2" id="date2" value="endDate">
                            </td>

                        </tr>
                    </table>
                </form>
            </div>

            <br>
            <!--주문내역이없을때-->
            <div class="myOrderList">
                <form action="">
                    <table>
                        <tr>
                            <td style="width:200px;">주문일자[주문번호]</td>
                            <td style="width:150px;">이미지</td>
                            <td style="width:150px;">상품정보</td>
                            <td style="width:100px;">수량</td>
                            <td style="width:200px;">상품구매금액</td>
                            <td style="width:200px;">주문처리상태</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height:150px; font-weight: 600;">
                                <img src=""> <br>
                                찾으시는 기간 내에 해당하는 내역이 없습니다.
                            </td>
                        </tr>
                    </table>
                </form>




            </div>

            <!--주문내역이있을때-->
            <div class="myOrderList">
                <form action="">
                    <table>
                        <tr>
                            <td style="width:200px;">주문일자[주문번호]</td>
                            <td style="width:150px;">이미지</td>
                            <td style="width:150px;">상품정보</td>
                            <td style="width:100px;">수량</td>
                            <td style="width:200px;">상품구매금액</td>
                            <td style="width:200px;">주문처리상태</td>
                        </tr>
                        <tr>
                            <td style="width:200px; height:150px;">20230122-1234567</td>
                            <td style="width:150px;"><img src=""></td>
                            <td style="width:150px;">댕댕이수제간식</td>
                            <td style="width:100px;">1</td>
                            <td style="width:200px;">15,000원</td>
                            <td style="width:200px;">배송준비중</td>
                        </tr>
                        <tr>
                            <td style="width:200px; height:150px;">20230122-1234567</td>
                            <td style="width:150px;"><img src=""></td>
                            <td style="width:150px;">댕댕이수제간식</td>
                            <td style="width:100px;">1</td>
                            <td style="width:200px;">15,000원</td>
                            <td style="width:200px;">배송준비중</td>
                        </tr>
                    </table>
                </form>




            </div>
        </div>



    </div>
	

</body>
</html>