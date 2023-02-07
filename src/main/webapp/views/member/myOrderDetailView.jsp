<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.odd.member.model.vo.*, java.util.ArrayList, com.odd.order.model.vo.*" %>
<%
	AdminOrder o = (AdminOrder)request.getAttribute("o");
    ArrayList<OrdPro> list = (ArrayList<OrdPro>)request.getAttribute("list");
%>
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
    .myOrderView tr{
    	height:50px;
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
            	<div class="myOrderView" style="height:100%;">
            	
                    <table>
                                <%for(OrdPro op : list){%>
                                <tr>
                                    <td style="width:150px;"><img src="<%= op.getThumbImg() %>" ></td>
                                    <td style="width:250px;"><%=op.getProName() %></td>
                                    <td style="width:200px; padding-right: 20px;">
                                        <button type="button" onclick="location.href='<%=contextPath%>/review.me?no=<%=op.getProNo()%>'">리뷰작성</a></button>
                                    </td>
                                    <td style="width:200px; text-align:left;">
                                        &nbsp;카테고리 : <%=op.getCategory() %> <br><br>
                                        &nbsp;상품금액 : <%=op.getPrice() %>원 <br><br>
                                        &nbsp;상품수량 : <%=op.getAmount() %>

                                    </td>
                                </tr>
                                <%}%>
                            </table>
                    </div>


                    <br><br>

                    <div class="myOrderList" style="height:100%;"> 
                        <form class="order">
                            <table>
                                <tr>
                                    <td style="font-weight: 600; font-size: 14px;">주문정보</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>주문번호</td>
                                    <td><%=o.getOrdNo() %></td>
                                </tr>
                                <tr>
                                    <td>주문일자</td>
                                    <td><%=o.getOrderDate() %></td>
                                </tr>
                                <tr>
                                    <td>주문자</td>
                                    <td><%=o.getUserName() %></td>
                                </tr>
                                <tr>
                                    <td>입금여부</td>
                                    <td><%=o.getPayment()%></td>
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
                                    <td>배송비</td>
                                    <td><%=o.getDeliveryPrice() %></td>
                                </tr>
                                <tr>
                                    <td>적립금 할인</td>
                                    <td><%=o.getDiscount() %></td>
                                </tr>
                                <tr>
                                    <td>총 결제 금액</td>
                                    <td><%=o.getTotalPrice() %></td>
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
                                    <td><%=o.getUserName() %></td>
                                </tr>
                                <tr>
                                    <td>연락처</td>
                                    <td><%=o.getPhone() %></td>
                                </tr>
                                <tr>
                                    <td>주소</td>
                                    <td><%=o.getDelAdd() %></td>
                                </tr>
                                
                            </table>
                        </form>
                    </div>
                </div>

                <br>
                    <div align="center">               
                        <button type="button" id="btn2">주문목록보기</button>
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