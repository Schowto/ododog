<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	text-align: center;
}

.warp {
	text-align: center;
}

table {
	width: 800px;
	height: 200px;
	text-align: center;
	border: 1px solid silver;
}

th {
	background-color: lightgray;
}
</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
	<div class="wrap" align="center">
		<br>
		<h3>장바구니</h3>
		<br>
		<br>
		<hr style="border: 1px color= silver;" width="100%">
		<br>

		<table id="shoppingCart" table-striped>
			<tr>
				<th><input type="checkbox"></th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>적립금</th>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td><a href="">
						<!--상품이미지-->
				</a></td>
				<td>
					<!--상품명-->
				</td>
				<td>XXXXX원<!--상품판매가--></td>
				<td><input type="number"></td>
				<td>
					<div class="badge bg-success">적</div>XXXX원<!--적립금-->
				</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td><a href="">
						<!--상품이미지-->
				</a></td>
				<td>
					<!--상품명-->
				</td>
				<td>XXXXX원<!--상품판매가--></td>
				<td><input type="number"></td>
				<td><div class="badge bg-success">적</div>XXXX원<!--적립금--></td>
			</tr>
		</table>
		<br>
		<br>
		<table id="shoppingBag">
			<tr>
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>결제예정금액</th>
			</tr>
			<tr>
				<td>
					<!--모든상품의가격-->XXXXXX원
				</td>
				<td>
					<!--배송비-->+ XXXX원
				</td>
				<td>
					<!--총결제예정금액-->= XXXXXX원
				</td>
			</tr>
		</table>
		<br>
		<hr style="border: 1px color= silver;" width="100%">
		<br> <br>
		<button type="submit" class="btn btn-secondary">전체상품주문</button>
		<button type="submit" class="btn btn-secondary">선택상품주문</button>
		<br>
		<br>
		<button type="button" class="btn btn-dark" id="button">쇼핑
			계속하기</button>
	</div>
	<br><br><br><br>
	<%@ include file="../common/userFooterbar.jsp"%>
</body>
</html>