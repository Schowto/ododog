<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.odd.product.model.vo.UserProduct, java.util.ArrayList" %>

<%
UserProduct p = (UserProduct)request.getAttribute("p");
%>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>

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
            width: 1200px;
            height: 100px;
            background: gray;
            color:white;
           
        }
        #destination{
            
            width: 1200px;
            
        }
        .left{
        	width: 60%;
        	float:left;
			box-sizing: border-box;
			
        }
        .right {
			width: 40%;
			float:right;
			box-sizing: border-box;
			font-size: 15px;
			text-align: left;
		}
      

    </style>
</head>
<body>

    <%@ include file="../common/userMenubar.jsp"%>
   <div class="wrap">
    <form action="" id="destination">
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
        <b>주문상품</b> <br><br>
        <table>
                <div class="left">
                	<!--상품자리-->
                	
                	<img src="<%=contextPath%>/<%= p.getThumbImg()%>" width="200px" height="200px">
					 
                </div>
                <div class="right">
                	<%=p.getProName()%><br><br>
                	수량 : 3개<!-- 수량 불러오기 -->
                	<b></b><br><br>
                	
                	<b><%=p.getPrice()%>원</b> <!-- 조건문 써서 금액 불러오기 -->
                </div>
                <br><br><br><br><br><br><br><br><br>
                <hr style="border:1px color= silver;" width="100%">
        </div>
        
        <br>
        <div>        
            <b>적립금</b> <input type="number">원
        </div>
        <br>    
        
        <div>
            <hr style="border:1px color= silver;" width="100%">
            <b>결제정보</b><br>
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
        <div>
        	<button type="button" onclick="payment();">결제하기</button>
        </div>
		 </form>   
		<br><br>
    
    <script>
	    var IMP = window.IMP; // 생략 가능
	    IMP.init("imp87336721"); // 예: imp00000000
	       const make_merchant_uid = () => {
	            const current_time = new Date();
	            const year = current_time.getFullYear().toString();
	            const month = (current_time.getMonth()+1).toString();
	            const day = current_time.getDate().toString();
	            const hour = current_time.getHours().toString();
	            const minute = current_time.getMinutes().toString();
	            const second = current_time.getSeconds().toString();
	            const merchant_uid = 'MIHEE' + year + month + day + hour + minute + second;
	            return merchant_uid;
	        };
	        const merchant_uid = make_merchant_uid()
	    function payment() {
	        // IMP.request_pay(param, callback) 결제창 호출
	        IMP.request_pay({ // param
	            pg: "html5_inicis",
	            pay_method: "card",
	            merchant_uid: "ORD20180131-0000011",
	            name: "노르웨이 회전 의자",
	            amount: 64900,
	            buyer_email: "gildong@gmail.com",
	            buyer_name: "홍길동",
	            buyer_tel: "010-4242-4242",
	            buyer_addr: "서울특별시 강남구 신사동",
	            buyer_postcode: "01181"
	        }, function (rsp) { // callback
	            if (rsp.success) {
	                ...,
	                // 결제 성공 시 로직,
	                ...
	            } else {
	                ...,
	                // 결제 실패 시 로직,
	                ...
	            }
	        });
	      }
    </script>
</div> 

	

</body>
</html>