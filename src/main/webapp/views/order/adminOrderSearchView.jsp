<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, com.odd.order.model.vo.AdminOrder, com.odd.order.model.vo.OrdPro" %>

<%
	ArrayList<AdminOrder> list = (ArrayList<AdminOrder>)request.getAttribute("list");

	String userName = request.getParameter("userName");
	String lowPrice = request.getParameter("lowPrice");
	String highPrice = request.getParameter("highPrice");
	String require = request.getParameter("require");
	String cpage = request.getParameter("cpage");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 배송 처리</title>

<style>
    
    .list-area{
        border: 1px solid white;
        text-align: center;
        font-size: 80%;
    }
    
    .list-area>tbody>tr:hover{
    	background:gray;
    	cursor:pointer;
    }

	#searchForm input{
		width:50%;
	}
	
	.form-control{
        width: 150px;
        height: 50%;
    }
	
	.table-bordered{
		overflow:hidden; white-space:nowrap;
        font-size: 90%;
	}
	
	.delete{
		height: 50px;
		text-align: right;
	}
	
	#deleteBTN{
		float:left;
		margin-left:10px;
	}
	
    .enrollTB{
        font-size: 80%;
    }
    
    .enrollTB1 th{
        text-align: center;
    }
    .enrollTB2{
        text-align: center;
    }
    
    .enrollTB1 img{
    	object-fit: cover;
   		width:150px;
   		height:150px;
    }
    
    .enrollTB2 img{
    	object-fit: cover;
    	width:250px;
   		height:180px;
    }
    
    #content{
   	    z-index:-1;
    }
    
     #header{
   	    z-index:-1;
     }
     
      #searchForm th{
   	 	text-align:center;
   	 	width:140px;
   	 }
   	 
</style>

</head>

<body>
	<div class="wrap">
 	    
 	    <%@ include file="../common/adminMenubarForInclude.jsp" %>

		<!-- 관리자 로그인 확인 -->
		<% if(loginAdmin == null) { %>
		<script>
			alert("로그인 후 사용해주시기바랍니다.");
			history.back();
		</script>
		<% } %>
		
        <div id="content" align="center">
        
            <br>
            <h2>배송 가능한 주문 
            	<span class="font-italic font-weight-lighter" style="font-size:0.4em;">결제 완료, 배송 시작 전</span>
           	</h2>
            <br>
			
			<!-- 상하 스크롤바 -->
			<div style="width:100%; height:350px; overflow:auto; white-space: nowrap;">
			 
			   <!-- 주문 검색 결과 테이블 -->				
               <table class="list-area table" >
                   <thead>
                       <tr style="white-space: nowrap;">
                           <th width="50px">배송여부</th>
                           <th width="10px">주문번호</th>
                           <th width="25px">고객이름</th>
                           <th width="170px">배송지</th>                           
                           <th width="15px">최종결제금액</th>
                           <th width="300px">배송시 요청 사항</th>
                           
                       </tr>
                   </thead>
                   <tbody>
                   
                       <%if (list.isEmpty()){ %>
                       <tr>
                           <td colspan="6"> 조회된 주문이 없습니다.</td>
                       </tr>
                       <%}else{ %>
                           <% for(AdminOrder o : list){ %>
	                       <tr role="button" data-toggle="modal" data-target="#myModal">
	                                                      
	                           <td><%= o.getDelivery() %></td>
	                           <td><%= o.getOrdNo() %></td>
	                           <td><%= o.getUserName() %></td>
	                           <td><%= o.getDelAdd() %></td>
	                           <td><%= o.getTotalPrice() %></td>
	                           <td><%= o.getRequire() %></td>
	                          
	                       </tr>
                           <%} %>
                       <%} %>  
                       
                       
                   </tbody>
               </table>
            </div>
               
            <br><br><br>
       		
       		<!-- 
       			>> 배송 가능한 상품
       			   
       			   결제 O
       			   배송 X
       			   
       			   -> 기본 검색 조건으로 추가
       			 
       		 -->
       		<form id="searchForm" action="<%=contextPath%>/search.adOrd" method="post">
				  <input type="hidden" name="cpage" value="2" >

                  <table class="table-bordered" style="width:700px">
                   
                    
                    <tr>
                        <th>고객명</th>
                        <td>
                            <input type="text" class="form-control-sm" name="userName" style="width:300px"> 
                        </td>
                    </tr>
                    
                    <tr>
                        <th>요청사항</th>
                        <td>
                            <input type="text" class="form-control-sm" name="require" style="width:300px"> 
                        </td>
                    </tr>
                    
                    <tr>
                        <th>최종 결제 금액</th>
                        <td>
                            <div class="input-group-prepend input-group-sm">
                                <input type="text" class="form-control" name="lowPrice" placeholder="원"> 
                                <span style="font-size: 130%;">~</span>
                                <input type="text" class="form-control" name="highPrice" placeholder="원">
                            </div>
                    </td>
                    </tr>
                  </table>
				  
				  <script>
       		
	       		<!-- 검색 폼의 값을 다시 채워줌 --> 
				$(function(){
	 	    		
	 	    		let userName = "<%=userName%>";
	 	    		let lowPrice = "<%=lowPrice%>";
	 	    		let highPrice ="<%=highPrice%>";
	 	    		let require ="<%=require%>";
	 	    		
	 	    		<!-- 최초 페이지가 아닐 경우 -->
	 	    		if(<%=cpage%> != 1){
						
						$("input[name='userName']").val(userName);
						$("input[name='lowPrice']").val(lowPrice);
						$("input[name='highPrice']").val(highPrice);
						$("input[name='require']").val(require);
	 	    		}	
	 	    	});
				
       		</script>	
				  
				  <br>
				  <button type="submit" class="btn btn-primary">검색</button>
			</form>
			
   		</div>
   		
   		<script>
   		 $(function(){
   				$(".list-area>tbody>tr").click(function(){
 					$(location).attr("href", "<%=contextPath%>/select.adOrd?ordNo=" + $(this).children().eq(1).text());
 					
			})
   		})
 		</script>
       
     
        
    </div>
</body>
</html>