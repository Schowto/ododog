<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Board, com.odd.board.model.vo.Reply" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    /******** 내용 *******/
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
    
    .status-n{
    	width:30px;	height:23px;
    	border:2px solid rgb(220,220,220);
    	border-radius:5px;
    	vertical-align:middle;
    	line-height:15px;
    }
	.status-n:hover{
		background:rgb(220,220,220);
	}
	.status-y{
		width:30px; height:23px;
		border-radius:5px;
		vertical-align:middle;
		line-height:15px;
		background:rgb(220,220,220);
	}
	.status-y:hover{
		border:2px solid rgb(200,200,200);
		background:rgb(200,200,200);
	}


</style>
</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
            <br>
            <div align="left">
                <p>공지사항 관리</p>
            </div>
            <hr>

            <div align="right" style="margin:15px 0px;">
                <button style="height:30px;" onclick="location.href='<%=contextPath%>/enrollForm.adNo'">공지사항 작성</button>
            </div>
            
            <table class="list-area">
                <thead>
                    <tr>
                        <th width="40">번호</th>
                        <th width="550">제목</th>
                        <th width="80">작성일</th>
                        <th width="70">조회수</th>
                        <th width="60">상태</th>
                        <th width="50"></th>
                    </tr>
                </thead>
                <% if(list.size()==0){ %>
                    <tr>
                        <td colspan="6" style="height:300px;"> 조회된 게시글이 없습니다.</td>
                    </tr>
                <% } else { %>
                	<% for(Board b : list){ %>
	                    <tr>
	                        <td><%= b.getBoardNo() %></td>
	                        <td><%= b.getBoardTitle() %></td>
	                        <td><%= b.getCreateDate() %></td>
	                        <td><%= b.getCount() %></td>
	                        <td align="center" class="notice-status-area">
	                        	<% if(b.getStatus().equals("Y")){ %>
	                        		<button class="status-y">Y</button>
	                        	<% } else { %>
	                        		<button class="status-n">N</button>
	                        	<% } %>
	                        </td>
	                        <td>
	                            <button class="btn-red notice-delete-area"style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
	                        </td>
	                    </tr>
                	<% } %>
                <% } %>
            </table>
            <script>
            	$(".notice-status-area button").click(function(){
            		const a = $(this);
           			// 상태가 Y일때 -> N 으로 || N일때 -> Y로
           			if(confirm("게시글의 상태를 변경하시겠습니까?")){
	           			$.ajax({
	           				url:"<%=contextPath%>/status.adBo",
	           				data:{
	           					from:"notice",
	           					no:$(this).parent().prev().prev().prev().prev().text(),
	           					status:$(this).text()
	           					},
	           				success:function(result){
	           					if(result > 0){
	           						if(a.text() == "Y"){
	           							a.attr("class", "status-n");
	           							a.text("N");
	           						} else {
	           							a.attr("class", "status-y");
	           							a.text("Y");
	           						}
	           					} else {
	           						alert("상태 변경 실패");
	           					}
	           				}, error:function(){
	           					console.log("상태 변경용 ajax 통신 실패");
	           				}
	           			})
           			}
            	})
            	$(".notice-delete-area").click(function(){
            		const a = $(this);
           			// 게시글 완전 삭제
           			if(confirm("게시글을 완전히 삭제하시겠습니까? \n삭제 후 취소할 수 없습니다.")){
	           			$.ajax({
	           				url:"<%=contextPath%>/delete.adBo",
	           				data:{
	           					from:"notice",
	           					no:$(this).parent().prev().prev().prev().prev().prev().text()
	           					},
	           				success:function(result){
	           					if(result > 0){
	           						alert("성공적으로 삭제되었습니다.");
	           					} else {
	           						alert("삭제 실패");
	           					}
	           					location.reload();
	           				}, error:function(){
	           					console.log("삭제용 ajax 통신 실패");
	           				}
	           			})
           			}
            	})
            </script>
            
        
            <br>
            <div class="paging-area" align="center">
    
                <% if(pi.getCurrentPage() != 1){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.adNo?cpage=<%=pi.getCurrentPage()%>';">&lt;</button>
	        	<% } %>
	        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.adNo?cpage=<%=pi.getCurrentPage()%>';"><%= p %></button>
	        	<% } %>
	        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<button onclick="location.href='<%=contextPath%>/list.adNo?cpage=<%=pi.getCurrentPage()%>'">&gt;</button>
		        <% } %>
    
            </div>
        </div>

    </div>
	
	
	
</body>
</html>