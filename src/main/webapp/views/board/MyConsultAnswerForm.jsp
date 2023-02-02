<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Consult "%>
<%
	
	//PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Consult> list = (ArrayList<Consult>) request.getAttribute("list");
	Consult c = (Consult)request.getAttribute("c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /******** 내용 *******/
    #content{/*border:1px solid pink;*/}

    #content p{
        margin-top:10px;
        margin-bottom:3px;
        margin-left:20px;
        font-weight:700;
    }
    #content hr{
        margin:10px 0px;
        border:1px solid rgb(220,220,220);
    }

    .list-area{
        width:850px;
        font-size:13px;
        text-align:center;
    }
    .list-area th{
        border-bottom: 2px solid rgb(220, 220, 220);
    }
    .list-area th, .list-area td{
        border-top: 1px solid rgb(220, 220, 220);
        padding:5px 0px; line-height:30px;
    }
    .list-area>tbody>tr:hover{font-weight:700; cursor: pointer;}

    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
        background:rgb(220,220,220);
        font-weight:700;
    }
	textarea{
		width:100%;
		height:400px;
		background: rgb(220,220,220);
		border:none;
		font-size:14px;
		box-sizing: border-box;
	}
	table{
		width:100%;
		border-top:1px solid rgb(220,220,220);
		border-collapse: collapse;
		border-spacing: 0;
	}

</style>

</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
            <br>
            <div align="left">
                <p>맞춤상담 답변</p>
            </div>
            <hr>

            <table class="list-area">
				<form action="<%=contextPath%>/answer.co" method="post">
					<thead style="text-align:center">
						<tr>
							<th width="10%"></th>
							<th width="10%">글번호</th>
							<th width="10%">작성자</th>
							<th width="50%">제목</th>
							<th width="10%">작성일</th>
							<th width="10%">답변여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th></th>
							<th><%=c.getConsultNo()%></th>
							<th><%=c.getUserId()%></th>
							<th><%=c.getConsultTitle()%></th>
							<th><%=c.getEnrollDate()%></th>
							<th><%=c.getAnswerStatus()%></th>
						</tr>
						<tr>
							<td colspan="6">
							<br>
							<textarea name="consultAnswer" style="resize:none;" required></textarea>
							<br><br>
							</td>
						</tr>
						
					</tbody>

					<tfoot>
						<tr>
							<td colspan="6">
								<button class="btn-red" style="height:25px; line-height:20px;">취소</button>
							</td>
							
						</tr>
					</tfoot>
				</form>
                
                <script>
	        		$(function(){
		        		$(".list-area>tbody>tr").click(function(){
		        			location.href = '<%=contextPath%>/detail.co?no=' + $(this).children().eq(0).text();
		        		})
		        	})
		        </script>
                
                <script>
                	$(function(){
                		$(".btn-red").click(function(){
                			location.href="<%=contextPath%>/admin.co";
                		})
                	})
                </script>
                

            </table>
            
        
            <br>
    
            <!--  
            <div class="paging-area" align="center">
    
                <button>&lt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
    
            </div>
            -->
            

            <br><br>
            <hr style="border:3px solid rgb(220,220,220);">
        
            <br><br>
            
        
            <br><br><br>
        
        </div>

    </div>
	
	
	
</body>
</html>

</body>
</html>