<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
    border:1px solid black;
    margin:auto;
    width:1200px;
}

/****** 사이드 ******/
#side{
    border:1px solid blue;
    width:240px; height:100%;
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
    border:1px solid red;
    color:rgb(50, 50, 50);
    width:960px;
    height:100%;
    margin-top:150px;
    margin-bottom:200px;
    float:left;
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

/****** footer ******/
#footer{
    clear:both;
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

	<%@ import file="../common/userMenubar.jsp"%>

    <div class="outer">

        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="" style="font-size:17px;">주문조회</a> <br><br>
            <a href="" style="font-size:17px; color:rgb(200, 140, 140);">회원정보</a> <br><br>
            <a href="" style="font-size:17px;">장바구니</a> <br><br>
            <a href="" style="font-size:17px;">적립금</a> <br><br>
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

            <form id="profileTable">
                <h2 align="center" style="font-weight:600; color:rgb(50, 50, 50)">회원정보수정</h3>

                    <span style="float:left; font-weight: 900;">&nbsp;기본정보 </span>
                    <span style="float:right; font-weight: 900;">* 필수입력사항&nbsp;</span>
                    <br>
                    
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