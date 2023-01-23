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
            
        }
        .header{
            box-sizing: border-box;
           border: 1px solid black; 
            width: 800px;
            height: 100px;
            background: gray;
            color:white;
           
        }
        #destination{
            border: 1px solid silver;
            width: 800px;         
        }

    </style>
</head>
<body>

	<div class="wrap">
		<form action="">
			<div class="header">
				<h2 align="center">주문/결제</h2>
			</div>
			<br>
			<br>
			<table>

				<b>주문 정보</b>
				<br>
				<br>

				<td>받는사람*</td>
				<td><input type="text" name="userName" placeholder="이름을 입력해주세요"
					required></td>
				</tr>
				<br>
				<br> 휴대전화*
				<input type="text" placeholder="휴대전화를 입력해주세요" required>
				<br>
				<br> 이메일
				<input type="email" placeholder="이메일을 입력해주세요">
				<br>
				<br> 주소*
				<input type="text" required placeholder="주소를 입력해주세요" required>
				<br>
				<br> 배송시 요청사항
				<input type="text" placeholder="요청 사항을 입력해주세요">
				<br>
				<br>
				<hr style="border: 1px color= silver;" width="100%">
				<br>
				<br>
				<b>주문상품</b>
				<br>
				<!--상품자리-->
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<hr style="border: 1px color= silver;" width="100%">
				<br>
				<b>적립금</b>
				<input type="number">
				<hr style="border: 1px color= silver;" width="100%">
				<b>결제정보</b>
				<!--주문 상품가격, 배송비 자리 -->
				<br>
				<br> 주문상품
				<br>
				<br>
				<br>
				<br>
				<br>
				<hr style="border: 1px color= silver;" width="100%">
				<br>
				<b>최종 결제 금액</b>
				<!-- 최종 총 결제할 금액 자리-->
				<br>
				<br>
				<br>

				<hr style="border: 1px color= silver;" width="100%">
				<br>
				<b>결제수단</b>
				<br>
				<br>
				<input type="radio"> 무통장 입금
				<br>
				<br>
				<input type="radio"> 신용카드
				<br>
				<br>
				<input type="radio"> 카카오페이
				<br>
				<br>

			</table>




		</form>
	</div>
</body>
</html>