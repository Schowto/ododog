<%@page import="java.text.DecimalFormat"%>
<%@page import="com.odd.order.model.vo.Cart"%>
<%@page import="java.util.ArrayList"%>
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
	width: 1000px;
	height:200px;
	text-align: center;

}


th {
	background-color: lightgray;
	height:80px;
}
input[type=number]::-webkit-inner-spin-button {
    opacity: 1
</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
	<%
	ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
	DecimalFormat df = new DecimalFormat("###,###"); //금액 포맷

	%>


	<div class="wrap" align="center">
		<br><br><br>
		<h4>장바구니</h4>
		<br>
		<br>
		<hr style="border: 1px color= silver;" width="100%">
		<br><br>
	<form action="<%=contextPath%>/order.pro" method="get" id="orderFrm">
		<table id="shoppingCart" table-striped>
			<tr>
				<th><!-- <input type="checkbox"> --></th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>적립금</th>
				<th>삭제</th>
			</tr>

			<%
			int sum = 0;
			if(list.size() > 0){
				for(int i = 0; i < list.size(); i++){
						sum += list.get(i).getProduct().getPrice();
			%>
			<tr>
				<td>
					<input type="checkbox" class="proNoChk" name="proNoChk" value="<%=list.get(i).getProduct().getProNo()%>">
					<input type="hidden" class="proNo" name="proNo" value="<%=list.get(i).getProduct().getProNo()%>">
				</td>
				<td>
					<a href="<%=contextPath%>/detail.pro?no=<%=list.get(i).getProduct().getProNo()%>">
					<!--상품이미지-->
						<img src="<%=contextPath%>/<%=list.get(i).getProduct().getThumbImg()%>" width="150px" height="150px">
					</a>
				</td>
				<td>
					<!--상품명-->
					<b><%=list.get(i).getProduct().getProName()%></b>
				</td>
				<td><%=df.format(list.get(i).getProduct().getPrice())%>원<!--상품판매가--></td>
				<td><input type="number" id="quantity" name="quantity" value="<%=list.get(i).getCartQty()%>"></td>
				<td>
					<div class="badge bg-success">적</div>&nbsp<%=df.format((list.get(i).getProduct().getPrice())*(list.get(i).getProduct().getSave()))%>원<!--적립금-->
				</td>
				<td>
					<button type="button" class="btn btn-danger" onclick="deleteCart(<%=list.get(i).getCartNo()%>);">삭제</button>
				</td>
			</tr>
			<%
				}
			} else{

			%>
			<tr>
				<td class="noProd">
					장바구니 상품이 없습니다.
				</td>

			</tr>

			<%} %>
		</table>
	</form>
		<form action="<%=contextPath%>/delCart.ord" method="post" id="delFrm">
			<input type="hidden" value="" name="cartNo" id="cartNo">
		</form>


		<br>
		<br>
		<%
			if(list.size() > 0){
		%>
		<table id="shoppingBag">
			<tr>
				<th>총 상품금액</th>
				<th>총 배송비</th>
				<th>결제예정금액</th>
			</tr>
			<tr>
				<td>
					<!--모든상품의가격-->
					<%= df.format(sum) %>원
				</td>
				<td>
					<!--배송비-->+ 4,000원
				</td>
				<td>
					<!--총결제예정금액-->=
					<%= df.format(sum + 4000) %>원
				</td>
			</tr>
		</table>
		<%} %>
		<br>
		<hr style="border: 1px color= silver;" width="100%">
		<br> <br>
		<button type="button" class="btn btn-secondary" onclick="orderAllProduct();">전체상품주문</button>
		<!-- <button type="button" class="btn btn-secondary" onclick="orderProduct();">선택상품주문</button> -->
		<br>
		<br>
		<button type="button" class="btn btn-dark" id="button" onclick="goMain();">쇼핑
			계속하기</button>
	</div>
	<script>
		//메인으로
		function goMain() {
			location.href = `<%=contextPath%>`;
		}

		//전체상품 주문
		function orderAllProduct() {
			let carts = document.getElementsByClassName('cartNo');
			if($('.noProd').length > 0){
				alert('상품없음');
				return;
			}
			//전체상품 체크처리
			for(let i = 0; i < carts.length; i++){
				carts[i].checked = true; //없어도 동작함

			}

			$('#orderFrm').submit();
		}

		//선택 상품 주문
		function orderProduct() {
			let carts = document.getElementsByClassName('cartNo');
			let flag = false;
			//갯수 체크
			for(let i = 0; i < carts.length; i++){
				if(carts[i].checked == true){
					flag = true;
				}
			}

			//선택체크
			if(flag == false){
				alert('선택한 상품이 없습니다.');
				return false;
			} else{
				$('input[type=checkbox]').each(function() {
					if($(this).checked == false){

						console.log($(this));
					}
				});


				//$('#orderFrm').submit();
			}
		}
		//장바구니 삭제
		function deleteCart(cartNo){
			$('#delFrm #cartNo').val(cartNo);
			$('#delFrm').submit();
		}

		//체크박스 클릭 이벤트
		$('.proNoChk').click(function() {
			if(!$(this).is(':checked')){
				console.log($(this));


			}
		});

	</script>
	<br><br><br><br>
	<%@ include file="../common/userFooterbar.jsp"%>
</body>
</html>