<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.odd.board.model.vo.*" %>
<%
	// c : 번호, 제목, 작성자, 작성일, status, 원본명, 첨부파일명||저장경로
	Consult c = (Consult)request.getAttribute("c");
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
	.consultEnroll input[type=text]{
		width:300px;
		border:1px solid rgb(220,220,220);
		color:rgb(50, 50, 50);
	}
	textarea{
		width:100%;
		height:400px;
		background: rgb(220,220,220);
		border:none;
		font-size:14px;
		box-sizing: border-box;
	}
	.consultAnswer textarea{
		display:none;
	}
	.consultEnroll input[name=consultNo]{
		width:70px;
		border:none;
		height:20px;
		color:rgb(50, 50, 50);
	}
	.consultEnroll input[name=consultCategory]{
		width:150px;
		border:none;
		height:20px;
		color:rgb(50, 50, 50);
	}
	button{
		width:70px;
		height:30px;
	}
	.blink:hover{
		opacity:0.7;
		cursor:pointer;
	}
	@keyframes blink-effect {
		50%{
			opacity:0;
		}
	}

	.blink{
		/*color:blue;*/
		animation:blink-effect is step-end infinite;

		animation-name: blink-effect;
		animation-duration: 1s;
		animation-iteration-count:infinite;
		animation-timing-function:step-end;
	}
	.consultEnroll input[name=consultTitle], .consultEnroll input[name=upfile]{
		width:300px;
		height:20px;
		border:none;
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

			<h2 align="center" style="font-weight:600; color:rgb(50, 50, 50);">1:1 문의 게시판</h2>
			<br><br><br><br>

			<div class="consultEnroll">
				
				<form action="<%=contextPath%>/updateForm.co" method="get" enctype="mutipart/form-data">
					<input type="hidden" name="no" value="<%=c.getConsultNo()%>">
					<table>
						<tr>
							<td style="font-size:14px; width:10%; border-right:1px solid rgb(220,220,220); width:10%;">&nbsp;&nbsp;&nbsp;번호</td>
							<td style="width:10%; border-right:1px solid rgb(220,220,220);">
								&nbsp;&nbsp;
								<input type="text" name="consultNo" value="<%=c.getConsultNo()%>" readonly>
							</td>
							<td style="font-size:14px; width:15%; border-right:1px solid rgb(220,220,220); width:10%;">&nbsp;&nbsp;&nbsp;제목</td>
							<td style="width:40%; border-right:1px solid rgb(220,220,220);">
								&nbsp;&nbsp;
								<input type="text" name="consultTitle" value="<%=c.getConsultTitle()%>" readonly>
							</td>
							<td style="font-size:14px; width:10%; border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;카테고리</td>
							<td style="width:20%">
								&nbsp;&nbsp;
								<input type="text" name="consultCategory" value="<%=c.getConsultCategory()%>" readonly>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<br>
								<textarea name="consultContent" style="resize:none;" readonly><%=c.getConsultContent()%></textarea>
								<br><br>
							</td>
						</tr>
						<tr>
							<td style="border-right:1px solid rgb(220,220,220);">첨부파일 </td>
							<td colspan="5">&nbsp;&nbsp;<input type="text" name="upfile" value="<%=c.getOriginName()%>" readonly></td>
						</tr>
						
					</table>
					
					<br>
		
					<div align="center">
					
					
						<button type="button" onclick="location.href='<%=contextPath%>/list.co'">목록</button>
						<button type="submit">수정</button>
						<button type="button" class="btn-red" onclick="location.href='<%=contextPath%>/delete.co?no=<%=c.getConsultNo()%>'">삭제</button>
					
					
					</div>
					
					<script>
						$(function(){
							$("#answerBtn").click(function(){
								location.href='<%=contextPath%>/answer.co?no=<%=c.getConsultNo()%>';
							})
						})
					</script>
					
				</form>	
    		</div>
    			
    			
    			<br>
					
					<%if(c.getConsultAnswer() != null){ %>
					<table class="consultAnswer">
						<tr>
							<td style="text-align:center; width:15%; border-right:1px solid rgb(220,220,220);">클릭해서 확인하기</td>
							<td class="blink" style="color:rgb(200,140,140);">&nbsp;&nbsp;안녕하세요 오도독(DOG)입니다. 문의에 대해 답변드립니다.</td>
						</tr>
						<tr>
							<td colspan="6">
								<br>
								<textarea class="answer" style="padding:40px;" readonly><%=c.getConsultAnswer()%></textarea>
								<br><br>
							</td>
						</tr>
					</table>
					<%} %>
					
					
					<!-- 
					<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
					-->
    				<script>
      					$( document ).ready( function() {
        					$( '.blink' ).click( function() {
          						$( '.answer' ).slideDown();
        					} );
      					} );
    				</script>	

		</div>



		<%@ include file="../common/userFooterbar.jsp" %>
		
	</div>
	
	

</body>
</html>