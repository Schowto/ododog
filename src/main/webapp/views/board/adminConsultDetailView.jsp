<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.*, com.odd.member.model.vo.* "%>
<%
	//PageInfo pi = (PageInfo) request.getAttribute("pi");
	Consult c = (Consult)request.getAttribute("c");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>


  #content {
      width: 75%; height: 100%;
      padding-top: 20px;
      color: rgb(50, 50, 50);
      background: white;
  }
  .consultTable{
	width:100%;
	margin:auto;
  }
  table{
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
		font-size:14px;
		box-sizing: border-box;
	}
	.consultAnswer textarea{
		display:none;
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
	input[name=consultNo]{
		width:30px;
		border:none;
	}
	input[name=consultTitle]{
		width:250px;
		border:none;
	}
	input[name=consultCategory]{
		width:100px;
		border:none;
	}
	input[name=upfile]{
		border:none;
	}
    
</style>
</head>
<body>
	
    <div class="wrap">
 	    
 	      <%@ include file="../common/adminMenubarForInclude.jsp" %>
 	      
 	      
        <div id="content" align="center">

            
			<div class="consultTable" >
				<br>
           		<h6 align="center" style="font-weight:600; color:rgb(50, 50, 50);">1:1 문의 상세보기</h6>
            	<hr><br>
			<form action="<%=contextPath%>/answer.co" method="get" enctype="mutipart/form-data">
				<input type="hidden" name="consultNo" value="<%=c.getConsultNo()%>">
				<table>
					<tr>
						<td style="font-size:13px; width:10%; border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;번호</td>
						<td style="width:10%; border-right:1px solid rgb(220,220,220);">
							&nbsp;&nbsp;
							<input type="text" name="consultNo" value="<%=c.getConsultNo()%>" readonly>
						</td>
						<td style="font-size:13px; width:10%; border-right:1px solid rgb(220,220,220); width:10%;">&nbsp;&nbsp;&nbsp;제목</td>
						<td style="width:40%; border-right:1px solid rgb(220,220,220);">
							&nbsp;&nbsp;
							<input type="text" name="consultTitle" value="<%=c.getConsultTitle()%>" readonly>
						</td>
						<td style="font-size:13px; width:15%; border-right:1px solid rgb(220,220,220);">&nbsp;&nbsp;&nbsp;카테고리</td>
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
				
				
					<button type="button" onclick="location.href='<%=contextPath%>/admin.co'">목록</button>
					<button type="submit">답변등록</button>
					<button type="button" onclick="location.href='<%=contextPath%>/delete.co?no=<%=c.getConsultNo()%>'">답변수정</button>
				
				
				</div>
				
			</form>	
			</div>
			<br><br><br><br>
              
              
        </div>            
        </div>
    </div>
        

        
     	

</body>
</html>