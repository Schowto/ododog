<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.odd.member.model.vo.Member, com.odd.member.model.vo.Admin, com.odd.member.model.service.*
    , com.odd.member.model.vo.Point"%>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.Consult "%>
<%
	
	//PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<Consult> list = (ArrayList<Consult>) request.getAttribute("list");
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

    tr:hover {background-color: #D6EEEE;}
        
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
                <form name="search-form"> 
                <input type="text" placeholder="아이디로 회원검색" id="serch" style="float: left;">
                    <button style="float: left;" onclick="serch();">조회하기</button>
                </form>

      				
					
               <button style="float: right;" onclick="location.href='<%=contextPath%>/list.ad">전체조회</button>
               </div>
            
              <table id="usertable" class="usertable" style="text-align: center;">
                <thead>
	                <tr>
	                  <th>번호</th>
	                  <th>제목</th>
	                  <th>카테고리</th>
	                  <th>작성일</th>
	                  <th>답변여부</th>
	                  <th>관리</th>
	                </tr>
                </thead>
                <tbody>
	            	<% if(list.isEmpty()) { %>
	                <tr>
	                <td clospan="5">존재하는 회원이 없습니다.</td>
	                </tr>
	                <% }else { %>
	                <% for(Consult c : list){ %> 
	                <tr>
	                  <td><%=c.getConsultNo()%></td>
	                  <td><%=c.getConsultTitle()%></td>
	                  <td><%=c.getConsultCategory()%></td>
	                  <td><%=c.getEnrollDate()%></td>
	                  <td><%=c.getAnswerStatus()%></td>
	                  <td>
	                  <a id="point" data-toggle="modal"  data-target="#myModal" value="" onclick="selectPointList(<%= c.getConsultNo() %>);"></a>
	                  </td>
	                  
	                  <td><button type="button" id="delete" style="float: right;" onclick="location.href ='<%=contextPath%>/delete.co?no=<%=c.getConsultNo()%>'">게시물삭제</button> </td>
	                </tr>
	                <%} %>
	            <%} %>          
    			</tbody>
              </table>
              </div>            
        </div>
        
        

        
     	

</body>
</html>