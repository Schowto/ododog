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
        margin-top:180px;
        margin-bottom: 200px;
        width:75%;
        height:100%;
        display: inline-block;
        margin-left: 40px;
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
        height:60px;
        color:rgb(50, 50, 50);
        font-size:14px;
    }
    td:first-child{
        border-left:none;
    }
    option{
        font-size: 13px;
    }
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

    <%
        String userId = loginUser.getUser_Id();
        String userPwd = loginUser.getUser_Pwd();
        int point = loginUser.getPoint();
    %>

    <div class="outer">

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px;">주문조회</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px; color:rgb(200, 140, 140);">회원정보</a> <br><br>
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
        
            <h2 align="center" style="color:rgb(50, 50, 50); font-weight:600;">회원탈퇴</h2>
            <br><br><br><br>

            <div class="deleteText">
                 혜택 내역
            </div>
            <br>

            <form action="<%=contextPath%>/delete.me" method="post">
            	<input type="hidden" name="userId" value="<%=userId%>">
            	<input type="hidden" name="userPwd" value="<%=userPwd%>">
            	<table>
                	<tr>
                    	<td style="width:200px; text-align:center; font-size: 13px;">적립금</td>
                        <td style="width:800px; font-weight: 900; font-size: 12px;">
                        	<div style="margin-bottom:10px;">&nbsp;&nbsp;탈퇴하면 적립금이 삭제됩니다.</div>
                            <div>&nbsp;&nbsp;현재 보유하신 적립금은 <%=point%> 원 입니다.</div>
                        </td>
                    </tr>
                </table>
                        
             	<br><br>

                <div class="deleteText">
                   	회원 탈퇴 사유
                </div>
                		
                <br>

                <table>
                    <tr>
                        <td style="width:200px; text-align:center; font-size: 13px;">선택</td>
                        <td style="width:800px;">
                        	&nbsp;&nbsp; 
                            <select name="deleteReason" id="deleteReason" style="height:25px; font-size:13px;">
                                        		<option value="no" selected>&nbsp;&nbsp;-선택안함-&nbsp;&nbsp;</option>
		                                        <option value="sort">&nbsp;&nbsp;상품종류가 부족하다</option>
		                                        <option value="price">&nbsp;&nbsp;상품가격이 비싸다</option>
		                                        <option value="delevery">&nbsp;&nbsp;배송이 느리다</option>
		                                        <option value="sevice">&nbsp;&nbsp;삼담원 고객응대 서비스가 불만이다</option>
		                                        <option value="point">&nbsp;&nbsp;쇼핑몰 혜택이 부족하다(쿠폰, 적립금, 할인 등)</option>
		                                        <option value="use">&nbsp;&nbsp;이용빈도가 낮다</option>
		                                        <option value="else">&nbsp;&nbsp;기타</option>
		                    </select>
		                 </td>
		            </tr>
		        </table>
		        <br>
		                
		        <div align="center">
		             <button class="btn-red" type="submit">탈퇴</button>
		             <button type="button" id="btn">취소</button>
		        </div>
          	</form>
          	
          	<script>
                	$(function(){
                		$("#btn").click(function(){
                			location.href="<%=contextPath%>/myPage.me";
                		})
                	})
            </script>
          	
        </div>
  				
        <%@ include file="../common/userFooterbar.jsp"%> 

    </div>

</body>
</html>