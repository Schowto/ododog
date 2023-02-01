<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<style>
        
    /* 회원가입양식 */
    *{
padding: 0;
margin: 0;
border: none;
}
.insertform{
margin: auto;
width: 400px;
height: 350px;
padding: 40px;
box-sizing: border-box;
}
#joinform > input{  
width: 100%;
height: 48px;
padding: 0 10px;
box-sizing: border-box;
margin-top: 5px;
margin-bottom: 20px;
border-radius: 6px;
background-color: #ececec;
}
#submit{
  color: #fff;
font-size: 16px;
background-color: rgb(100, 100, 100);
margin-top: 20px;
width: 100%;
height: 48px;
margin-bottom: 16px;
border-radius: 6px;
border:none;
}


    /* 동의서양식 */
    *{
    padding: 0;
    margin: 0;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
}

    .check_Box{
    background:  #ececec;
    width: 250px;
    height: 250px;;
    display: inline-block;
    margin: 14px;
}
.check_Box>label{ 
    position: relative;
    top: 10px;
    font-size: 13px;
}
.check_Box>textarea{
    width: 215px;
    height: 180px;
    margin-top: 20px;
    resize: none;
    font-size: small;
}
#join_btn{
    color: #fff;
    font-size: 16px;
    background-color: rgb(100, 100, 100);
    margin-top: 20px;
    width: 350px;
    height: 48px;
    margin-bottom: 16px;
    border-radius: 6px;
    border:none;
}

button {
    width: 80px;
    height: 28px;
    padding: 0 10px;
    box-sizing: border-box;
    float: right;
    margin-top: -5px;
    margin-bottom: 20px;
    border-radius: 6px;
        }
</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>

            <!-- 회원가입 양식-->
            <div class="insertform" id="">
                <form action="<%=contextPath %>/insert.me" id="joinform" method="post">
                    <h1 style="text-align: center;">회원가입</h1>
                    <br><br>
                  <label>아이디*</label> 
                  <input type="text" id="user_id" name="user_Id" placeholder="아이디를 입력해주세요." required>
                  <button type="button" onclick="idcheck();">중복확인</button> 
                  <br><br><br>
                  
              
                  <label>비밀번호*</label>
                  <input type="password" id="user_pwd" name="user_Pwd" placeholder="비밀번호를 입력해주세요." required>
                  <br>
        
                  <label>비밀번호확인*</label>
                  <input type="password" id="user_pwd" name="user_Pwd" placeholder="비밀번호 확인" required>
                  <br>
        
                  <label>이름*</label>
                  <input type="text" id="user_name" name="user_Name" placeholder="이름을 입력해주세요." maxlength="5" required>
                  <br>
        
                  <label>이메일*</label>
                  <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요." required>
                  <br>
        
                  <label>휴대폰번호*</label>
                  <input type="tel" id="tel" name="phone" placeholder="- 포함해서 입력해주세요." required>
                  <br>
        
                  <label>주소*</label>
                  <input type="text" id="post_code" name="post_Code" placeholder="우편번호 입력" required>
                  <input type="text" id="address" name="address" placeholder="기본주소 입력" style="margin-top:-10px;" required>
                  <input type="text" id="detailed_address" name="detailed_Address" placeholder="상세주소 입력" style="margin-top:-10px;" required>
                  <br>
                
              </div>
              <br><br>
              <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
              
         
              <!--동의양식-->
              <h2 align="center"><b>전체동의</b></h2> <br>
              <p align="center"><input type="checkbox" name="agree_all"> 이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</p>
              <br> <hr style="border: 0.5px solid rgb(206, 206, 206); width: 900px; margin: auto;">
                <form action="" id="joinForm">
                    <div class="join_box" style=" text-align: center;"> 
                        <div class="check_Box" align="center">
                            <label>[필수] 이용약관 동의<input type="checkbox" name="agree" required></label>
                            <textarea name="" id="">제1조(목적)
                                
                이 약관은 도그푸드회사(전자상거래 사업자)가 운영하는 도그쿡 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.제2조(정의)
                ①“몰” 이란 도그푸드 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.  </textarea>
                        </div>
                        <div class="check_Box" align="center">
                            <label>[필수] 개인정보 수집 및 이용 동의<input type="checkbox" name="agree" required></label>
                            <textarea name="" id="">■수집하는 개인정보 항목
        
                회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
                ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 ,  , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
                ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식 </textarea>
                        </div>
                        <div class="check_Box" align="center">
                            <label>[선택] 쇼핑정보 수신 동의<input type="checkbox" name="agree"></label>
                            <textarea name="" id="">할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.
        
                단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</textarea>
                        </div> 
                        <br>
        
                        <input type="submit" value="회원가입" name="submit" id="join_btn" style=" display: inline-block;">
                    </div>
                </form>
                </form>
                    
                <script>
                const agreeChkAll = document.querySelector('input[name=agree_all]');
                agreeChkAll.addEventListener('change', (e) => {
                let agreeChk = document.querySelectorAll('input[name=agree]');
                for(let i = 0; i < agreeChk.length; i++){
                  agreeChk[i].checked = e.target.checked;
                	}
           		 });
                </script>
                
                <script>
                function idcheck(){
                const $idInput = $("#joinform input[name=user_Id]");
                
                $.ajax({
                	url:"<%=contextPath%>/idcheck.me",
                	data:{checkId:$idInput.val()},
                	success:function(result){
                		if(result == "nnnnn"){
                			alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                			$idInput.focus();
                		}else {
                			if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                				$idInput.attr("readonly", true);
                			}else {
                				$idInput.focus();
                			}
                		}
                	},
                	error:function(){
    				console.log("아이디 중복체크용 ajax 통신실패");
    			}
                });
                	
            }
               
                </script>
                 
               
</body>
</html>