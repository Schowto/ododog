<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Consult "%>
<%
	
	//PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Consult> list = (ArrayList<Consult>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1200px;
	height: 100%;
	margin: auto;
}
/****** 사이드 ******/
#side {
	/*border:1px solid blue;*/
	width: 20%;
	height: 100%;
	padding: 20px;
	color: rgb(50, 50, 50);
	font-weight: 600;
	float: left;
}

#side>hr {
	margin-bottom: 30px;
	border: 1px solid rgb(220, 220, 220);
}

#side>a {
	text-decoration: none;
	color: rgb(50, 50, 50);
}

/****** 내용 ******/
.content {
	width: 75%;
	height: 100%;
	margin: auto;
	margin-top: 180px;
	margin-bottom: 200px;
	display: inline-block;
	margin-left: 40px;
}

table {
	width: 100%;
	height: 100%;
	border-top: 1px solid rgb(220, 220, 220);
	border-collapse: collapse;
	border-spacing: 0;
	text-align: center;
}

td {
	border-bottom: 1px solid rgb(220, 220, 220);
	height: 50px;
}

#btn1 {
	width: 70px;
	height: 30px
}

.consultSearch {
	width: 350px;
	margin: auto;
}

#btn2 {
	width: 50px;
	height: 28px;
}

#consultDetail:hover {
	opacity: 0.7;
	cursor: pointer;
}
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp"%>

	<div class="outer">

		<div id="side">
			<br> <br> <br> <br> <br>
			<p style="font-size: 23px;">MYPAGE</p>
			<hr>
			<a href="<%=contextPath%>/myOrder.me" style="font-size: 17px;">주문조회</a>
			<br> <br> <a href="<%=contextPath%>/myPage.me"
				style="font-size: 17px;">회원정보</a> <br> <br> <a
				href="<%=contextPath%>/myWhish.me" style="font-size: 17px;">관심상품</a>
			<br> <br> <a href="<%=contextPath%>/myPoint.me"
				style="font-size: 17px;">적립금</a> <br> <br> <a
				href="<%=contextPath%>/myBoard.me" style="font-size: 17px;">게시글조회</a>
			<br> <br> <a href="<%=contextPath%>/list.co"
				style="font-size: 17px; color: rgb(200, 140, 140);">1:1맞춤상담</a>
		</div>

		<script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

		<div class="content">

			<h2 align="center" style="font-weight: 600; color: rgb(50, 50, 50);">1:1문의 게시판</h2>
			<br> <br> <br> <br>

			<table class="list-area">
				<thead>
					<tr style="height: 50px;">
						<td width="10%;">번호</td>
						<td width="60%;">제목</td>
						<td width="10%;">카테고리</td>
						<td width="10%;">작성일</td>
						<td width="10%;">답변</td>
					</tr>
				</thead>
				<tbody>
					<%if (list.isEmpty()) {%>
					<!-- 게시글이 없을 경우 -->
					<tr style="height: 100px;">
						<td colspan="5" style="font-weight: 600; color: rgb(50, 50, 50);">
							<br> <br> 
							<img src="<%=contextPath%>/resources/images/error.png"> <br>
							게시글이 존재하지 않습니다. <br> <br> <br>
						</td>
					</tr>
					<%
					} else {%>
					<!-- 게시물이 있는 경우  -->
					<%for (Consult c : list) {%>
						<tr>
							<td><%=c.getConsultNo()%></td>
							<td><%=c.getConsultTitle()%></td>
							<td><%=c.getConsultCategory()%></td>
							<td><%=c.getEnrollDate()%></td>
							<td><%=c.getStatus()%></td>
						</tr>
					<%}%>

				<%}%>

				</tbody>
			</table>
			
			<!-- 게시글 상세보기 -->
        	<script>
        		$(function(){
	        		$(".list-area>tbody>tr").click(function(){
	        			location.href = '<%=contextPath%>/detail.co?no=' + $(this).children().eq(0).text();
	        		})
	        	})
	        </script>

			<br>

			<div align="right">
				<button id="btn1">글쓰기</button>
			</div>

			<script>
            $(function(){
            	$("#btn1").click(function(){
            		location.href="<%=contextPath%>/enroll.co";
            	});
            })
            </script>

			<script>
            $(function(){
            	$("#btn1").click(function(){
            		location.href="<%=contextPath%>/update.co";
					})
				})
			</script>
			<br> <br>

		</div>

		<div class="consultAnswer">
			<select name="" id="searchAnswer">
				<option value="" selected>전체</option>
				<option value="">미답변</option>
				<option value="">답변</option>
			</select> &nbsp; <input type="text" id="searchInput" value=""
				style="height: 25px;"> &nbsp;
			<button type="button" id="btn2" onclick="">찾기</button>

		</div>

			<%@ include file="../common/userFooterbar.jsp"%>
			
		</div>



</body>
</html>