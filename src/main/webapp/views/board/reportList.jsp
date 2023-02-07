<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.odd.board.model.vo.Board, com.odd.board.model.service.*"%>

<%


	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");

	String keyword = (String)request.getAttribute("keyword");
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
  .membertable{
      height:1160px; width:900px;
      margin: auto;
      margin-top: 50px;
  }
  .usertable{
      border-collapse: collapse;
      width: 100%;
  }

  th,td{
      padding: 8px;
      text-align: center;
      border-bottom: 1px solid #DDD;
      font-size: 13px;
  }
        
    button{
            font-size: 12px;
            border:2px solid rgb(220,220,220);
            background:white;
            color:rgb(50, 50, 50);
            border-radius:5px;
        }
        
    #serch{
            margin-left: 20px;
            font-size: 13px;
            border:2px solid rgb(220,220,220);
            background:white;
            color:rgb(99, 99, 99);
            border-radius:5px;
      }
    .memberbutton{
        display: inline-block;
        width: 100%;
      }
    #btn{
            font-size: 12px;
            border:2px solid rgb(220,220,220);
            background:white;
            color:rgb(50, 50, 50);
            border-radius:5px;
        }
    .modal-body{
    margin: auto;
    width: 400px;
    height: 100%;
    padding: 40px;
    box-sizing: border-box;
    background-color: #cacaca;
    margin-top: 50px;
}
    #modal-body > input {
          width: 100%;
    height: 40px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-top: 5px;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #ffffff;
        }
</style>
</head>
<body>
	
    <div class="wrap">
 	    
 	      <%@ include file="../common/adminMenubarForInclude.jsp" %>
 	      
 	      
        <div id="content" align="center">
            <div class="membertable">
                <div class="memberbutton">
                <form name="search-form" action="<%=contextPath%>/search.rp" method="post"> 
                <input type="text" name="keyword" placeholder="아이디로 검색" id="serch" style="float: left;">
                    <button style="float: left;">조회하기</button>
                </form>
               </div>
            
              <table id="usertable" class="usertable" style="text-align: center;">
                <tr>
                  <th>번호</th>
                  <th>회원번호</th>
                  <th>게시글번호</th>
                  <th>신고내용</th>
                  <th>신고날짜</th>
                  <th>상태</th>
                  <th style="width: 200px;">관리</th>
                </tr>
            	<% if(list.isEmpty()) { %>
                <tr>
                <td clospan="7" style="margin:auto;">존재하는 신고 게시글이 없습니다.</td>
                </tr>
                <% }else { %>
                <% for(Board b : list){ %> 
                <tr>
                  <td onclick="location.href='<%= contextPath %>/detail.bo?no=<%=b.getPostNo()%>'"><%=b.getReportNo() %></td>
                  <td onclick="location.href='<%= contextPath %>/detail.bo?no=<%=b.getPostNo()%>'"><%=b.getUserNo()%></td>
                  <td onclick="location.href='<%= contextPath %>/detail.bo?no=<%=b.getPostNo()%>'"><%=b.getPostNo() %></td>
                  <td onclick="location.href='<%= contextPath %>/detail.bo?no=<%=b.getPostNo()%>'"><%=b.getReportContent() %></td>
                  <td onclick="location.href='<%= contextPath %>/detail.bo?no=<%=b.getPostNo()%>'"><%=b.getReportDate() %></td>
                  <td><%=b.getDone() %></td>
                  <td>
                    <button type="button" id="delete" onclick="location.href ='<%=contextPath%>/delete.rp?no=<%=b.getReportNo() %>&&pno=<%= b.getPostNo() %>'">블라인드</button>
                    <button type="button" id="delete" onclick="location.href ='<%=contextPath%>/expose.rp?no=<%=b.getReportNo() %>&&pno=<%= b.getPostNo() %>'">블라인드 취소</button>
                  </td>
                </tr>
                <%} %>
            <%} %>          
    
              </table>
              
              </div>  
                        
        </div>
        
        
</body>
</html>