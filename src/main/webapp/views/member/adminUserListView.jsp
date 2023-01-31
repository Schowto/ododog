<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.odd.member.model.vo.Member, com.odd.member.model.service.*"%>

<%
	MemberService ms = new MemberService();

	ArrayList<Member> list = ms.selectMemberList();

	Member loginUser = (Member)session.getAttribute("loginUser");

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
 	      
 	      <%
		        String userId = loginUser.getUser_Id();
		        String userPassword = loginUser.getUser_Pwd();
		        String userName = loginUser.getUser_Name();
		        String email = loginUser.getEmail();
		        String phone = loginUser.getPhone();
		        int postCode = loginUser.getPost_Code();
		        String address = loginUser.getAddress();
		        String Detailed_Address = loginUser.getDetailed_Address();
    		%>

        <div id="content" align="center">
            <div class="membertable">
                <div class="memberbutton">
                    <input type="text" value="아이디로 회원검색" id="serch" style="float: left;">
                    <button style="float: left;">조회하기</button>
      
                    <button style="float: right;">회원삭제</button> 
                    
        <!--모달-->

<!-- Modal -->
<div class="container">
<form action="<%=contextPath %>/update.ad" method="post" id="modal-body">
  <!-- Button to Open the Modal -->
  <button type="button" id="btn" class="btn" data-toggle="modal" data-target="#myModal" style="float: right; height: 25px; font-size: 13px; display: flex; align-items:center;">
    회원수정
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원정보수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style="text-align: left;">

          <label>아이디</label> <br><br>
          <label>이름 <%=userId%></label> 
          <input type="text" name="userName" value="<%=userName%>"> <br>

          <label>이메일</label> 
          <input type="email" name="email" value="<%=email%>"> <br>

          <label>전화번호</label> 
          <input type="tel" name="phone" value="<%=phone %>"> <br>

          <label>주소</label> 
          <input type="text" name="post_Code" value="<%=postCode%>"> <br>
          <input type="text" name="address" value="<%=address%>"> <br>
          <input type="text" name="Detailed_Address" value="<%=Detailed_Address%>"> <br>
        </div>
        <br><br>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-secondary" data-dismiss="modal">수정</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="history.back();">취소</button>
        </div>
        
      </div>
    </div>
    </div>
  
</form>  
  </div>  
               
               <!-- 리스트 -->
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