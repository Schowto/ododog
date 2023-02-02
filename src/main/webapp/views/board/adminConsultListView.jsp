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

</style>

</head>
<body>
    
    <div class="wrap">
        <%@ include file="../common/adminMenubarForInclude.jsp" %>

        <div id="content" align="center">
        
            <br>
            <div align="left">
                <p>맞춤상담 관리</p>
            </div>
            <hr>

            <div align="right" style="margin:15px 0px;">
                <form action="" style="font-size:13px;">
                
                    <select name="search-order" style="height:25px; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                    </select>
                
                    <input type="text" name=""
                        style="width:200px; height:25px; border-right:none; border:1px solid rgb(220, 220, 220); border-radius:5px;">
                
                    <button type="submit" style="height:25px; width:40px; border:1px solid rgb(220,220,220);">
                        <img src="<%= contextPath %>/resources/icons/search.png" width="12px" style="opacity:0.5; margin-bottom:3px;">
                    </button>
                
                </form>
            </div>

            <table class="list-area">
                <thead>
                    <tr>
                        <th width="60"></th>
                        <th width="40">글번호</th>
                        <th width="500">작성자</th>
                        <th width="100">제목</th>
                        <th width="100">작성일</th>
                        <th width="50">답변여부</th>
                    </tr>
                </thead>
                <tbody>
                    <%if(list.isEmpty()){%>
		                    <tr>
		                        <td colspan="6" style="height:300px;"> 조회된 게시글이 없습니다.</td>
		                    </tr>
                    <%}else{%>
                    	<%for(Consult c : list){ %>
		                    <tr>
		                        <td><input type="checkbox"></td>
		                        <td><%=c.getConsultNo() %></td>
		                        <td><%=c.getUserId() %></td>
		                        <td><%=c.getConsultTitle() %></td>
		                        <td><%=c.getEnrollDate() %></td>
		                        <td><%=c.getAnswerStatus() %></td>
		                    </tr>
		                <%} %>
                    <%} %>
                </tbody>

                <tfoot>
                    <tr>
                        <td>
                        	<button class="btn-red" style="height:25px; line-height:20px;">삭제</button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                </tfoot>
                
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
                			location.href="<%=contextPath%>/delete.co?no=<%=c.getConsultNo()%>";
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