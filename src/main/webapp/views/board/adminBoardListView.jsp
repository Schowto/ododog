<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Board" %>
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
                <form action="" style="font-size:13px;">
                    <select name="search-order" style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                    </select>
                
                    <input type="text" name="keyword"
                        style="width:200px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                
                    <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);">
                        <img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:3px;">
                    </button>
                
                </form>
            </div>

            <table class="list-area">
                <thead>
                    <tr>
                        <th width="40">글번호</th>
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
                        <td align="center">
                        	<% if(b.getStatus().equals("Y")){ %>
                        	<button class="status-y">Y</button>
                        	<% } else { %>
                        		<button class="status-n">N</button>
                        	<% } %>
                        </td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
               		<% } %>
               	<% } %>
                
            </table>
            <br>
            <div class="paging-area" align="center">
    
                <button>&lt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
    
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
            
                    <select name="search-order" style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
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
                        <th width="80">작성자</th>
                        <th width="40">글번호</th>
                        <th width="190">글제목</th>
                        <th width="350">댓글내용</th>
                        <th width="80">작성일</th>
                        <th width="60">상태</th>
                        <th width="50"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6" style="height:300px;"> 조회된 댓글이 없습니다.</td>
                    </tr>
            
                    <tr>
                        <td>user01</td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>어쩌꾸저쩌구우우ㅜ구구구구구구구구ㅜ</td>
                        <td>2023-01-27</td>
                        <td align="center">
                        	<button class="status-y">Y</button>
                        </td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>user01</td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>어쩌꾸저쩌구우우ㅜ구구구구구구구구ㅜ</td>
                        <td>2023-01-27</td>
                        <td align="center">
                        	<button class="status-y">Y</button>
                        </td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>user01</td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>어쩌꾸저쩌구우우ㅜ구구구구구구구구ㅜ</td>
                        <td>2023-01-27</td>
                        <td align="center">
                        	<button class="status-y">Y</button>
                        </td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>user01</td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>어쩌꾸저쩌구우우ㅜ구구구구구구구구ㅜ</td>
                        <td>2023-01-27</td>
                        <td align="center">
                        	<button class="status-y">Y</button>
                        </td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td>user01</td>
                        <td>1</td>
                        <td>공지사항제목입니당</td>
                        <td>어쩌꾸저쩌구우우ㅜ구구구구구구구구ㅜ</td>
                        <td>2023-01-27</td>
                        <td align="center">
                        	<button class="status-y">Y</button>
                        </td>
                        <td>
                            <button class="btn-red" style="height:25px; vertical-align:middle; line-height:20px;">삭제</button>
                        </td>
                    </tr>
                </tbody>
            
                <tfoot>
                    <tr>
                        <td>
                            <button class="btn-red" style="height:25px; line-height:20px;">삭제</button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                </tfoot>
            
            
            </table>
            
            
            <br>
            
            <div class="paging-area" align="center">
            
                <button>&lt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&gt;</button>
            
            </div>
        
            <br><br><br>
        
        </div>

    </div>
	
	
	
</body>
</html>