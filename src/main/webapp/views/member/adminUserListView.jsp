<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.odd.member.model.vo.Member, com.odd.member.model.vo.Admin, com.odd.member.model.service.*"%>

<%
	MemberService ms = new MemberService();

	ArrayList<Member> list = ms.selectMemberList();

	
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
                    <input type="text" value="아이디로 회원검색" id="serch" style="float: left;">
                    <button style="float: left;">조회하기</button>
      
                    <button style="float: right;">회원삭제</button> 

               <button style="float: right;" onclick="location.href='<%=contextPath%>/list.ad">전체조회</button>
               </div>
             
              <table class="usertable" style="text-align: center;">
                <tr>
                  <th></th>
                  <th>회원번호</th>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>전화번호</th>
                  <th>주소</th>
                  <th>적립금</th>
                </tr>
                <% if(list.isEmpty()) { %>
                <tr>
                <td clospan="8">존재하는 회원이 없습니다.</td>
                </tr>
                <% }else { %>
                <% for(Member m : list){ %> 
                <tr>
                  <td><input type="checkbox" value=<%= m.getUser_No() %>></td>
                  <td><%= m.getUser_No() %></td>
                  <td><%= m.getUser_Id() %></td>
                  <td><%= m.getUser_Name() %></td>
                  <td><%= m.getEmail() %></td>
                  <td><%= m.getPhone() %></td>
                  <td><%= m.getPost_Code()%> / <%= m.getAddress() %> / <%=m.getDetailed_Address() %></td>
                  <td><%= m.getPoint() %></td>
                </tr>
                <%} %>
            <%} %>
              </table>
              </div>            
        </div>

</body>
</html>