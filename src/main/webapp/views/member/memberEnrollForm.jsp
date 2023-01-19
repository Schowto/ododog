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
    
}
#profileTable{
    width:100%;
    
}
#profileTable label{
    color:rgba(34, 34, 34, 0.658);
    font-size:12px;
    font-weight: 900;
}

</style>
</head>
<body>

	<%@ import file="../common/userMenubar.jsp"%>

    <div class="outer">
        
        <h2 align="center">회원정보수정</h3>
    
        <div class="basic">기본정보 </div>
        <div class="basic">* 필수입력사항</div>
        <br>

        <form action="" id="profileTable">
            <table border="1">
                <tr>
                    <td>아이디 *</td>
                    <td colspan="3" style="width:500px;">회원아이디자리</td>
                </tr>
                <tr>
                    <td>비밀번호 *</td>
                    <td colspan="3"><button>비밀번호 수정하기</button> </td>
                </tr>
                <tr>
                    <td>이름 *</td>
                    <td><input type="text" name="userName" required></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>일반전화</td>
                    <td><input type="phone" name="phone" placeholder="- 를 포함하여 입력해주세요."></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>휴대전화 *</td>
                    <td><input type="phone" name="selfPhone" placeholder="- 를 포함하여 입력해주세요." required></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>이메일 *</td>
                    <td colspan="2"><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td rowspan="3">주소</td>
                    <td colspan="3"><input type="text" name="address1"> <button>우편번호</button></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" name="address2" size="40"> <label>기본주소</label></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="text" name="address3" size="40"> <label>상세주소</label></td>
                </tr>
                <tr>
                    <td>email 수신여부 *</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </form>

        <br>
        <button>수정하기</button>
        <button>취소</button>
        <button>회원탈퇴</button>


    </div>


</body>
</html>