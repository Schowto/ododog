<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.product.model.vo.ProAtt, com.odd.product.model.vo.UserProduct" %>	

<%
ArrayList<ProAtt> list = (ArrayList<ProAtt>)request.getAttribute("list");
UserProduct p = (UserProduct)request.getAttribute("p");
	
%>		
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1200px;
	margin: auto;
	margin-top: 100px;
}

.left {
	width: 40%;
	float: left;
	box-sizing: border-box;
}

.right {
	width: 60%;
	float: right;
	box-sizing: border-box;
	font-size: 15px;
}

.float-file {
	width: 100px;
	height: 100px;
	float: left;
	margin-bottom: 30px;
	box-sizing: border-box;
	background-size: cover;
	overfloew: hidden;
}

.file-area {
	margin-bottom: 10px;
	overfloew: hidden;
	cursor: pointer;
	transition: 0.4s;
}
input[type=number]::-webkit-inner-spin-button {
    opacity: 1
}

</style>
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
	<div class="outer">
		<form action="/list.de" method="post">
			<div class="left">
				<div class="file-area">
					<!--대표이미지-->
					<img src="<%=contextPath%>/<%= p.getThumbImg()%>"
						width="400px" height="400px">
				</div>

				<div class="float-file">
					<!--미리보기1-->
					<img src="<%=contextPath%>/<%= p.getThumbImg()%>"
						width="100px" height="100px">
				</div>

				<div class="float-file">
					<!--미리보기2-->
					<img src="<%=contextPath%>/resources/product_img/주식1-2.png"
						width="100px" height="100px">
				</div>

				<div class="float-file">
					<!--미리보기3-->
					<img src="<%=contextPath%>/resources/product_img/주식1-3.png"
						width="100px" height="100px">
				</div>
				
				<div class="float-file">
					<!--미리보기4-->
					<img src="<%=contextPath%>/resources/product_img/주식1-4.png"
						width="100px" height="100px">
				</div>
			</div>

			
			
			<div class="right">
			<br>
			
				<br> <span> <b>상품명</b> </span> 
				
				<span> <%= p.getProName() %> </span> 
				<br><br> 
				<span> <b>판매가</b></span> 
				<span> <%= p.getPrice() %> </span> 
				<br><br> 
				<span><b>적립금</b></span> 
				<span> 1% </span> 
				<br> <br>
				<span><b>제조사</b></span>
				<span>도그쿡</span>
				<br><br>

				<hr style="border: 1px color= silver;" width="100%">
				<br> <span> 수량 </span> 
					<input type="number" name="quantity" style="width: 50px">
				</span> <br> <br> <span> <b>TOTAL : </b>
				</span> <span> <b>16000원</b>
				</span> <br> <br> <br>
				　　　　　　　　
				<button type="submit" class="btn btn-light" id="like">관심상품
					등록</button>
				<!-- like modal-->
				<div class="modal fade2" id="testModal2" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									<img src="<%=contextPath%>/resources/icons/logoimg.png"
										width="25px" height="25px"> ododog.co.kr
								</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">X</span>
								</button>
							</div>
							<br>
							<br>
							<div id="img" align="center">
								<img src="<%=contextPath%>/resources/icons/heart.png"
									width="100px" height="100px">
							</div>
							<div class="modal-body" align="center">관심상품으로 등록되었습니다.</div>
							<br>
							<br>
							<div class="modal-footer">

								<button class="btn btn-primary" type="button"
									data-dismiss="modal">계속 쇼핑하기</button>
							</div>
						</div>
					</div>
				</div>

				<script>
					$('#like').click(function(e) {
						e.preventDefault();
						$('#testModal2').modal("show");
					});
				</script>
				<button type="submit" class="btn btn-secondary" id="shoppingcartBtn">장바구니
					담기</button>　

				<!-- 장바구니 modal-->
				<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									<b>장바구니 담기</b>
								</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">X</span>
								</button>
							</div>
							<br>
							<br>
							<div id="img" align="center">
								<img src="<%=contextPath%>/resources/icons/cart.png"
									width="100px" height="100px">
							</div>
							<br>
							<div class="modal-body" align="center">장바구니에 상품이 정상적으로
								담겼습니다.</div>
							<br>
							<br>
							<div class="modal-footer">
								<a class="btn btn-dark" id="modalY" href="#">장바구니로 이동</a>
								<button class="btn btn-light" type="button" data-dismiss="modal">계속
									쇼핑하기</button>
							</div>
						</div>
					</div>
				</div>


				<script>
					$('#shoppingcartBtn').click(function(e) {
						e.preventDefault();
						$('#testModal').modal("show");
					});
				</script>
				
				<button type="button" class="btn btn-dark" onclick="location.href='<%=contextPath%>/views/order/orderListView.jsp'">구매하기</button>

				<br>
				<br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br>
			</div>


			<hr style="border: 1px color= silver;" width="100%">

			<br> <br>
			<div class="content" align="center">


				<span>.</span>
				<hr style="border: 1px color= silver;" width="100%">

				<div>

					<span><b>상품 상세정보</b></span> 　　　　　　<span><b>상품 사용후기</b></span>
					<hr style="border: 1px color= silver;" width="100%">
					<img src="<%=contextPath%>/resources/product_img/본문1.jpg"
						width="800px" height="600px">
				</div>

				<div>
					<img src="<%=contextPath%>/resources/product_img/본문2.jpg"
						width="800px" height="600px">
				</div>

				<div>
					<img src="<%=contextPath%>/resources/product_img/본문3.jpg"
						width="800px" height="800px">
				</div>

				<div>
					<img src="<%=contextPath%>/resources/product_img/본문4.jpg"
						width="800px" height="1500px">
				</div>

			</div>
			<br> <br>


		</form>
	</div>
	<%@ include file="../common/userFooterbar.jsp"%>
</body>
</html>