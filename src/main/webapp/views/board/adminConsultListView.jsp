<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, com.odd.common.model.vo.PageInfo, com.odd.board.model.vo.*, com.odd.member.model.vo.* "%>
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
  .searchTable{
    width:80%;
    height: 50px;
    
  }
  .searchTable ::placeholder{
        font-size:14px;
       
    }
  #userTable{
    width:80%;
  }
  th,td{
      padding: 8px;
      text-align: center;
      border-bottom: 1px solid #DDD;
      font-size: 13px;
  }

    tbody>tr:hover {
        background-color: #D6EEEE;
        opacity: 0.7;
        cursor: pointer;
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
   .searchTable>input {   
            font-size: 13px;
            border: 2px solid rgb(220, 220, 220);
            background: white;
            color: rgb(50, 50, 50);
            border-radius: 5px;
            width:70px;
            height: 30px;
        }
        .searchTable>input:hover{
            font-weight: 600;
            background: rgb(220, 220, 220);
        }
</style>
</head>
<body>
	
    <div class="wrap">
 	    
 	      <%@ include file="../common/adminMenubarForInclude.jsp" %>
 	      
 	      
        <div id="content" align="center">

            <br><br>
            <div class="searchTable" align="left">
                <input type="button" name="consultAnswer" id="answerNo" value="미답변">
                <input type="button" name="consultAnswer" id="answerYes" value="답변">
            </div>
            <br><br>
            
              <table id="userTable" class="userTable" style="text-align: center;">
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
	                <td colspan="6">존재하는 상담내역이 없습니다.</td>
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
	                  <button type="button" id="delete" style="float: right;" onclick="location.href ='<%=contextPath%>/deleteAdmin.co?no=<%=c.getConsultNo()%>'">게시물삭제</button> 
	                  </td>
	                </tr>
	                <%} %>
	            <%} %>          
    			</tbody>
              </table>
              
              <script>
                $(function(){
                    $(".userTable>tbody>tr").click(function(){
                        location.href = "<%=contextPath%>/detailAdmin.co?no=" + $(this).children().eq(0).text();
                    })
                })
            </script>
              </div>            
        </div>
       </div>
        
      <!-- ajax부분 -->
      <script>
      // 답변 미답변 조회 AJAX
      $j("#search").on("click",function(){
        var ch = $j('input:checked').val();
        if(ch==null){
          alert("체크 하세요");
          return false;
        }
        
        
        var $frm = $j("input[class=checktype]:checked");
        var param = $frm.serialize();
        
        var table = document.getElementById('boardTest');
        
        $j.ajax({
            url : "<%=contextPath%>/searchAnswer.co",
            dataType: "json",
            type: "POST",
            data : param,

            success: function(data)
            {
              console.log(data.list.length)
              
              $j('#cntbox').html("total : " + data.totalCnt);
              //데이터를 새로 뿌리기 위해 이전 표를 지움 
              var trlength = $j('#boardTest tr').length;
              for(var t=trlength-1;t>0;t--){
                table.deleteRow(t);
              }
              //데이터 뿌리기 
              for(var i=0;i<data.list.length;i++){
              $j('#boardTest').append("<tr><td align='center'>" + data.codeMap[data.list[i].boardType] + "</td>" +
                            "<td>" + data.list[i].boardNum + "</td>" +
                            "<td><a href= '/board/" + data.list[i].boardType 
                                + "/" + data.list[i].boardNum 
                                + "/boardView.do?pageNo=" ;
              }
            },
            error: function ()
            {
              alert("검색실패");
              
            }
        });	
      }); 
    </script>  
     	

</body>
</html>