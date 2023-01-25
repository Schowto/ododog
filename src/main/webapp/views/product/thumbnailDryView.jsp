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
		<h3 align="center">건조 간식</h3>
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
				<img src="<%=contextPath%>/resources/product_img/건조1.png"
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
				<div class="badge bg-info text-light">추천</div>
				<span class="badge bg-danger text-light">BEST</span>

			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조2.png"
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
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조3.png"
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
				<div class="badge bg-info text-light">추천</div>
				<span class="badge bg-primary text-light">NEW</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조4.png"
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
				<span class="badge bg-danger text-light">BEST</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조5.png"
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
				<div class="badge bg-info text-light">추천</div>
				<span class="badge bg-primary text-light">NEW</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조6.png"
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
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조7.png"
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
				<div class="badge bg-primary text-light">NEW</div>
					<span class="badge bg-danger text-light">BEST</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조8.png"
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
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조9.png"
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
				<div class="badge bg-info text-light">추천</div>
				<span class="badge bg-primary text-light">NEW</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조10.png"
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
				<div class="badge bg-primary text-light">NEW</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조11.png"
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
				<div class="badge bg-primary text-light">NEW</div>
				<span class="badge bg-danger text-light">BEST</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조12.png"
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
				<div class="badge bg-primary text-light">NEW</div>
				<span class="badge bg-danger text-light">BEST</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조13.png"
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
				<div class="badge bg-info text-light">추천</div>
				<span class="badge bg-primary text-light">NEW</span>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조14.png"
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
				<div class="badge bg-primary text-light">NEW</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조15.png"
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
				<div class="badge bg-primary text-light">NEW</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조16.png"
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
				<div class="badge bg-info text-light">추천</div>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조17.png"
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
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조18.png"
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
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조19.png"
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
				<br>
			</div>
			<div class="thumbnail" align="center">
				<img src="<%=contextPath%>/resources/product_img/건조20.png"
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
				<br>
			</div>

		</div>

	</div>
	<%@ include file="../common/userFooterbar.jsp"%>

</body>
</html>