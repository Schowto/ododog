<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
    color:rgba(27, 25, 25, 0.712);
    width:1000px;
    margin:auto;
    margin-top:50px;
    
}
.profile{
    width:800px;
    margin:auto;
}
table{
    border-top:1px solid gray;
    width:100%;
}
span{
    font-size:13px;
}
#password{
    color:white;
    background: rgb(200, 140, 140);
    border:none;
    width:130px;
    height:30px;
    border-radius: 4px;
    font-weight: 900;

}
table{
    border-collapse: collapse;
    border-spacing: 0;
    border-top:1px solid gray;
}
td{
    border-bottom:1px solid gray;
    border-left:1px solid gray;
    height:40px;

}
td:first-child{
    border-left:none;
}
#address{
    border-left:1px solid gray;
    border-bottom:none;
}
#profileTable label{
    color:rgba(34, 34, 34, 0.658);
    font-size:12px;
    font-weight: 900;
}
.btn{
    text-align:center;
}

</style>
</head>
<body>

	<%@ import file="../common/userMenubar.jsp"%>

    <div class="outer">
        
        <h2 align="center">회원정보수정</h3>

        <div class="profile">
    
            <span style="float:left; font-weight: 900;">&nbsp;기본정보 </span>
            <span style="float:right; font-weight: 900;">* 필수입력사항&nbsp;</span>
            <br>

            <form action="" id="profileTable">
                <table>
                    <tr>
                        <td>아이디 *</td>
                        <td colspan="3" style="width:500px;" readonly>&nbsp;회원아이디자리</td>
                    </tr>
                    <tr>
                        <td>비밀번호 *</td>
                        <td colspan="3">&nbsp;<button id="password">비밀번호 수정하기</button> </td>
                    </tr>
                    <tr>
                        <td>이름 *</td>
                        <td>&nbsp;<input type="text" name="userName" required></td>
                    </tr>
                    <tr>
                        <td>일반전화</td>
                        <td>&nbsp;<input type="phone" name="phone" placeholder="- 를 포함하여 입력해주세요."></td>
                    </tr>
                    <tr>
                        <td>휴대전화 *</td>
                        <td>&nbsp;<input type="phone" name="selfPhone" placeholder="- 를 포함하여 입력해주세요." required></td>
                    </tr>
                    <tr>
                        <td>이메일 *</td>
                        <td colspan="2">&nbsp;<input type="email" name="email"></td>
                    </tr>
                    <tr>
                        <td rowspan="3" >주소</td>
                        <td colspan="3" id="address">&nbsp;<input type="text" name="address1"> <button style="border-radius:4px; border:1px solid gray;">우편번호</button></td>
                    </tr>
                    <tr>
                        <td colspan="3" id="address">&nbsp;<input type="text" name="address2" size="40"> <label>기본주소</label></td>
                    </tr>
                    <tr>
                        <td colspan="3" id="address">&nbsp;<input type="text" name="address3" size="40"> <label>상세주소</label></td>
                    </tr>
                    <tr>
                        <td>email 수신여부 *</td>
                        <td style="border-top:1px solid gray;">
                            <input type="radio" id="check" name="yes" value="Y">예
                            <input type="radio" id="check" name="no" vlaue="N">아니오
                        </td>
                    </tr>
                </table>
            </form>

            <br>
            <div class="btn">
            <button style="border-radius:4px; background:white; width:80px; height:30px; border:1px solid gray;">수정하기</button>
            <button style="border-radius:4px; background:white; width:80px; height:30px; border:1px solid gray;">취소</button>
            <button style="border-radius:4px; background:rgb(200, 140, 140); width:80px; height:30px; border:none; color:white; font-weight: 900; float:right;">회원탈퇴</button>
            </div>

        </div>

    </div>

</body>
</html>