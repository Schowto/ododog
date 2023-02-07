<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.product.model.vo.ProAtt, com.odd.product.model.vo.UserProduct" %>	

<%
ArrayList<ProAtt> list = (ArrayList<ProAtt>)request.getAttribute("list");
UserProduct p = (UserProduct)request.getAttribute("p");
int count = request.getAttribute("count") != null ? (int) request.getAttribute("count") : 0 ;
	
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

	/******리뷰 스타일*******/
	.reviewLine{
    width:1000px;
    height:3px;
    background: rgba(128, 128, 128, 0.26);
    margin:auto;
    }
	.reviewContent{
		width:1000px;
		margin:auto;
	}
	.reviewTable{
		width:100%;
	}
    .reviewTable textarea{
        resize:none; 
        border:none;
        background-color: rgba(128, 128, 128, 0.285);
		width:1000px;
		height:400px;
    }
    .reviewTable table{
        border-collapse: collapse;
        border-spacing: 0;
        width:800px;
        margin:auto;
        border-top:2px solid rgba(128, 128, 128, 0.26);
        margin:auto;

    }
    .reviewTable td{
		border-bottom: 2px solid rgb(220,220,220);
    }
    .reviewTable img{
        box-sizing: border-box;
        width:100px;
        height:100px;
    }
    .reviewTable td:last-child{
        border-bottom:3px solid rgba(128, 128, 128, 0.26);
    }
	.reviewTable td{
		border-bottom:3px solid rgb(220,220,220);
		
	}


</style>
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>

	<div class="outer"> <!-- 전ㅊㅔ시작 -->
		<div class="content"> <!-- 1 -->
		<form action="<%=contextPath%>/order.product" method="get" id="frm">  
			<div class="left"> <!-- 2 -->
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
			</div> <!-- 2 -->

			
			
		<div class="right"> <!-- 3 -->
			<br>
			
				<br> <span> <b>상품명</b> </span> 
				
				<span> 　　<b><%= p.getProName() %></b> </span> 
				<br><br> 
				<span> <b>판매가</b></span> 
				<span> 　　<b><%= p.getPrice() %>원</b> </span> 
				<br><br> 
				<span><b>적립금</b></span> 
				<span> 　　<b>1%</b> </span> 
				<br> <br>
				<span><b>제조사</b></span>
				<span>　　<b>도그쿡</b></span>
				<br><br>
				
				<input type="hidden" name="proNo" value="<%= p.getProNo() %>">
				<input type="hidden" name="price" value="<%= p.getPrice() %>">
				
				<hr style="border: 1px color= silver;" width="100%">
				<br> <span> 수량 　</span>
					<input type="number" name="quantity" id="quantity" value="1" style="width: 50px"> 
					
					<button type=button>변경</button>
				<br> <br> <span> <b>TOTAL : </b>
				</span> <span> <b>16000원</b>
				</span> <br> <br> <br>
				　　　　　　　　
					<%
					if(count > 0){
					%>
						<button type="button" class="btn btn-light" id="like" onclick="delPick();">
							관심상품 삭제
						</button>
					<%
					}else{
					%>
						<button type="button" class="btn btn-light" id="like" onclick="addPick();">
							관심상품 등록
						</button>
					<%
					}
					%>
					
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
					/* $('#like').click(function(e) {
						e.preventDefault();
						$('#testModal2').modal("show");
					}); */
				</script>
				<button type="button" class="btn btn-secondary" id="shoppingcartBtn" onclick="addCart();">장바구니
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
								<a class="btn btn-dark" id="modalY" href="<%=contextPath%>/cart.ord">장바구니로 이동</a>
								<button class="btn btn-light" type="button" data-dismiss="modal">계속
									쇼핑하기</button>
							</div>
						</div>
					</div>
				</div>


				<script>
					/* $('#shoppingcartBtn').click(function(e) {
						e.preventDefault();
						
						//$('#testModal').modal("show");
					}); */
				</script>
				
				<span class="pay">
				<button type="submit" class="btn btn-dark"  >구매하기</button>
				 
				</span>
			</div>	
				<br><br> <br> <br> <br><br> <br> <br> <br><br> <br> <br><br>
				<br> <br> <br> <br> <br> <br> <br>
				
		 </form>	
	</div> 
			
			<br> <br>
			<div class="content" align="center">


				
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
			
	 <script>
		<%-- $(function(){
			$(".pay").click(function(){
				location.href = "<%=contextPath%>/order.pro?no=" + $(this).children('input').val();
			})
		}) --%>
		
		//장바구니 담기 여부에 따른모달 처리
		$(function (){
			const urlParams = new URL(location.href).searchParams;
			const state = urlParams.get('state');
			
			//담기지 않았다면 오류 메세지 출력
			
			if(state == 'fail'){
				$('#testModal .modal-body').text('장바구니에 담기지 않았습니다!!!');
				$('#testModal').modal("show");
			}else if(state == 'success'){
				$('#testModal .modal-body').text('장바구니에 상품이 정상적으로 담겼습니다.');
				$('#testModal').modal("show");
			}
			
			
			
			
			
		})
		//관심상품 담기 여부에 따른모달 처리
		$(function (){
			const urlParams = new URL(location.href).searchParams;
			const pickState = urlParams.get('pickState');
			
			//담기지 않았다면 오류 메세지 출력
			if(pickState == 'fail'){
				$('#testModal2 .modal-body').text('관심상품에 담기지 않았습니다!!!');
				$('#testModal2').modal("show");
			}else if(pickState == 'success'){
				$('#testModal2 .modal-body').text('관심상품에 상품이 정상적으로 담겼습니다.');
				$('#testModal2').modal("show");
			}else if(pickState == 'exist'){
				$('#testModal2 .modal-body').text('이미 관심상품에 담겼습니다.');
				$('#testModal2').modal("show");
			}else if(pickState == 'delSuccess'){
				$('#testModal2 .modal-body').text('관심상품이 삭제되었습니다.');
				$('#testModal2').modal("show");
			}else if(pickState == 'delFail'){
				$('#testModal2 .modal-body').text('관심상품 삭제 실패...!');
				$('#testModal2').modal("show");
			}else if(pickState == 'delExist'){
				$('#testModal2 .modal-body').text('이미 삭제된 상품입니다.');
				$('#testModal2').modal("show");
			}
		
			
			
			
		})
		
		//장바구니 담기
		function addCart() {
			let $form = $('#frm');
		
			$form.attr('action', `<%=contextPath%>/addCart.ord`);//form 주소 변경
			$form.attr('method', 'post');
			
			$form.submit();
		}
		//관심상품 담기
		function addPick() {
			let $form = $('#frm');
		
			$form.attr('action', `<%=contextPath%>/addPick.ord`);//form 주소 변경
			$form.attr('method', 'post');
			
			$form.submit();
		}
		//관심상품 삭제
		function delPick() {
			let $form = $('#frm');
		
			$form.attr('action', `<%=contextPath%>/delPick.ord`);//form 주소 변경
			$form.attr('method', 'post');
			
			$form.submit();
		}
		
		
	</script>
			<br> <br>
	
			
	</div> <!--전체끝 -->
		
	<%@ include file="../common/userFooterbar.jsp"%>
</body>
</html>