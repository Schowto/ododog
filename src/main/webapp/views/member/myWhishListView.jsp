<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.order.model.vo.* " %>
<%
	ArrayList<Like> list = (ArrayList<Like>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1200px;
		height:100%;
		margin:auto;
	}
	/****** 사이드 ******/
    #side{
        /*border:1px solid blue;*/
        width:20%; 
        height:100%;
        padding:20px;
        color: rgb(50, 50, 50);
        font-weight: 600;
        float:left;
    }
    #side>hr{margin-bottom:30px; border:1px solid rgb(220,220,220);}
    #side>a{
        text-decoration:none;
        color: rgb(50, 50, 50);
    }

    /****** 내용 ******/
	.content{
		width:75%;
		height:100%;
		margin:auto;
		margin-top:180px;
		margin-bottom: 200px;
		display:inline-block;
		margin-left:40px;
	}
	table{
		width:100%;
		border-top:1px solid rgb(220,220,220);
		text-align: center;
	}
	td{
		border-bottom: 1px solid rgb(220,220,220);
		font-size: 14px;
		color:rgb(50, 50, 50);
		text-align:center;
	}
	myWhishList img{
		height:100px;
		width:100px;
	}
	button{
		width:100px;
		height:30px;
	}
	.btn-red{
		width:100px;
		height:30px;
	}
</style>
</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

	<div class="outer">

		<div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">MYPAGE</p>
            <hr>
            <a href="<%=contextPath%>/myOrder.me" style="font-size:17px;">주문조회</a> <br><br>
            <a href="<%=contextPath%>/myPage.me" style="font-size:17px;">회원정보</a> <br><br>
            <a href="<%=contextPath%>/myWhish.me" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="<%=contextPath%>/list.co" style="font-size:17px; color:rgb(200, 140, 140);">1:1맞춤상담</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

		<div class="content">

			<h2 align="center" style="font-weight:600; color:rgb(50, 50, 50);">관심상품</h2>
			<br><br><br><br>

			<div class="myWhishList">

				<!--관심상품이 없는경우-->
				<form action="">
					<table>
						<thead>
						<tr style="height:50px;">
							<td style="width:100px;">이미지</td>
							<td style="width:500px;">상품정보</td>
							<td style="width:100px;">판매가격</td>
							<td style="width:300px;">선택</td>
						</tr>
						</thead>
						<tbody>
						<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="6" style="height:150px; font-weight: 600;">
								<br><br>
								<img src="<%=contextPath%>/resources/images/error.png"> <br>
								관심상품이 없습니다.
								<br><br><br>
							</td>
						</tr>
						<%}else{ %>
							<%for(Like k : list){ %>
							<tr style="height:150px;">
								<td style="width:100px;">
									<img src="<%=k.getThumbImg()%>">
								</td>
								<td style="width:400px;"><%=k.getProName() %></td>
								<td style="width:100px;"><%=k.getPrice() %></td>
								<td style="width:400px;">
									<div style="margin-bottom:5px;">
										<button onclick="location.href='<%=contextPath%>/addCart.ord?proNo=<%=k.getPro_no()%>'">장바구니담기</button> <br>
									</div>
									<div>
										<button class="btn-red" onclick="location.href='<%=contextPath%>/delPick.ord?proNo=<%=k.getPro_no()%>'">삭제</button>
									</div>
								</td>
						</tr>
							<%} %>
						<%} %>
						</tbody>
					</table>
				</form>

				<br><br>

			</div>
		</div>







	</div>
	
	<%@ include file="../common/userFooterbar.jsp" %> 
	

</body>
</html>