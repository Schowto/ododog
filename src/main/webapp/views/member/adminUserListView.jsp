<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.odd.member.model.vo.Member, com.odd.member.model.service.*" %>    
<%
	
		MemberService ms = new MemberService();

	ArrayList<Member> list = ms.selectMemberList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .wrap {
            /* 전체 -> ????? 세로 사이즈는 여기서 조정 ,,????? */
            /*border:1px solid blue;*/
            width: 1200px; height: 700px;
            margin: auto;
            background: rgb(220, 220, 220);
        }

    .wrap>div {float: left;}

    div {/*border:1px solid red;*/ box-sizing: border-box;}

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
      
                    <button style="float: right;">회원조회</button> 
                    <button style="float: right;">회원수정</button> 
                    <button style="float: right;">회원삭제</button>
                </div>
             
              <table class="usertable" style="text-align: center;">
                <tr>
                  <th><input type="checkbox"></th>
                  <th>회원번호</th>
                  <th>이름</th>
                  <th>아이디</th>
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
                  <td><input type="checkbox"></td>
                  <td><%= m.getUser_No() %></td>
                  <td><%= m.getUser_Name() %></td>
                  <td><%= m.getUser_Id() %></td>
                  <td><%= m.getEmail() %></td>
                  <td><%= m.getPhone() %></td>
                  <td><%= m.getAddress() %></td>
                  <td><%= m.getPoint() %></td>
                </tr>
                <%} %>
            <%} %>
              </table>
              </div>
        </div>
</body>
</html>