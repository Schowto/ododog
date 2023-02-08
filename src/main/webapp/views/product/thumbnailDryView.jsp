<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.product.model.vo.UserProduct, com.odd.product.model.vo.ProAtt" %>	
<%
	ArrayList<UserProduct>list=(ArrayList<UserProduct>)request.getAttribute("list");
%>	

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
		<h3 align="center" id="top">건조 간식</h3>
		
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
		
     	

		<% if(list.isEmpty()) { %>
		<div>
		<p>존재하는 상품이 없습니다.</p>
		</div>
		<% }%>
		
		<div class="list-area">
			<% for(UserProduct p : list){ %>
			
				<div class="thumbnail" align="center">
					<input type="hidden" value="<%=p.getProNo() %>">
					<img src="<%=contextPath%>/<%= p.getThumbImg()%>" width="300px" height="300px">
					
					<p> 
						<%= p.getProName() %> <br>
						<b><%= p.getPrice() %>원</b>
					</p>
					<div class="badge bg-info text-light">추천</div>
				
				</div>
				<%} %>
			</div>
				
					
	</div>
	
	<script>
		$(function(){
			$(".thumbnail").click(function(){
				location.href = "<%=contextPath%>/detail.pro?no=" + $(this).children('input').val();
			})
		})
	</script>
	
	<!-- 스크롤 부분 -->
     	<a style="display:scroll;position:fixed;bottom:80px; right:30px;" rel="nofollow"
		href="#" style="font-size:2.0em"><img src="<%=contextPath%>/resources/icons/upArrowWithCircle.png" width="30px"></a>
		<a style="display:scroll;position:fixed;bottom:40px; right:30px;" rel="nofollow"
		href="#scrollbottom" style="font-size:2.0em"><img src="<%=contextPath%>/resources/icons/downArrowWithCircle.png" width="30px"></a>
		<div id="scrollbottom"></div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/userFooterbar.jsp"%>

</body>
</html>