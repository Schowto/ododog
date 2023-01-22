<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .pointView{
        width:800px;
        height:150px;
        background-color: rgba(128, 128, 128, 0.247);
        text-align: center;
        line-height:150px;
        font-size: 21px;
        font-weight: 900;
        color:rgba(17, 17, 17, 0.777);
    }
    table{
        border-top:3px solid rgba(128, 128, 128, 0.247);
        width:800px;;
        border-collapse: collapse;
        border-spacing: 0;
    }
    td{
        border-bottom:3px solid rgba(128, 128, 128, 0.247);
        height:50px;
        text-align:center;
        color:rgba(11, 11, 11, 0.649);
        font-weight: 400;
    }
    th{
        border-bottom:3px solid rgba(128, 128, 128, 0.247);
        height:50px;
        color:rgba(29, 27, 27, 0.707);
        font-weight: 900;
    }
</style>
</head>
<body>

	<%@ import file="../common/userMenubar" %>

    <div class="outer">

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

</body>
</html>