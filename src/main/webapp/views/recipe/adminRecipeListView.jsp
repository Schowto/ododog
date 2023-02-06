<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.recipe.model.vo.Recipe, com.odd.board.model.vo.Reply" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
	PageInfo replyPi = (PageInfo)request.getAttribute("replyPi");
	ArrayList<Reply> replyList = (ArrayList<Reply>)request.getAttribute("replyList");
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

    /* 정렬순서 */
    .sort-filter{
        list-style-type:none;
        padding:0;
        margin:0;
        width:100%;
        height:100%;
    }
    .sort-filter>li{
        border:1px solid rgb(220, 220, 220);
        border-radius: 5px;
        margin-top:20px;
        float:right;
        width:50px;
        cursor:pointer;
    }

    .sort-filter{overflow:hidden}
    .selected{
        background:rgb(220,220,220);
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
                    <p>레시피 관리</p>
                </div>
                <hr>

                <div align="left" style="width:200px; float:left;">
                    <button style="width:100px; height:30px; margin:15px 20px 10px;" onclick="location.href='<%= contextPath %>/enrollForm.re'">레시피 작성</button>
                </div>
    
                <ul class="sort-filter" style="width:700px; font-size:13px;">
                    <li class>댓글순</li>
                    <li class>하트순</li>
                    <li class="selected">최신순</li>
                </ul>
                
                <script>
                    $(".sort-filter>li").click(function () {
                        //console.log($(this).text());
                        $(this).addClass('selected');
                        $(this).siblings().removeClass('selected');
                    })
                </script>
    
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
                	<% for(Recipe r : list){ %>
	                    <tr>
	                        <td><%= r.getRecipeNo() %></td>
	                        <td><%= r.getRecipeTitle() %></td>
	                        <td><%= r.getCreateDate() %></td>
	                        <td><%= r.getCount() %></td>
	                        <td align="center" class="recipe-status-area">
	                        	<% if(r.getStatus().equals("Y")){ %>
	                        		<button class="status-y">Y</button>
	                        	<% } else { %>
	                        		<button class="status-n">N</button>
	                        	<% } %>
	                        </td>
	                        <td>
	                            <button class="btn-red recipe-delete-area"style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
	                        </td>
	                    </tr>
                	<% } %>
                <% } %>
            </table>
            <script>
            	$(".recipe-status-area button").click(function(){
            		const a = $(this);
           			// 상태가 Y일때 -> N 으로 || N일때 -> Y로
           			if(confirm("게시글의 상태를 변경하시겠습니까?")){
	           			$.ajax({
	           				url:"<%=contextPath%>/status.adRe",
	           				data:{
	           					from:"recipe",
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
            	$(".recipe-delete-area").click(function(){
            		const a = $(this);
           			// 게시글 완전 삭제
           			if(confirm("게시글을 완전히 삭제하시겠습니까? \n삭제 후 취소할 수 없습니다.")){
	           			$.ajax({
	           				url:"<%=contextPath%>/delete.adRe",
	           				data:{
	           					from:"recipe",
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
		        		<button onclick="location.href='<%=contextPath%>/list.adRe?cpage=<%=pi.getCurrentPage()-1%>&rpage=<%=replyPi.getCurrentPage()%>';">&lt;</button>
		        	<% } %>
		        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
		        		<button onclick="location.href='<%=contextPath%>/list.adRe?cpage=<%=p%>&rpage=<%=replyPi.getCurrentPage()%>';"><%= p %></button>
		        	<% } %>
		        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
		            	<button onclick="location.href='<%=contextPath%>/list.adRe?cpage=<%=pi.getCurrentPage()+1%>&rpage=<%=replyPi.getCurrentPage()%>'">&gt;</button>
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
                    <form action="" style="font-size:13px;">
    
                        <select name="search-order"
                            style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                            <option value="title">댓글내용</option>
                            <option value="writer">작성자</option>
                        </select>
    
                        <input type="text" name=""
                            style="width:200px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
    
                        <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);">
                            <img src="<%= contextPath %>/resources/icons/search.png" width="12px"
                                style="opacity:0.5; margin-bottom:3px;">
                        </button>
    
                    </form>
                </div>
    
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
	                        <td align="center" class="reply-status-area">
	                        	<% if(r.getStatus().equals("Y")){ %>
	                        		<button class="status-y">Y</button>
	                        	<% } else { %>
	                        		<button class="status-n">N</button>
                       			<% } %>
	                        </td>
	                        <td>
	                            <button class="btn-red reply-delete-area" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
	                        </td>
	                    </tr>
               		<% } %>
               	<% } %>
            </table>
            <script>
	            $(".reply-status-area button").click(function(){
	        		const a = $(this);
	       			// 상태가 Y일때 -> N 으로 || N일때 -> Y로
	       			if(confirm("댓글의 상태를 변경하시겠습니까?")){
	           			$.ajax({
	           				url:"<%=contextPath%>/status.adRe",
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
	        	$(".reply-delete-area").click(function(){
	        		const a = $(this);
	       			// 댓글 완전 삭제
	       			if(confirm("댓글을 완전히 삭제하시겠습니까? \n삭제 후 취소할 수 없습니다.")){
	           			$.ajax({
	           				url:"<%=contextPath%>/delete.adRe",
	           				data:{
	           					from:"reply",
	           					no:$(this).parent().prev().prev().prev().prev().prev().prev().text()
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
		        <% if(replyPi.getCurrentPage() != 1){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.adRe?cpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()-1%>';">&lt;</button>
	        	<% } %>
	        	<% for(int p = replyPi.getStartPage(); p <= replyPi.getEndPage(); p++){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.adRe?cpage=<%=pi.getCurrentPage()%>&rpage=<%=p%>';"><%= p %></button>
	        	<% } %>
	        	<% if(replyPi.getCurrentPage() != replyPi.getMaxPage()){ %>
	            	<button onclick="location.href='<%=contextPath%>/list.adRe?cpage=<%=pi.getCurrentPage()%>&rpage=<%=replyPi.getCurrentPage()+1%>'">&gt;</button>
	            <% } %>
		    </div>
		    <br><br><br>
		</div>
    
    </div>

</body>
</html>