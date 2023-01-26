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
    }
    .delete{
        width:100%;
        margin:auto;
    }
    .deleteText{
        margin:auto;
        font-size: 13px;
        color:rgbargb(50, 50, 50);
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
    }
    td:first-child{
        border-left:none;
    }
    button{
        border-radius:4px; 
        background:white; 
        width:80px; 
        height:30px; 
        border:1px solid gray;
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
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px; color:rgb(200, 140, 140);">회원정보</a> <br><br>
            <a href="" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px;">게시글조회</a> <br><br>
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
        
            <h2 align="center" style="color:rgb(50, 50, 50); font-weight:600;">회원탈퇴</h2>
            <br><br><br><br>

            <div class="delete"">

                <div class="deleteText">
                    혜택 내역
                </div>
                <br>

                <div class="deletePassword">
                    <form>
                        <table>
                            <tr>
                                <td style="width:200px; text-align:center;">적립금</td>
                                <td style="width:800px; font-weight: 900; font-size: 12px;">
                                    &nbsp;탈퇴하면 적립금이 삭제됩니다. <br><br>
                                    &nbsp;현재 보유하신 적립금은 (회원적립금들어갈자리) 원 입니다. 
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <br><br>

                <div class="deleteText">
                    회원 탈퇴 사유
                </div>
                <br>

                <div class="deletePassword">
                    <form>
                        <table>
                            <tr>
                                <td style="width:200px; text-align:center;">선택</td>
                                <td style="width:800px;">
                                    &nbsp;&nbsp; 
                                    <select name="deleteReason" id="deleteReason">
                                        <option value="no" selected>&nbsp;&nbsp;-선택안함-&nbsp;&nbsp;</option>
                                        <option value="">&nbsp;&nbsp;상품종류가 부족하다</option>
                                        <option value="">&nbsp;&nbsp;상품가격이 비싸다</option>
                                        <option value="">&nbsp;&nbsp;배송이 느리다</option>
                                        <option value="">&nbsp;&nbsp;삼담원 고객응대 서비스가 불만이다</option>
                                        <option value="">&nbsp;&nbsp;쇼핑몰 혜택이 부족하다(쿠폰, 적립금, 할인 등)</option>
                                        <option value="">&nbsp;&nbsp;이용빈도가 낮다</option>
                                        <option value="">&nbsp;&nbsp;기타</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <br>

                <div align="center">
                <button style="color:white; background:rgb(200, 140, 140); border:none;">탈퇴</button>
                <button onclick="location.href='<%=contextPath%>/myPage.me'">취소</button>
                </div>


            </div>


        </div>

        <%@ include file="../common/userFooterbar.jsp"%> 

    </div>

</body>
</html>