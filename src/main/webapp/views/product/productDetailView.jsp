<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	font-size: 13px;
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

</style>
</head>
<body>
	<%@ include file="../common/userMenubar.jsp"%>
	<div class="outer">
		<form action="" method="post">
			<div class="left">
				<div class="file-area">
					<!--대표이미지-->
					<img src="<%=contextPath%>/resources/product_img/주식1.png"
						width="400px" height="400px">
				</div>

				<div class="float-file">
					<!--미리보기1-->
					<img src="<%=contextPath%>/resources/product_img/주식1.png" 
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
				<br> <span> <b>상품명</b>
				</span> <span> 건강한 한끼 화식 4종세트 (말고기, 닭고기, 소고기영양죽, 야채퓨레) </span> <br>
				<br>
				<br><br> <span> <b>판매가</b>
				</span> <span> 16,000원 </span> <br>
				<br>
				<br> <span> <b>적립금</b>
				</span> <span> 1% </span> <br>
				<br>

				<hr style="border: 1px color= silver;" width="100%">
				<br> <span> 건강한 한끼 화식 4종세트 (말고기, 닭고기, 소고기영양죽, 야채퓨레) </span> <span>
					<input type="number" name="quantity" style="width: 40px" placeholder:"1">
				</span> <br>
				<br> <span> <b>TOTAL : </b>
				</span> <span> <b>16000원</b>
				</span> <br>
				<br>
				<br>

				<button type="submit" class="btn btn-dark">구매하기</button>
				<button type="submit" class="btn btn-secondary">장바구니 담기</button>
				<button type="submit" class="btn btn-light">관심상품 등록</button>
				<br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
			

			<hr style="border: 1px color= silver;" width="100%">
			
			<br>
			<br>
			<div class="content" align="center">
			
			
				<span>.</span>　
				<hr style="border: 1px color= silver;" width="100%">
				
				<div>
				
				<span><b>상품 상세정보</b></span>　　　　　　 <span><b>상품 사용후기</b></span>
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
			<br><br>


		</form>
	</div>
</body>
</html>