<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin:auto;
        width:1200px;
        height:100%;
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
        color:rgb(50, 50, 50);
        display: inline-block;
        width:75%;
        height:100%;
        margin:auto;
        margin-top:190px;
        margin-bottom:200px;
    }
    .pointView{
        width:800px;
        height:150px;
        background-color: rgb(220, 220, 220);
        text-align: center;
        line-height:150px;
        font-size: 21px;
        font-weight: 900;
        color:rgb(50, 50, 50);
        margin:auto;
    }
    table{
        border-top:3px solid rgb(220, 220, 220);
        width:800px;
        border-collapse: collapse;
        border-spacing: 0;
        margin:auto;
    }
    td{
        border-bottom:3px solid rgb(220, 220, 220);
        height:50px;
        text-align:center;
        color:rgba(11, 11, 11, 0.649);
        font-weight: 400;
    }
    th{
        border-bottom:3px solid rgb(220, 220, 220);
        height:50px;
        color:rgba(29, 27, 27, 0.707);
        font-weight: 900;
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
            <a href="" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px; color:rgb(200, 140, 140);">적립금</a> <br><br>
            <a href="" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="" style="font-size:17px;">1:1맞춤상담</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

        <div id="content">
        
            <h2 align="center" style="color:rgb(50, 50, 50); font-weight:600;">적립금</h2>
            <br><br><br><br>

            <div class="pointView">
                  (회원아이디자리) 님의 총 적립금 내역은 (적립금총금액자리) 원 입니다.
            </div>
            <br><br>

            <div class="pointHistory">
                    
                <form>
                    <table>
                         <tr>
                            <td style="width:200px;">날짜</td>
                               <td style="width:400px;"">내용</th>
                               <td style="width:200px;">금액</td>
                         </tr>

                          <tr>
                             <td>적립된날짜들어올자리</td>
                               <td style="text-align:center;">적립내역줄줄줄줄</td>
                            <th>적립금액들어올자리</th>
                         </tr>
                            
                         <tr>
                            <td>적립된날짜들어올자리</td>
                              <td style="text-align:center;">적립내역줄줄줄줄</td>
                               <th>적립금액들어올자리</th>
                         </tr>
                            
                        <tr>
                             <td>적립된날짜들어올자리</td>
                             <td style="text-align:center;">적립내역줄줄줄줄</td>
                             <th>적립금액들어올자리</th>
                        </tr>
                    </table>
                 </form>

             </div>

        </div>

        <%@ include file="../common/userFooterbar.jsp"%>

    </div>

</body>
</html>