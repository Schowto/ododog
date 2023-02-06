<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Board, com.odd.board.model.vo.Reply" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo replyPi = (PageInfo)request.getAttribute("replyPi");
	ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList");
	String bSort = (String)request.getAttribute("bSort");
	String rSort = (String)request.getAttribute("rSort");
	String bKeyword = (String)request.getAttribute("bKeyword");
	String rKeyword = (String)request.getAttribute("rKeyword");
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
	
    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
        background:rgb(220,220,220);
        font-weight:700;
    }

</style>

</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
            <br>
            <div align="left">
                <p>일반 게시글 관리</p>
            </div>
            <hr>

            <div align="right" style="margin:15px 0px;">
                <form action="<%= contextPath %>/search.adBo" style="font-size:13px;">
                	<input type="hidden" name="bpage" value="1">
                	<input type="hidden" name="rpage" value="<%= replyPi.getCurrentPage() %>">
                    <select name="bSort" id="bSort" style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                    </select>
                	
                    <input type="text" name="bKeyword" id="bKeyword" value="<%= bKeyword %>"
                        style="width:200px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                
                    <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);">
                        <img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:3px;">
                    </button>
                
                </form>
            </div>

            <table class="list-area">
                <thead>
                    <tr>
                        <th width="40">번호</th>
                        <th width="470">제목</th>
                        <th width="80">작성자</th>
                        <th width="80">작성일</th>
                        <th width="70">조회수</th>
                        <th width="60">상태</th>
                        <th width="50"></th>
                    </tr>
                </thead>
               	<% if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="6" style="height:300px;"> 조회된 게시글이 없습니다.</td>
                    </tr>
               	<% } else { %>
               		<% for(Board b : list){ %>
               			<tr>
                        <td><%= b.getBoardNo() %></td>
                        <td><%= b.getBoardTitle() %></td>
                        <td><%= b.getBoardWriter() %></td>
                        <td><%= b.getCreateDate() %></td>
                        <td><%= b.getCount() %></td>
                        <td align="center" id="board-status-area">
                        	<% if(b.getStatus().equals("Y")){ %>
                        		<button class="status-y">Y</button>
                        	<% } else { %>
                        		<button class="status-n">N</button>
                        	<% } %>
                        </td>
                        <td>
                            <button class="btn-red" id="board-delete-area" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
               		<% } %>
               	<% } %>
            </table>
            
            <script>
            	$("#board-status-area button").click(function(){
            		const a = $(this);
           			// 상태가 Y일때 -> N 으로 || N일때 -> Y로
           			if(confirm("게시글의 상태를 변경하시겠습니까?")){
	           			$.ajax({
	           				url:"<%=contextPath%>/status.adBo",
	           				data:{
	           					from:"board",
	           					no:$(this).parent().prev().prev().prev().prev().prev().text(),
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
	           				}
	           			})
           			}
            	})
            	$("#board-delete-area").click(function(){
            		const a = $(this);
           			// 게시글 완전 삭제
           			if(confirm("게시글을 완전히 삭제하시겠습니까? \n삭제 후 취소할 수 없습니다.")){
	           			$.ajax({
	           				url:"<%=contextPath%>/delete.adBo",
	           				data:{
	           					from:"board",
	           					no:$(this).parent().prev().prev().prev().prev().prev().text(),
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
	           				}
	           			})
           			}
            	})
            </script>
            
            <br>
            <div class="paging-area" align="center">
            
	            <% if (bKeyword == null){ %>
            	<!-- 검색 안돼있을 때 -->
		        	<% if(pi.getCurrentPage() != 1){ %>
		        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()-1%>&rpage=<%=replyPi.getCurrentPage()%>';">&lt;</button>
		        	<% } %>
		        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
		        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=p%>&rpage=<%=replyPi.getCurrentPage()%>';"><%= p %></button>
		        	<% } %>
		        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
		            	<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()+1%>&rpage=<%=replyPi.getCurrentPage()%>'">&gt;</button>
		            <% } %>
	           	<% } else { %>
	           		<% if(rKeyword == null){ %>
	           		<!-- 댓글 검색이 안돼있을 때 -->
		           		<% if(pi.getCurrentPage() != 1){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()-1%>&rpage=<%=replyPi.getCurrentPage()%>&bSort=<%=bSort%>&bKeyword=<%=bKeyword%>';">&lt;</button>
			        	<% } %>
			        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=p%>&rpage=<%=replyPi.getCurrentPage()%>&bSort=<%=bSort%>&bKeyword=<%=bKeyword%>';"><%= p %></button>
			        	<% } %>
			        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
			            	<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()+1%>&rpage=<%=replyPi.getCurrentPage()%>&bSort=<%=bSort%>&bKeyword=<%=bKeyword%>'">&gt;</button>
			            <% } %>
	           		<% } else { %>
	           			<% if(pi.getCurrentPage() != 1){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()-1%>&rpage=<%=replyPi.getCurrentPage()%>&bSort=<%=bSort%>&bKeyword=<%=bKeyword%>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>';">&lt;</button>
			        	<% } %>
			        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=p%>&rpage=<%=replyPi.getCurrentPage()%>&bSort=<%=bSort%>&bKeyword=<%=bKeyword%>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>';"><%= p %></button>
			        	<% } %>
			        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
			            	<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()+1%>&rpage=<%=replyPi.getCurrentPage()%>&bSort=<%=bSort%>&bKeyword=<%=bKeyword%>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>'">&gt;</button>
			            <% } %>
	           		<% } %>
	           	<% } %>
	           	
            </div>

            <br><br>
            <hr style="border:3px solid rgb(220,220,220);">
        
            <br><br>
            <div align="left">
                <p>댓글 관리</p>
            </div>
            <hr>
            
            <div align="right" style="margin:15px 0px;">
                <form action="<%= contextPath %>/search.adBo" style="font-size:13px;">
            		<input type="hidden" name="rpage" value="1">
            		<input type="hidden" name="bpage" value="<%= pi.getCurrentPage() %>">
                    <select name="rSort" id="rSort" style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                        <option value="content">댓글내용</option>
                        <option value="writer">작성자</option>
                    </select>
            
                    <input type="text" name="rKeyword" id="rKeyword" value="<%= rKeyword %>"
                        style="width:200px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                        
                    <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);">
                        <img src="<%= contextPath %>/resources/icons/search.png" width="12px"
                            style="opacity:0.5; margin-bottom:3px;">
                    </button>
                </form>
            </div>
            <script>
            	$(function(){
                	// 검색창 ""으로
					<% if(bKeyword == null){ %>
						$("#bKeyword").val("");
		        	<% } %>
					<% if(rKeyword == null){ %>
						$("#rKeyword").val("");
		        	<% } %>
        		})
        		// 정렬옵션 유지
	        	$("#bSort option").each(function(){
        			if($(this).val() == "<%= bSort %>"){
        				$(this).attr("selected", true);
        			}
        		})
	        	$("#rSort option").each(function(){
        			if($(this).val() == "<%= rSort %>"){
        				$(this).attr("selected", true);
        			}
        		})
            </script>
            
            <table class="list-area">
                <thead>
                    <tr>
                        <th width="40">번호</th>
                        <th width="500">댓글내용</th>
                        <th width="80">작성자</th>
                        <th width="80">작성일</th>
                        <th width="40">글번호</th>
                        <th width="60">상태</th>
                        <th width="50"></th>
                    </tr>
                </thead>
               	<% if(replyList.isEmpty()){ %>
                    <tr>
                        <td colspan="6" style="height:300px;">조회된 댓글이 없습니다.</td>
                    </tr>
               	<% } else { %>
               		<% for(Reply r : replyList){ %>
	                    <tr>
	                        <td><%= r.getReplyNo() %></td>
	                        <td><%= r.getReplyContent() %></td>
	                        <td><%= r.getReplyWriter() %></td>
	                        <td><%= r.getCreateDate() %></td>
	                        <td><%= r.getBoardNo() %></td>
	                        <td align="center" id="reply-status-area">
	                        	<% if(r.getStatus().equals("Y")){ %>
	                        		<button class="status-y">Y</button>
	                        	<% } else { %>
	                        		<button class="status-n">N</button>
                       			<% } %>
	                        </td>
	                        <td>
	                            <button class="btn-red" id="reply-delete-area" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
	                        </td>
	                    </tr>
               		<% } %>
               	<% } %>
            </table>
            
            <script>
	            $("#reply-status-area button").click(function(){
	        		const a = $(this);
	       			// 상태가 Y일때 -> N 으로 || N일때 -> Y로
	       			if(confirm("댓글의 상태를 변경하시겠습니까?")){
	           			$.ajax({
	           				url:"<%=contextPath%>/status.adBo",
	           				data:{
	           					from:"reply",
	           					no:$(this).parent().prev().prev().prev().prev().prev().text(),
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
	           				}
	           			})
	       			}
	        	})
	        	$("#reply-delete-area").click(function(){
	        		const a = $(this);
	       			// 댓글 완전 삭제
	       			if(confirm("댓글을 완전히 삭제하시겠습니까? \n삭제 후 취소할 수 없습니다.")){
	           			$.ajax({
	           				url:"<%=contextPath%>/delete.adBo",
	           				data:{
	           					from:"board",
	           					no:$(this).parent().prev().prev().prev().prev().prev().text(),
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
	           				}
	           			})
	       			}
	        	})
            </script>
            
            <br>
            <div class="paging-area" align="center">
            	<% if (rKeyword == null){ %>
            	<!-- 검색 안돼있을 때 -->
		        	<% if(replyPi.getCurrentPage() != 1){ %>
		        		<button onclick="location.href='<%=contextPath%>/list.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()-1%>';">&lt;</button>
		        	<% } %>
		        	<% for(int p = replyPi.getStartPage(); p <= replyPi.getEndPage(); p++){ %>
		        		<button onclick="location.href='<%=contextPath%>/list.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=p%>';"><%= p %></button>
		        	<% } %>
		        	<% if(replyPi.getCurrentPage() != replyPi.getMaxPage()){ %>
		            	<button onclick="location.href='<%=contextPath%>/list.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()+1%>'">&gt;</button>
		            <% } %>
		            
	           	<% } else { %>
	           		<% if(bKeyword == null){ %>
	           		<!-- 게시판 검색 안돼있을 때 -->
		           		<% if(replyPi.getCurrentPage() != 1){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()-1%>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>';">&lt;</button>
			        	<% } %>
			        	<% for(int p = replyPi.getStartPage(); p <= replyPi.getEndPage(); p++){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=p%>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>';"><%= p %></button>
			        	<% } %>
			        	<% if(replyPi.getCurrentPage() != replyPi.getMaxPage()){ %>
			            	<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()+1%>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>'">&gt;</button>
			            <% } %>
		            <% } else { %>
			            <% if(replyPi.getCurrentPage() != 1){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()-1%>&bSort=<%= bSort %>&bKeyword=<%= bKeyword %>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>';">&lt;</button>
			        	<% } %>
			        	<% for(int p = replyPi.getStartPage(); p <= replyPi.getEndPage(); p++){ %>
			        		<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=p%>&bSort=<%= bSort %>&bKeyword=<%= bKeyword %>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>';"><%= p %></button>
			        	<% } %>
			        	<% if(replyPi.getCurrentPage() != replyPi.getMaxPage()){ %>
			            	<button onclick="location.href='<%=contextPath%>/search.adBo?bpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()+1%>&bSort=<%= bSort %>&bKeyword=<%= bKeyword %>&rSort=<%=rSort%>&rKeyword=<%=rKeyword%>'">&gt;</button>
			            <% } %>
		            <% } %>
		            
	           	<% } %>
            </div>
            <br><br><br>
        
        </div>

    </div>
	
	
	
</body>
</html>