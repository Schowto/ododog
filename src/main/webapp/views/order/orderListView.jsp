<%@page import="java.text.DecimalFormat"%>
<%@page import="com.odd.product.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.odd.product.model.vo.UserProduct, java.util.ArrayList" %>

<%
    UserProduct p = (UserProduct)request.getAttribute("p");
    ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
    int[] quantity = (int[])request.getAttribute("quantity");
    DecimalFormat df = new DecimalFormat("#,###"); //금액 포맷
    int point = request.getAttribute("point") != null ? (int) request.getAttribute("point") : 0;
%>    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
   <!-- <form action="contextPath/order.pro" method="post" id="destination">  --> 
        <div class="header">
        <br>
            <h4 align="center">주문/결제</h4>
        </div>
        <br><br>
        <table align="center">
            <tr> 
                <td>받는사람 *</td>
                <td><input id="sendman" type="text" name="name" size=40; placeholder="이름을 입력해주세요" required ></td>
            </tr>
            <tr>
                <td>휴대전화 * </td>
                <td><input id="phone" type="text" name="phone" size=40; placeholder="휴대전화를 입력해주세요" required ></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input id="email" type="email" name="email" size=40; placeholder="이메일을 입력해주세요" required></td>
               
            </tr>
            <tr>
                <td>주소 * </td>
                <td><input id='address' type="text" name="address1" size=40; placeholder="우편주소" required></td>
                <td><button type="button">우편번호 찾기</button></td> 
            </tr>

            <!--<tr>
    
                    
                  <td> <input type="text" name="address2" placeholder="도로명주소" required></td>
            </tr>-->
            <tr>
                <td>배송시 요청사항&nbsp;</td>
                <td><input id="require" type="text" name="request" size=40; placeholder="요청 사항을 입력해주세요"></td>
                
            </tr>
        </table>
        <br>
        <hr style="border:1px color= silver;" width="100%">
        <div>
	        <b>주문상품</b> <br><br>
     		<%
     		int sum = 0;
     		for(int i = 0; i < list.size(); i++){
     			sum += (list.get(i).getPrice() * quantity[i]);
     		%>
                <div class="left">
                	<!--상품자리-->
                	
                	<img src="<%=contextPath%>/<%= list.get(i).getThumbImg()%>" width="200px" height="200px">
					 
                </div>
                <div class="right">
                	<%=list.get(i).getProName()%><br><br>
                	수량 : <%= quantity[i] %>개<!-- 수량 불러오기 -->
                	<b></b><br><br>
                	
                	<b class="calPrice"><%=df.format(list.get(i).getPrice() * quantity[i])%>원</b> <!-- 조건문 써서 금액 불러오기 -->
                </div>
                <br><br><br><br><br><br><br><br><br>
                <hr style="border:1px color= silver;" width="100%">
       		 <%} %>
        </div>
        
        <br>
        <div>       
            <b>적립금</b> <input type="number" name="point" id="pointBox" value="<%=df.format(point)%>" >원
        </div>
        <br>    
        
          <div class=payment>
            <b>적용금액</b>
            <span id="calPoint">
               -3,000원  <!-- 금액자리 -->
            </span><br>
            <span>
               보유잔액<%=df.format(point)%>원<!-- 사용자적립금 -->
            </span> 
            <hr style="border:1px color= silver;" width="100%"> 
            <b>결제정보</b> <br>
             <span>
                주문상품
             </span> 
             <span id="orderPrice">
                15,000원
             </span><!--상품들 금액  --> <br>
             <span>
                배송비
             </span>
             <span>
                +4,000원
                </span> <!-- 배송비 고정값 -->
             <span>
                
                </span> <!-- 적립금 사용시 금액 -->
          
          <hr style="border:1px color= silver;" width="100%"> 
          <b>최종 결제 금액</b> <br>
          <span id="finalPrice">
            16,000원<!-- 최종 총 결제할 금액 자리-->
          </span>
          <input type="hidden" name="finalPrice" id="hidFinalPrice">
            <br>
        </div> 
        
        <hr style="border:1px color= silver;" width="100%"> <br>
        <div>
            <b>결제수단</b> <br><br>
            <input type="radio" name="payway"> 신용 결제 <br><br> 
        </div>   
        <div>
        	<!-- <button type="button" class="btn btn-dark" onclick="payment();">결제하기</button> -->
        	<button type="button" class="btn btn-dark" id="payment">결제하기</button>
        </div>
		 <!-- </form>  -->
		<br><br>


    
    
    <script>
    
    
  		let payPortNum = Math.floor(Math.random()*10000) + Math.floor(Math.random()*10000);
    
    
	    var IMP = window.IMP; // 생략 가능
	    IMP.init("imp87336721"); // 예: imp00000000

	    $('#payment').click(function(){
	    	//console.log(<%= loginUser.getUser_No() %>)
	    	console.log($('#address').val())
	    	console.log($('#phone').val())
	    	console.log($('#email').val())
	    	console.log($('#require').val())
	    	let order = {
	    		userNo: <%= loginUser.getUser_No() %>,
	    		delAdd: $('#address').val(),
	    		phone: $('#phone').val(),
	    		email: $('#email').val(),
	    		require: $('#require').val()
	    	};
	    	$.ajax({
	    		url:"<%= contextPath %>/insert.or",
	    		method:"post",
	    		data: JSON.stringify(order),
	    		dataType: "json",
	    		contentType:"application/json; charset=UTF-8"
	    	});
	    	
	   	
	    	
	        // IMP.request_pay(param, callback) 결제창 호출
	        IMP.request_pay({ // param
	            pg: "html5_inicis",
	            pay_method: "card",
	            merchant_uid: payPortNum,
	            name: getProNm(),
	            amount: $('#hidFinalPrice').val(),
	            buyer_email: order.email,
	            buyer_name: $('#sendman').val(),
	            buyer_tel: order.phone,
	            buyer_addr: order.delAdd,
	            buyer_postcode: "01181"
	        }, function (rsp) { // callback
	            if (rsp.success) {
	                //...,
	                // 결제 성공 시 로직,
	                //...
	                alert('결제성공');
	            } else {
	                //...,
	                // 결제 실패 시 로직,
	                //...
	            	alert('결제실패');
	            }
                
	        });
	    }) 
    
	    	
	    //적용금액
		$('#calPoint').text('-' + $('#pointBox').val() + '원');
	    
		//주문상품
		$('#orderPrice').text(<%= sum %> + "원");
	    
		//최종결제금액
	    $('#finalPrice').text(<%= sum %>  + 4000 - $('#pointBox').val() + '원');
		//최종결제금액 인풋
	    $('#hidFinalPrice').val(<%= sum %>  + 4000 - $('#pointBox').val());
	    //적립금 검사
	    $('#pointBox').change(function() {
			if($(this).val() >= <%=point%>){
				$(this).val(<%=point%>);
				$('#calPoint').text('-' + <%=point%> + '원');		
			}else{
				$('#calPoint').text('-' + $(this).val() + '원');
			}
			 $('#finalPrice').text(<%= sum %>  + 4000 - $('#pointBox').val() + '원');
			 $('#hidFinalPrice').val(<%= sum %>  + 4000 - $('#pointBox').val());
		});
	    
	    function getProNm() {
	    	let proNm = '<%= list.get(0).getProName() %>';
			if(<%= list.size() %> > 1){
				proNm += '외' + <%= list.size()-1 %> +  '건 상품';
			}
	    	
			return proNm;
		}
	    
    </script>
</div> 

	

</body>
</html>