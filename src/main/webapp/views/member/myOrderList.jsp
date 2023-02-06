<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.order.model.vo.*, com.odd.member.model.vo.*, com.odd.order.model.vo.*"%>
<%
	ArrayList<MyOrder> list = (ArrayList<MyOrder>)request.getAttribute("list");
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
    #content{
        width:75%;
        height:100%;
        margin:auto;
        margin-top:180px;
        margin-bottom:200px;
        display: inline-block;
        margin-left:40px;
    }
    h2{
        color:rgb(50, 50, 50);
        font-weight: 600;
    }
    .myOrder{
        width:800px;
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
        border-collapse: collapse;
        border-spacing: 0;
        margin:auto;

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
        border:1px solid rgb(220,220,220);
    }
    select{
        height:30px;
        width:200px;
    }
    #date1, #date2{
        height:30px;
    }
    #date1{
        margin-left:10px;
    }
    #date2{
        margin-right:20px;
    }
    .myOrderList table{
        width:100%;
        border-collapse: collapse;
        border-spacing: 0;
        border-top:1px solid rgb(220,220,220);
        margin-bottom: 20px;
    }
    .myOrderList td{
        height:50px;
        border-bottom:1px solid rgb(220,220,220);
        text-align: center;
    }
    #orderNo:hover{
        opacity: 0.7;
        cursor: pointer;
    }
    .myOderList tr:hover{
    	background:rgb(220,220,220);
        cursor: pointer;
    }
    .myOrderList{
    	box-sizing: border-box;
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

        <div id="content">

            <h2 align="center" style="color:rgb(50,50,50); font-weight:600;">주문조회</h2>
            <br><br><br><br>

            <div class="myOrde">
                <div style="font-size:13px; color:rgb(50, 50, 50); font-weight:600;">
                    나의 주문조회 내역
                </div>
                <br>
                <!--
                <div class="myOrderView">
                    
                    <table>
                            <tr>
                                <td colspan="2" style="padding-left: 15px;">
                                    <select name="" id="" >
                                        <option value="">&nbsp;&nbsp;전체 주문처리 상태&nbsp;&nbsp;</option>
                                        <option value="">&nbsp;&nbsp;배송준비중&nbsp;&nbsp;</option>
                                        <option value="">&nbsp;&nbsp;배송중&nbsp;&nbsp;</option>
                                        <option value="">&nbsp;&nbsp;결제완료&nbsp;&nbsp;</option>
                                        <option value="">&nbsp;&nbsp;배송완료&nbsp;&nbsp;</option>
                                    </select>
                                </td>
                                <td style="padding-left: 5px;">
                                    <button id="btn1">1주일</button>
                                </td>
                                <td>
                                    <button id="btn2">1개월</button>
                                </td>
                                <td>
                                    <button id="btn3">3개월</button>
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
                        
                </div>
                -->

                <br>
                
                <div class="myOrderList">
                    <table>
                        	<thead>
	                            <tr style="font-size:13px;">
	                                <td style="width:40%;">주문일자[주문번호]</td>
	                                <td style="width:10%;">입금여부</td>
	                                <td style="width:10%;">배송시작여부</td>
	                                <td style="width:40%;">주문일자</td>
	                            </tr>
                         	</thead>
                         	<tbody>
                         	
	                         	<!--주문내역이없을때-->
                                <% if(list.isEmpty()){%>
	                            <tr>
	                                <td colspan="6" style="height:150px; font-weight: 600;">
	                                    <br><br>
	                                    <img src="<%=contextPath%>/resources/images/error.png"> <br>
	                                    찾으시는 기간 내에 해당하는 내역이 없습니다.
	                                    <br><br><br>
	                                </td>
	                            </tr>
	                            <% } else{ %>
	                        	<!-- 주문내역이있을때 -->
	                        		<%for(MyOrder mo : list) {%>
		                            <tr style="font-size:13px;">
		                                <td style="width:40%;"><%= mo.getOrdNo() %></td>
	                                	<td style="width:10%;"><%=mo.getPayment() %></td>
	                                	<td style="width:10%;"><%=mo.getDeliveryStatus() %></td>
	                                	<td style="width:40%;"><%=mo.getOrderDate() %></td>
		                            </tr>
		                            <%} %>
                                <%}%>
                            </tbody>
                        </table>
                        
                        <script>
                        	$(function(){
                        		$(".myOrderList>tbody>tr").click(function(){
                        			location.href='<%=contextPath%>/myOrderDetail.me?no=' + $(this).children().eq(0).text();
                        		})
                        	})
                        </script>




                </div>

            </div>

        </div>

        <%@ include file="../common/userFooterbar.jsp" %>

    </div>
	

</body>
</html>