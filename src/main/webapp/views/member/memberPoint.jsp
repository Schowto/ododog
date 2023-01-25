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
        display:flex;
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
    #content{
        color:rgb(50, 50, 50);
        float:left;
        width:80%;
        height:100%;
        margin:auto;
        margin-top:150px;
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

    /****** footer ******/
    #footer{
        clear:both;
        width:1200px;
        margin:auto;
        display:flex;
    }
    #footer>div{float:left; height:100%; padding:20px;}
    #footer-1{width:60%;}
    #footer-2{width:40%;}
    #footer-2 a{
         line-height:35px;
         color:rgb(50, 50, 50);
        text-decoration:none;
         font-size: 13px;
        font-weight: 700;
    }
</style>
</head>
<body>

	<%@ import file="../common/userMenubar" %>

    <div class="outer"> 

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="" style="font-size:17px;">주문조회</a> <br><br>
            <a href="" style="font-size:17px;">회원정보</a> <br><br>
            <a href="" style="font-size:17px;">장바구니</a> <br><br>
            <a href="" style="font-size:17px; color:rgb(200, 140, 140);">적립금</a> <br><br>
            <a href="" style="font-size:17px;">게시글조회</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

        <div id="content">
        
            <h2 align="center">적립금</h2>
            <br><br>

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

        <div id="footer" style="height:200px; background:rgb(220, 220, 220);">
    
            <div id="footer-1">
                <p style="font-size:12px;">
                    COMPANY : (주)오도독 CEO : 강보람 PHONE : 031-1234-5678 / FAX : 02-1234-9999 <br>
                    BUSINESS LICENCE : [828-88-01900] E-COMMERCE PERMINT 2020-성남중원-0191 <br>
                    ADDRESS : 13201 경기도 성남시 중원구 갈마치로288번길 14 (상대원동) SK V1타워101호
                </p>
                <br><br>
                <p style="font-size:12px; font-weight:700;">Copyright(C) 2023 (주)오도독 ALL RIGHTS REVERVED</p>
            </div>
            <div id="footer-2">
                <a href="">회사소개</a> <br>
                <a href="">개인정보처리방침</a> <br>
                <a href="">이용약관</a> <br>
                <a href="">이용안내</a> <br>
            </div>
    
        </div>



    </div>

</body>
</html>