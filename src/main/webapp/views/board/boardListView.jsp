<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Board" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> nList = (ArrayList<Board>)request.getAttribute("nList");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	String searchOption = (String)request.getAttribute("searchOption");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    #content{margin:auto; width:1200px;}

    /****** 사이드 ******/
    #side{
        /*border:1px solid blue;*/
        width:20%; height:100%;
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
    #board-area{
        /*border:1px solid blue;*/
        width:80%; height:100%;
        float:left;
    }
    .list-area{
        width:900px;
        margin:20px;
        font-size:13px;
        text-align:center;
    }
    .list-area th{
        border-bottom: 2px solid rgb(220, 220, 220);
    }
    .list-area th, .list-area td{
        border-top: 1px solid rgb(220, 220, 220);
        padding:5px; line-height:40px;
    }
    .list-area>tbody>tr:hover{background:rgb(220,220,220); cursor: pointer;}

    .paging-area button{
        border:none;
        background:none;
        color:rgb(50, 50, 50);
    }
    .paging-area button:hover{
        background:rgb(220,220,220);
        font-weight:700;
    }



    /****** footer ******/
    #footer{clear:both}
    #footer>div{float:left; height:100%; padding:20px;}
    #footer-1{width:60%;}
    #footer-2{width:40%;}
    #footer-2 a{
        line-height:35px;
        color:rgb(50, 50, 50);
        text-decoration:none;
        font-size: 13px;
        font-weight: 700;
    }

</style>

</head>
<body>

	<%@ include file="../common/userMenubar.jsp" %>

    <div id="content">
    
        <div id="side">
            <br><br><br><br><br>
            <p style="font-size:23px;">COMMUNITY</p>
            <hr>
            <a href="<%= contextPath %>/list.bo?cpage=1" style="font-size:17px; color:rgb(200, 140, 140);">자유게시판</a> <br><br>
            <a href="<%= contextPath %>/list.re?cpage=1" style="font-size:17px;">레시피게시판</a>
        </div>

        <script>
            $("#side a").hover(function(){
                $(this).css("color", "rgb(200, 140, 140)");
            }, function(){
                $(this).css("color", "rgb(50, 50, 50)");
            })
        </script>
    
        <div id="board-area" align="center">
    
            <div>
                <br><br><br><br><br><br><br>
                <h2 style="color:rgb(50, 50, 50); font-weight:600;">자유게시판</h2>
                <br>
            </div>
    
    		<% if(loginUser != null){ %>
            <div align="right" style="width:900px">
            	<br><br>
                <a href="<%= contextPath %>/enrollForm.bo"><button>글쓰기</button></a>
                <br>
            </div>
            <% } %>
    
            <table class="list-area">
                <thead>
                    <tr height="40">
                        <th width="50">번호</th>
                        <th width="500">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="50">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()){ %>
                    <!-- 작성 일반게시글 없을 경우 -->
                    	<% if(nList.isEmpty()){ %>
                    	<!-- 공지사항도 없을 경우 -->
                    		<tr>
                        		<td colspan="5" style="height:300px;"> 조회된 게시글이 없습니다.</td>
                    		</tr>
                    	<% } else { %>
                    		<% for(Board b : nList){ %>
                    			<tr>
                    				<input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>">
			                        <td style="color:rgb(200,140,140); font-weight:600;">공지</td>
			                        <td style="font-weight:600;"><%= b.getBoardTitle() %></td>
			                        <td>오도독</td>
			                        <td><%= b.getCreateDate() %></td>
			                        <td><%= b.getCount() %></td>
			                    </tr>
                    		<% } %>
                    	<% } %>
                    	
                    <% } else { %>
                    <!-- 작성된 일반게시글 있을 경우 -->
                    	<% if(nList.isEmpty()){ %>
                    	<!-- 공지사항은 없을 경우 -->
                    		<% for(Board b : list){ %>
                    			<tr>
                                    <input type="hidden" name="boardNo" value="<%= b.getBoardNo() %>">
			                        <td><%= b.getBoardNo() %></td>
			                        <td><%= b.getBoardTitle() %></td>
			                        <td><%= b.getBoardWriter() %></td>
			                        <td><%= b.getCreateDate() %></td>
			                        <td><%= b.getCount() %></td>
			                    </tr>
                    		<% } %>
                    	<% } else { %>
                    	<!-- 공지사항, 일반게시글 모두 있을 경우 -->
		                    <% for(Board b : nList){ %>
		                    	<tr>
                                        <input type="hidden" value="<%= b.getBoardNo() %>">
					                    <td style="color:rgb(200,140,140); font-weight:600;">공지</td>
					                    <td style="font-weight:600;"><%= b.getBoardTitle() %></td>
					                    <td>오도독</td>
					                    <td><%= b.getCreateDate() %></td>
					                    <td><%= b.getCount() %></td>
					                </tr>
		                    <% } %>
		                    <% for(Board b : list){ %>
		                    	<tr>
                                        <input type="hidden" value="<%= b.getBoardNo() %>">
					                    <td><%= b.getBoardNo() %></td>
					                    <td><%= b.getBoardTitle() %></td>
					                    <td><%= b.getBoardWriter() %></td>
					                    <td><%= b.getCreateDate() %></td>
					                    <td><%= b.getCount() %></td>
					                </tr>
	                    	<% } %>
                    	<% } %>
                    <% } %>
                </tbody>
            </table>
            
            <script>
	        	$(function(){
	        		$(".list-area>tbody>tr").click(function(){
                        //console.log($(this).children("input").val());
                        <% if(loginUser == null){ %>
                        	if($(this).children("td").eq(0).text() != "공지"){
                        		alert("로그인 후 이용 가능합니다.");
    	                        location.href = '<%= contextPath %>/loginform.me';
                        	} else {
                        		location.href = '<%= contextPath %>/detail.bo?no=' + $(this).children("input").val();
                        	}
                        <% } else { %>
	        				location.href = '<%= contextPath %>/detail.bo?no=' + $(this).children("input").val();
	        			<% } %>
                    })
	        	})
        	</script>
            
            <br><br>
            
        <div>
            <form action="<%= contextPath %>/search.bo" style="font-size:13px;" id="search-form">
                <input type="hidden" name="cpage" value="1">
                
                <select name="search" style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                    <option value="ti">제목</option>
                    <option value="ti-con">제목+내용</option>
                    <option value="wr">작성자</option>
                </select>
                
                <input type="text" name="keyword" style="width:400px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
               
                <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);" >
                	<img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:3px;">
                </button>
            </form>
        </div>
        
        <script>
	        
	        $(function(){
	        	//console.log($("#search-form :text").val());
	        	<% if(keyword == null){ %>
	        		$("#search-form :text").val("");
	        	<% } else { %>
	        		$("#search-form :text").val("<%= keyword %>");
	        	<% } %>
	        	
        		$("#search-form option").each(function(){
        			if($(this).val() == "<%= searchOption %>"){
        				$(this).attr("selected", true);
        			}
        		})
        	})
        	
        </script>
        
        <br><br><br>
        
        <div class="paging-area" align="center">
        
        	<% if(keyword == null){ %>
        	<!-- 검색어 없을 때 : 전체조회 -->
        		<!-- 페이지1일 때는 < 버튼 출력 X -->
	        	<% if(pi.getCurrentPage() != 1){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage()-1%>';">&lt;</button>
	        	<% } %>
	        	
	        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
	        		<button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=p%>';"><%= p %></button>
	        	<% } %>
	        	
	        	<!-- 마지막페이지일 때 -->
	        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage()+1%>'">&gt;</button>
	            <% } %>
            <% } else {%>
	        	<% if(pi.getCurrentPage() != 1){ %>
	        		<button onclick="location.href='<%=contextPath%>/search.bo?cpage=<%=pi.getCurrentPage()-1%>&search=<%= searchOption %>&keyword=<%= keyword %>';">&lt;</button>
	        	<% } %>
	        	
	        	<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
	        		<button onclick="location.href='<%=contextPath%>/search.bo?cpage=<%= p %>&search=<%= searchOption %>&keyword=<%= keyword %>';"><%= p %></button>
	        	<% } %>
	        	
	        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<button onclick="location.href='<%=contextPath%>/search.bo?cpage=<%=pi.getCurrentPage()+1%>&search=<%= searchOption %>&keyword=<%= keyword %>';">&gt;</button>
	            <% } %>
            <% } %>
            
        </div>
        
        <script>
        	
        </script>
        
        
        
        <br><br><br><br><br><br><br>
        
        </div>


        <div id="footer" style="height:200px; background:rgb(220, 220, 220);">
     
            <div id="footer-1">
                <p style="font-size:12px;">
                    COMPANY : (주)오도독 CEO : 강보람 PHONE : 031-1234-5678 / FAX : 02-1234-9999 <br>
                    BUSINESS LICENCE : [828-88-01900] E-COMMERCE PERMINT 2020-성남중원-0191 <br>
                    ADDRESS : 13201 경기도 성남시 중원구 갈마치로288번길 14 (상대원동) SK V1타워101호
                </p>
                <br><br>
                <p style="font-size:12px; font-weight:700;">Copyright(C) 2023 (주)오도독 ALL RIGHTS REVERVED</p>
            </div>
            <div id="footer-2">
                <a href="">회사소개</a> <br>
                <a href="">개인정보처리방침</a> <br>
                <a href="">이용약관</a> <br>
                <a href="">이용안내</a> <br>
            </div>
    
        </div>
    
    </div>

</body>
</html>