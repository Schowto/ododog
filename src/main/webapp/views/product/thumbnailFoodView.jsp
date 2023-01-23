<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1400px;
	height: 1000px;
	margin: auto;
	margin-top: 50px; /*메뉴바 간격*/
}

.list-area {
	width: 1300px;
	margin: auto; /*가운데 배치*/
	font-size: 12px;
}

.thumbnail {
	width: 300px;
	display: inline-block;
	margin: 10px;
}

.category {
	display: inline-block;
}

b {
	color: rgb(23, 140, 203);
}

p:hover {
	color: rgb(202, 95, 131);
}

.img:hover  {
	  transform:  scale(1.2);
	  -webkit-transform:  scale(1.2);
	  -moz-transform:  scale(1.2);
	  -ms-transform:  scale(1.2);
	  -o-transform:  scale(1.2);
}

.img {
	width: 300px;
	 height: 300px;
	 overflow: hidden
}
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp"%>
	<div class="outer">
		<br>
		<h3 align="center" id="top">주식</h3>
		
		<br>
		<!--카테고리순-->
		<div align="right" style="width: 1110px" class="category">
			<a href="" class="btn btn-outline-light text-dark btn-sm">신상품</a>
		</div>
		<div align="right" class="category">
			<a href="" class="btn btn-outline-light text-dark btn-sm">상품명</a>
		</div>
		<div align="right" class="category">
			<a href="" class="btn btn-outline-light text-dark btn-sm">낮은가격</a>
		</div>
		<div align="right" class="category">
			<a href="" class="btn btn-outline-light text-dark btn-sm">높은가격</a>
		</div>
		
     	<!-- 스크롤 부분 -->
     	<a style="display:scroll;position:fixed;bottom:80px; right:30px;" rel="nofollow"
		href="#" style="font-size:2.0em"><img src="<%=contextPath%>/resources/icons/upArrowWithCircle.png" width="30px"></a>
		<a style="display:scroll;position:fixed;bottom:40px; right:30px;" rel="nofollow"
		href="#scrollbottom" style="font-size:2.0em"><img src="<%=contextPath%>/resources/icons/downArrowWithCircle.png" width="30px"></a>
		<div id="scrollbottom"></div>

		<div class="list-area">
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식1.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'" class=img>
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>

			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식2.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'"> 

				<p>
					<!--상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식3.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식4.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레)
					<br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식5.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-light text-dark">
				
				</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식6.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>
				<span class="badge bg-primary text-light">NEW</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식7.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식8.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식9.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-danger text-light">BEST</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식10.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식11.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식12.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/주식13.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<br>
			</div>
			<div class="thumbnail" align="center" id="bottom">
				<img src="<%=contextPath%>/resources/product_img/주식14.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					건강한 한끼 화식 4종세트(말고기, 닭고기, 소고기영양죽, 야채퓨레) <br>
				</p>
				<p>
					<!--가격-->
					<b>16,000원</b>
				</p>
				<div class="badge bg-light text-dark">
				</div>
			</div>
		</div>

	</div>

</body>
</html>