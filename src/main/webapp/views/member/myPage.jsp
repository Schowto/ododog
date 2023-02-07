<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
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
        String userPwd = loginUser.getUser_Pwd();
        String userName = loginUser.getUser_Name();
        String email = loginUser.getEmail();
        String phone = loginUser.getPhone();
        int postCode = loginUser.getPost_Code();
        String address = loginUser.getAddress();
        String detailedAdress = loginUser.getDetailed_Address();
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
            <a href="<%=contextPath%>/list.co" style="font-size:17px;">1:1맞춤상담</a>
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
                            &nbsp;&nbsp;<input type="text" name="userId" value="<%=userId%>" readonly> 
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 *</td>
                        <td colspan="3">
                            &nbsp;&nbsp;<button type="button" id="password" data-toggle="modal" data-target="#updatePwdModal">비밀번호 수정하기</button> 
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
                            &nbsp;&nbsp;<input type="phone" name="phone" value="<%=phone%>" placeholder="&nbsp;- 를 포함하여 입력해주세요." required>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" >주소 *</td>
                        <td colspan="3" style="border-bottom:none;">
                            &nbsp;&nbsp;<input type="text" name="postCode" id="postCode" value="<%=postCode%>"> 
                            &nbsp;<input type="button" style="border-radius:4px; border:1px solid gray; background: white;" onclick="sample6_execDaumPostcode()" value="우편번호" required></input>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-bottom:none; border-left:1px solid rgb(220,220,220);">
                            &nbsp;&nbsp;<input type="text" name="address" id="address" value="<%=address%>" size="60" required> &nbsp;<label>기본주소</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="border-left:1px solid rgb(220,220,220);">
                            &nbsp;&nbsp;<input type="text" name="detailedAddress" id="detailedAddress" value="<%=detailedAdress%>" size="60" required> &nbsp;<label>상세주소</label>
                        </td>
                    </tr>
                </table>
                
                <br>
                
                <div class="btnWrap" align="center">
                	<button type="submit">수정하기</button>
                	<button type="button">취소</button>
                	<button type="button" class="btn-red">회원탈퇴</button>
            	</div>
            </form>


        </div>

        <script>
            $(function(){
            	$(".btn-red").click(function(){
            		location.href="<%=contextPath%>/deleteView.me";
            	})
            })
        </script>

        
        <br>

        <%@ include file="../common/userFooterbar.jsp"%>

    </div>
      
      <!-- 모달 -->
        <div class="modal" id="updatePwdModal" style="color:rgb(50, 50, 50);">
            <div class="modal-dialog">
                <div class="modal-content" style="padding:30px 20px;">
        
                    <!-- Modal Header -->
                    <div class="modal-header" style="justify-content: left;">
                        <h5 class="modal-title" style="font-weight:600;">비밀번호 변경</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <br>
                    <!-- Modal body -->
                    <div class="modal-body" style="color:gray; font-size:13px;">
                        <form action="<%= contextPath %>/updatePwd.me" method="post">
                            <input type="hidden" name="userId" value="<%= userId %>" >
                            <table>
                                <tr>
                                    <td>현재 비밀번호</td>
                                    <td><input type="password" name="userPwd"required></td>
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

        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수
        
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("detailedAddress").value = extraAddr;
                        
                        } else {
                            document.getElementById("detailedAddress").value = '';
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('postCode').value = data.zonecode;
                        document.getElementById("address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        //document.getElementById("detailedAddress").focus();
                    }
                }).open();
            }
        </script>


</body>
</html>