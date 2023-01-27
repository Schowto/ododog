<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .wrap{
            width: 1200px;
            margin:auto;
            text-align: center;
        }
        .header{
        margin-top:80px;
            box-sizing: border-box;
           border: 1px solid black; 
            width: 1200px;
            height: 100px;
            background: gray;
            color:white;
           
        }
        #destination{
            border: 1px solid silver;
            width: 1200px;
            
        }
        .left{
        	width: 50%;
        	float: left;
			box-sizing: border-box;
        }
        .right {
			width: 50%;
			float: right;
			box-sizing: border-box;
			font-size: 15px;
		}
      

    </style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp"%>
   <div class="wrap">
    <form action="<%= contextPath %>/" id="destination" ac>
        <div class="header">
        <br>
            <h4 align="center">주문/결제</h4>
        </div>
        <br><br>
        <table align="center">
            <tr> 
                <td>받는사람 *</td>
                <td><input type="text" name="name" size=40; placeholder="이름을 입력해주세요" required ></td>
            </tr>
            <tr>
                <td>휴대전화 * </td>
                <td><input type="text" name="phone" size=40; placeholder="휴대전화를 입력해주세요" required></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="email" size=40; placeholder="이메일을 입력해주세요" required></td>
               
            </tr>
            <tr>
                <td>주소 * </td>
                <td><input type="text" name="address1" size=40; placeholder="우편주소" required></td>
                <td><button>우편번호 찾기</button></td> 
            </tr>

            <!--<tr>
    
                    
                  <td> <input type="text" name="address2" placeholder="도로명주소" required></td>
            </tr>-->
            <tr>
                <td>배송시 요청사항&nbsp;</td>
                <td><input type="text" name="request" size=40; placeholder="요청 사항을 입력해주세요"></td>
                
            </tr>
        </table>
        <br>
        <hr style="border:1px color= silver;" width="100%">
        <div>
        <b>주문상품</b> <br>
                <div class="left">
                	<!--상품자리-->
                	<img src="<%=contextPath%>/resources/product_img/오븐14.png" width="200px" height="200px">
                	
                </div>
                <div class="right">
                	<b>건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레)</b>
                	수량 : 3개
                	<br>
                	<b>58,000원</b>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br>
                <hr style="border:1px color= silver;" width="100%">
        </div> <br>
        <div>        
            <b>적립금</b> <input type="number">원
        </div>
        <br>    
        
        <div>
            <hr style="border:1px color= silver;" width="100%">
            <b>결제정보</b>
            <!--주문 상품가격, 배송비 자리 -->
            <div>
            	<!-- 주문 상품가격 -->
            </div>
            <div>
            	<!--  배송비 자리 -->
            </div>
            <br><br>
            주문상품
            <br><br>
            <br><br><br>
        </div>
        <br>
        <hr style="border:1px color= silver;" width="100%"> <br>
        <div>
            <b>최종 결제 금액</b> 
            <!-- 최종 총 결제할 금액 자리-->
            <br><br><br>
        </div> 
        <hr style="border:1px color= silver;" width="100%"> <br>
        <div>
            <b>결제수단</b> <br><br>
            <input type="radio"> 무통장 입금 <br><br>
            <input type="radio"> 신용카드 <br><br>
            <input type="radio"> 카카오페이 <br><br> 
        </div>   
         




    </form>
</div> 
    

</body>
</html>