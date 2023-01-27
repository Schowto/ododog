<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	}
	table{
		width:100%;
		border-top:1px solid rgb(220,220,220);
		border-collapse: collapse;
		border-spacing: 0;
	}
	td{
		height:50px;
		color:rgb(50, 50, 50);
		border-bottom:1px solid rgb(220,220,220);
		font-size:14px;
	}
	select{
		width:400px;
		border:1px solid rgb(220,220,220);
		height:30px;
		color:rgb(50, 50, 50);
	}
	textarea{
		width:100%;
		height:400px;
		background: rgb(220,220,220);
		border:none;
	}
	#btn{
		width:70px;
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
            <a href="" style="font-size:17px;">관심상품</a> <br><br>
            <a href="<%=contextPath%>/myPoint.me" style="font-size:17px;">적립금</a> <br><br>
            <a href="<%=contextPath%>/myBoard.me" style="font-size:17px;">게시글조회</a> <br><br>
            <a href="<%=contextPath%>/consult.bo" style="font-size:17px; color:rgb(200, 140, 140);">1:1맞춤상담</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>

		<div class="content">

			<h2 align="center" style="font-weight:600; color:rgb(50, 50, 50);">1:1 문의 게시판</h2>
			<br><br><br><br>

			<div class="consultEnroll">
				<form action="">
					<table>
						<tr>
							<td style="width:15%; border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;제목</td>
							<td>
								&nbsp;&nbsp;
								<select name="" id="">
									<option value="">&nbsp;문의드립니다.</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan=2>
								<br>
								<textarea name="" id="" style="resize:none;" readonly></textarea>
								<br><br>
							</td>
						</tr>
						<tr>
							<td style="border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;첨부파일 1</td>
							<td>&nbsp;&nbsp;<input type="file" readonly></td>
						</tr>
						<tr>
							<td style="border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;첨부파일 2</td>
							<td>&nbsp;&nbsp;<input type="file" readonly></td>
						</tr>
						<tr>
							<td style="border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;첨부파일 3</td>
							<td>&nbsp;&nbsp;<input type="file" readonly></td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td style="width:15%; border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;답변</td>
							<td>&nbsp;&nbsp;안녕하세요 오도독(DOG)입니다. 문의에 대해 답변드립니다.</td>
						</tr>
						<tr>
							<td colspan="2">
								<br>
								<textarea name="" id="" style="resize:none;"></textarea>
								<br><br>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<br>

			<div align="center">
				<button type="submit" id="btn" >목록</button>
			</div>

			<script>
				$(function(){
					$("#btn1, #btn2").click(function(){
						location.href="<%=contextPath%>/consult.bo";
					});
				})
			</script>

		</div>







		
	</div>
	
	<%@ include file="../common/userFooterbar.jsp" %>

</body>
</html>