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
#content{
    /*border:1px solid red;*/
    color:rgb(50, 50, 50);
    width:75%;
    height:100%;
    margin:auto;
    margin-top:180px;
    margin-bottom:200px;
    display: inline-block;
    margin-left:40px;
}
table{
    border-top:1px solid rgb(220,220,220);
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
    border-top:1px solid rgb(220,220,220);
}
td{
    border-bottom:1px solid rgb(220,220,220);
    border-left:1px solid rgb(220,220,220);
    height:50px;

}
td:first-child{
    border-left:none;
}
#address{
    border-left:1px solid rgb(220,220,220);
    border-bottom:none;
}
#profileTable label{
    color:rgba(34, 34, 34, 0.658);
    font-size:12px;
    font-weight: 900;
}
.btn1{
    text-align:center;
    float:left;
    margin-left:400px;
}
.btn2{
    background:rgb(200, 140, 140); 
    width:80px; 
    height:30px; 
    border:none; 
    color:white; 
    font-weight: 900; 
    float:right; 
}
input{
    border: 1px solid rgb(220, 220, 220);
}
button{
    border-radius: 4px;
}
input::placeholder{
    color:rgb(220, 220, 220);
    font-size:12px;
}

</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp"%>

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
            <a href="<%=contextPath%>/consult.bo" style="font-size:17px;">1:1맞춤상담</a>
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
                    <br><br><br><br>

                    <span style="float:left; font-size:13px; font-weight: 600; color:rgb(50, 50, 50)">&nbsp;기본정보 </span>
                    <span style="float:right; font-weight: 900;">* 필수입력사항&nbsp;</span>
                    <br><br>
                    
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
                        <td>&nbsp;<input type="phone" name="phone" placeholder="&nbsp;- 를 포함하여 입력해주세요."></td>
                    </tr>
                    <tr>
                        <td>휴대전화 *</td>
                        <td>&nbsp;<input type="phone" name="selfPhone" placeholder="&nbsp;- 를 포함하여 입력해주세요." required></td>
                    </tr>
                    <tr>
                        <td>이메일 *</td>
                        <td colspan="2">&nbsp;<input type="email" name="email"></td>
                    </tr>
                    <tr>
                        <td rowspan="3" >주소 *</td>
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
                            &nbsp;<input type="radio" id="check" name="yes" value="Y">&nbsp;예
                            &nbsp;<input type="radio" id="check" name="no" vlaue="N">&nbsp;아니오
                        </td>
                    </tr>
                </table>
            </form>

            <br>

            <span class="btn1">
                <button style="background:white; width:80px; height:30px; border:1px solid gray;">수정하기</button>
                <button style="background:white; width:80px; height:30px; border:1px solid gray;">취소</button>
            </span>
            <span>
                <button class="btn2">회원탈퇴</button>
            </span>

        </div>

        <script>
            $(function(){
                $(".btn2").click(function(){
                    location.href='<%=contextPath%>/delete_1.me';
                });
            })
        </script>

        
        <br>

        <%@ include file="../common/userFooterbar.jsp"%>

    </div>

</body>
</html>