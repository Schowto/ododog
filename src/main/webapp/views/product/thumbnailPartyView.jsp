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
	overflow: hidden;   
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
.thumbnail img{
    
   transform:scale(1.0);        

   transition: transform .5s; 
   object-fit:cover;
     
}
.thumbnail img:hover{
  transform:scale(1.5);            /* 이미지 확대 */
  transition: transform .5s; 	/*  시간 설정  */
	  
}
</style>
</head>
<body>


	<%@ include file="../common/userMenubar.jsp"%>
	<div class="outer">
		<br>
		<h3 align="center">PARTY</h3>
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
				<img src="<%=contextPath%>/resources/product_img/파티1.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">

				<p>
					<!-- 상품명-->
					[해피해피 생일세트] 강아지 케이크4종 택 일+강아지 생일파티용품SET 포함 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>

			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티2.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					[해피해피 생일세트] 강아지 케이크4종 택 일+강아지 생일파티용품SET 포함 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티3.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					[해피해피 생일세트] 강아지 케이크4종 택 일+강아지 생일파티용품SET 포함<br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티4.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					[해피해피 생일세트] 강아지 케이크4종 택 일+강아지 생일파티용품SET 포함<br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티5.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티6.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티7.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티8.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티9.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티10.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티11.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티12.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티13.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티14.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/파티15.png"
					width="300px" height="300px"
					onclick="location.href='<%=contextPath%>'">
				<p>
					<!-- 상품명-->
					도그쿡 전라북도 남원 청정 강아지 오리안심육포 <br>
				</p>
				<p>
					<!--가격-->
					<b>9,000원</b>
				</p>
			</div>


		</div>

	</div>

</body>
</html>