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
#profileTable label{
    color:rgba(34, 34, 34, 0.658);
    font-size:12px;
    font-weight: 900;
}
.btnWrap>button{
    width:80px; 
    height:30px;
}
.btn-red{
    width:80px; 
    height:30px; 
    float:right; 
}
input{
    border: 1px solid rgb(220, 220, 220);
}
input::placeholder{
    color:rgb(220, 220, 220);
    font-size:12px;
}

</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp"%>

    <%
        String userId = loginUser.getUser_Id();
        String userPassword = loginUser.getUser_Pwd();
        String userName = loginUser.getUser_Name();
        String email = loginUser.getEmail();
        String phone = loginUser.getPhone();
        int postCode = loginUser.getPost_Code();
        String address = loginUser.getAddress();
        String detailAdress = loginUser.getDetailed_Address();
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

            <h2 align="center" style="font-weight:600; color:rgb(50, 50, 50)">회원정보수정</h3>
                <br><br><br><br>

                <span style="float:left; font-size:13px; font-weight: 600; color:rgb(50, 50, 50)">&nbsp;기본정보 </span>
                <span style="float:right; font-weight: 900;">* 필수입력사항&nbsp;</span>
                <br><br>

            <form action="<%=contextPath%>/update.me" method="post" id="profileTable">
                    
                <table>
                    <tr>
                        <td>아이디 *</td>
                        <td colspan="3" style="width:500px;">
                            &nbsp;&nbsp;<input type="text" value="<%=userId%>" readonly> 
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 *</td>
                        <td colspan="3">
                            &nbsp;&nbsp;<button id="password" data-toggle="modal" data-target="#updatePwdModal">비밀번호 수정하기</button> 
                        </td>
                    </tr>
                    <tr>
                        <td>이름 *</td>
                        <td>
                            &nbsp;&nbsp;<input type="text" name="userName" value="<%=userName%>" maxlength="5" required>
                        </td>
                    </tr>
                    <tr>
                        <td>이메일 *</td>
                        <td colspan="2">
                            &nbsp;&nbsp;<input type="email" name="email" value="<%=email%>">
                        </td>
                    </tr>
                    <tr>
                        <td>휴대전화 *</td>
                        <td>
                            &nbsp;&nbsp;<input type="phone" name="selfPhone" value="<%=phone%>" placeholder="&nbsp;- 를 포함하여 입력해주세요." required>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" >주소 *</td>
                        <td colspan="3" style="border-bottom:none;">
                            &nbsp;&nbsp;<input type="text" name="postCode" value="<%=postCode%>"> &nbsp;<button style="border-radius:4px; border:1px solid gray;">우편번호</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom:none; border-left:1px solid rgb(220,220,220);">
                            &nbsp;&nbsp;<input type="text" name="address" value="<%=address%>" size="40"> &nbsp;<label>기본주소</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-left:1px solid rgb(220,220,220);">
                            &nbsp;&nbsp;<input type="text" name="detailAddress" value="<%=detailAddress%>" size="40"> &nbsp;<label>상세주소</label>
                        </td>
                    </tr>
                </table>
            </form>

            <br>

            <div class="btnWrap" align="center">
                <button type="submit">수정하기</button>
                <button type="button">취소</button>
                <button type="button" class="btn-red">회원탈퇴</button>
            </div>

        </div>

        <script>
            $(function(){
                $(".btn-red").click(function(){
                    location.href='<%=contextPath%>/delete_1.me';
                });
            })
        </script>

        
        <br>

        <%@ include file="../common/userFooterbar.jsp"%>

    </div>

    <!-- 비밀번호변경용 Modal -->
	<div class="modal" id="updatePwdModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">비밀번호 변경</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              
              <form action="<%= contextPath %>/updatePwd.me" method="post">
                  <input type="hidden" name="userId" value="<%= userId %>" >
                  <table>
                      <tr>
                          <td>현재 비밀번호</td>
                          <td><input type="password" name="userPwd" required></td>
                      </tr>
                      <tr>
                          <td>변경할 비밀번호</td>
                          <td><input type="password" name="updatePwd" required></td>
                      </tr>
                      <tr>
                          <td>변경할 비밀번호 확인</td>
                          <td><input type="password" required></td>
                      </tr>
                  </table>
                  <br>
                  
                  <button type="submit" class="btn btn-secondary btn-sm">비밀번호 변경</button>
                  
                  
                  
              </form>
              
            </div>
      
          </div>
        </div>
      </div>

</body>
</html>