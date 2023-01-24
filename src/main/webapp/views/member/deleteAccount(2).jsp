<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin-top:50px;
        margin:auto;
        width:1000px;
        height:500px;
    }
    .delete{
        width:800px;
        margin:auto;
    }
    .deleteText{
        margin:auto;
        font-size: 13px;
        color:gray;
    }
    table{
        border-collapse: collapse;
        border-spacing: 0;
        border-top:1px solid gray;
    }
    td{
        margin:auto;
        border-bottom: 1px solid gray;
        border-left:1px solid gray;
        height:60px
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

	<%@ import file="../common/userMenubar.jsp" %>

    <div class="outer">

        <h2 align="center">회원탈퇴</h2>
        <br><br>

        <div class="delete"">

            <div class="deleteText">
                혜택 내역
            </div>
            <br>

            <div class="deletePassword">
                <form>
                    <table>
                        <tr>
                            <td style="width:200px; text-align:center; color:gray;">적립금</td>
                            <td style="width:800px; font-weight: 900; font-size: 12px; color:gray;">
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
                            <td style="width:200px; text-align:center; color:gray;">선택</td>
                            <td style="width:800px;">
                                &nbsp;&nbsp; 
                                <select name="deleteReason" id="deleteReason">
                                    <option value="no" selected>&nbsp;&nbsp;-선택안함-&nbsp;&nbsp;</option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                    <option value=""></option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <br>

            <div align="center">
            <button>확인</button>
            <button>취소</button>
            </div>


        </div>





    </div>

</body>
</html>